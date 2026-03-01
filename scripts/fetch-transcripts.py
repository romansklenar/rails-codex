#!/usr/bin/env python3
"""
Download and extract REWORK podcast transcripts from 37signals.com.
Skips episodes that already have a .md file in the output directory.
"""

import json
import os
import re
import subprocess
import sys
import time
from html.parser import HTMLParser
from pathlib import Path

BASE_URL = "https://37signals.com/podcast"
EPISODES_FILE = "insights/37signals/.podcast-episodes.json"
OUTPUT_DIR = "insights/37signals/podcast"
TMP_DIR = "/tmp/podcast-pages"


class TranscriptExtractor(HTMLParser):
    """Extract transcript section from podcast episode HTML."""

    def __init__(self):
        super().__init__()
        self.in_transcript = False
        self.in_p = False
        self.in_strong = False
        self.transcript_parts = []
        self.current_line = ""
        self.found_transcript_heading = False
        self.tag_stack = []
        self.description = ""
        self.in_meta_desc = False
        self.past_transcript = False

    def handle_starttag(self, tag, attrs):
        attrs_dict = dict(attrs)

        # Capture og:description for the file description
        if tag == "meta":
            if attrs_dict.get("property") == "og:description":
                self.description = attrs_dict.get("content", "")

        if self.past_transcript:
            return

        self.tag_stack.append(tag)

        if tag == "h2":
            self.in_transcript = False  # reset, check content

        if self.found_transcript_heading:
            if tag == "p":
                self.in_p = True
                self.current_line = ""
            elif tag == "strong" and self.in_p:
                self.in_strong = True
            elif tag in ("h2", "h1", "footer", "nav", "section") and tag != "p":
                # End of transcript section
                if self.transcript_parts:
                    self.past_transcript = True

    def handle_endtag(self, tag):
        if self.past_transcript:
            return

        if self.tag_stack and self.tag_stack[-1] == tag:
            self.tag_stack.pop()

        if tag == "strong":
            self.in_strong = False
        elif tag == "p" and self.found_transcript_heading:
            self.in_p = False
            line = self.current_line.strip()
            if line:
                self.transcript_parts.append(line)
            self.current_line = ""

    def handle_data(self, data):
        if self.past_transcript:
            return

        # Check for "Transcript" heading
        if self.tag_stack and self.tag_stack[-1] == "h2":
            if data.strip().lower() == "transcript":
                self.found_transcript_heading = True
                return

        if self.found_transcript_heading and self.in_p:
            text = data.strip()
            if not text:
                return
            if self.in_strong:
                # Speaker/timestamp line - format as bold
                self.current_line += f"**{text}**"
            else:
                if self.current_line.endswith("**"):
                    self.current_line += " " + text
                else:
                    self.current_line += text

    def get_transcript(self):
        return "\n\n".join(self.transcript_parts)


def download_page(slug):
    """Download a podcast episode page to tmp directory."""
    os.makedirs(TMP_DIR, exist_ok=True)
    tmp_path = os.path.join(TMP_DIR, f"{slug}.html")

    if os.path.exists(tmp_path) and os.path.getsize(tmp_path) > 1000:
        return tmp_path

    url = f"{BASE_URL}/{slug}/"
    result = subprocess.run(
        ["curl", "-sL", "--max-time", "30", url],
        capture_output=True, text=True
    )

    if result.returncode == 0 and len(result.stdout) > 1000:
        with open(tmp_path, "w") as f:
            f.write(result.stdout)
        return tmp_path
    else:
        print(f"  FAILED to download {slug}", file=sys.stderr)
        return None


def extract_transcript(html_path):
    """Extract transcript from downloaded HTML file."""
    with open(html_path, "r") as f:
        html = f.read()

    parser = TranscriptExtractor()
    parser.feed(html)

    return parser.get_transcript(), parser.description


def write_markdown(slug, title, transcript, description):
    """Write the transcript markdown file."""
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    out_path = os.path.join(OUTPUT_DIR, f"{slug}.md")

    # Clean up description
    if not description:
        description = f"Transcript of the REWORK podcast episode: {title}"
    # Truncate long descriptions to first sentence
    desc_clean = description.split(". ")[0].rstrip(".") + "." if ". " in description else description
    # Escape quotes in description
    desc_clean = desc_clean.replace('"', '\\"')

    content = f"""---
title: "{title}"
description: "{desc_clean}"
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: {BASE_URL}/{slug}/
tags:
- podcast
---

# {title}

{transcript}
"""

    with open(out_path, "w") as f:
        f.write(content)
    return out_path


def main():
    with open(EPISODES_FILE) as f:
        episodes = json.load(f)

    # Find remaining episodes
    existing = set()
    if os.path.isdir(OUTPUT_DIR):
        for fname in os.listdir(OUTPUT_DIR):
            if fname.endswith(".md"):
                existing.add(fname[:-3])

    remaining = [ep for ep in episodes if ep["slug"] not in existing]
    print(f"Total: {len(episodes)}, Done: {len(existing)}, Remaining: {len(remaining)}")

    if not remaining:
        print("All episodes already downloaded!")
        return

    # Phase 1: Download all pages
    print(f"\n--- Phase 1: Downloading {len(remaining)} pages ---")
    downloaded = {}
    for i, ep in enumerate(remaining):
        slug = ep["slug"]
        print(f"  [{i+1}/{len(remaining)}] Downloading {slug}...", end=" ", flush=True)
        path = download_page(slug)
        if path:
            downloaded[slug] = (path, ep)
            print("OK")
        else:
            print("FAILED")
        # Small delay to be polite
        if i % 10 == 9:
            time.sleep(1)

    # Phase 2: Extract transcripts
    print(f"\n--- Phase 2: Extracting {len(downloaded)} transcripts ---")
    success = 0
    no_transcript = 0
    for i, (slug, (html_path, ep)) in enumerate(downloaded.items()):
        print(f"  [{i+1}/{len(downloaded)}] Extracting {slug}...", end=" ", flush=True)
        transcript, description = extract_transcript(html_path)
        if transcript:
            write_markdown(slug, ep["title"], transcript, description)
            success += 1
            print("OK")
        else:
            # Write file with no transcript note
            write_markdown(slug, ep["title"], "*No transcript available on the episode page.*", description)
            no_transcript += 1
            print("NO TRANSCRIPT")

    print(f"\n--- Done ---")
    print(f"  Written: {success}")
    print(f"  No transcript: {no_transcript}")
    print(f"  Failed download: {len(remaining) - len(downloaded)}")
    total_now = len(existing) + success + no_transcript
    print(f"  Total files: {total_now}/{len(episodes)}")


if __name__ == "__main__":
    main()
