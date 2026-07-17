#!/usr/bin/env python3
"""Generate navigation index.md files for the mechanically-extracted
`references/` and `style-guide/` trees.

These trees are NOT part of the OKF bundle (their files have no OKF
frontmatter); the generated index.md files are plain Markdown navigation
aids, kept current by `make references` / `make style-guide`.

Usage: generate_indexes.py [references|style-guide|all]
"""
import os, re, sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

AREA_TITLES = {
    "rails": "Rails Guides",
    "hotwire-native": "Hotwire Native",
    "stimulus": "Stimulus",
    "strada": "Strada",
    "turbo": "Turbo",
    "kamal": "Kamal",
}
SUBDIR_TITLES = {
    "guides": "Guides", "overview": "Overview", "reference": "Reference",
    "handbook": "Handbook", "docs": "Docs", "commands": "Commands",
    "configuration": "Configuration", "hooks": "Hooks",
    "installation": "Installation", "upgrading": "Upgrading", "search": "Search",
}

def titleize(slug):
    return re.sub(r"[_-]+", " ", slug).strip().title()

def doc_title(path):
    """First real heading: skip the 'DO NOT READ' preamble; handle Setext (===)
    and ATX (# ) headings; fall back to a titleized filename."""
    try:
        lines = open(path, encoding="utf-8").read().split("\n")
    except OSError:
        return titleize(os.path.basename(path)[:-3])
    for i, l in enumerate(lines[:15]):
        s = l.strip()
        if not s or s.startswith("**") or s.startswith("<"):
            continue
        if s.startswith("# "):
            return s[2:].strip()
        if i + 1 < len(lines) and re.fullmatch(r"=+", lines[i + 1].strip()) and s:
            return s  # Setext H1
    return titleize(os.path.basename(path)[:-3])

def walk_md(root):
    out = []
    for dirpath, _, names in os.walk(root):
        for n in sorted(names):
            if n.endswith(".md") and n != "index.md":
                out.append(os.path.join(dirpath, n))
    return sorted(out)

def gen_references():
    base = os.path.join(REPO, "references")
    lines = [
        "# References", "",
        "> Documentation mechanically extracted from upstream git submodules "
        "(Rails guides, Hotwire, Kamal, RuboCop) via `make references`. These "
        "files are **not** part of the OKF bundle — they carry no OKF frontmatter. "
        "Regenerate this index with `make references-index`.", "",
    ]
    for area in ["rails", "hotwire-native", "stimulus", "strada", "turbo", "kamal"]:
        adir = os.path.join(base, area)
        if not os.path.isdir(adir):
            continue
        files = walk_md(adir)
        if not files:
            continue
        lines += [f"## {AREA_TITLES.get(area, titleize(area))}", ""]
        cur_sub = None
        for f in files:
            rel = os.path.relpath(f, base)                      # e.g. rails/guides/x.md
            parts = rel.split(os.sep)
            sub = parts[1] if len(parts) > 2 else None          # subdir under area
            if sub != cur_sub:
                cur_sub = sub
                if sub:
                    lines += ["", f"### {SUBDIR_TITLES.get(sub, titleize(sub))}", ""]
            lines.append(f"* [{doc_title(f)}]({rel})")
        lines.append("")
    write(os.path.join(base, "index.md"), "\n".join(lines).rstrip() + "\n")

def gen_style_guide():
    base = os.path.join(REPO, "style-guide")
    files = sorted(f for f in os.listdir(base) if f.endswith(".adoc"))
    lines = [
        "# Style Guides", "",
        "> RuboCop community style guides extracted from upstream submodules via "
        "`make style-guide`. Not part of the OKF bundle. Regenerate this index "
        "with `make style-guide-index`.", "",
    ]
    for f in files:
        lines.append(f"* [{titleize(f[:-5])} Style Guide]({f})")
    write(os.path.join(base, "index.md"), "\n".join(lines) + "\n")

def write(path, text):
    text = re.sub(r"\n{3,}", "\n\n", text)   # collapse extra blank lines
    open(path, "w", encoding="utf-8").write(text)
    print("wrote", os.path.relpath(path, REPO))

if __name__ == "__main__":
    what = sys.argv[1] if len(sys.argv) > 1 else "all"
    if what in ("references", "all"):
        gen_references()
    if what in ("style-guide", "all"):
        gen_style_guide()
