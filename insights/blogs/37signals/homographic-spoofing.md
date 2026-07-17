---
type: insight
title: Homographic Spoofing Detection
description: "Unicode homograph attack detection for domains and emails via basecamp/homographic_spoofing gem"
resource: "https://dev.37signals.com/homographic-spoofing/"
tags:
- security
- ruby
timestamp: "2026-03-02"
source:
  type: blog
  title: 'Homographic Spoofing: a new Ruby toolkit'
  author: Jacopo Beschi
  url: https://dev.37signals.com/homographic-spoofing/
  date: '2024-06-25'
---

# Homographic Spoofing Detection

Ruby gem for detecting Unicode homograph attacks in domain names and email addresses.

## The Attack

Attackers substitute visually identical Unicode characters for ASCII ones:

```
paypal.com   ← legitimate (Latin 'l')
paypaӏ.com   ← spoofed (Cyrillic 'ӏ' looks like 'l')
```

Users cannot distinguish these visually. IDN (Internationalized Domain Name) support makes this possible in real domains.

## The Gem

```ruby
# Gemfile
gem "homographic_spoofing"
```

GitHub: `basecamp/homographic_spoofing`

## How It Works

- Follows **Unicode Technical Standard #39** (UTS #39) for identifying confusable characters
- Selectively converts suspicious domains to **Punycode** (ASCII-compatible encoding) only when a security risk is detected
- Does not blindly convert all international domains — legitimate non-Latin domains remain readable

## When to Apply

- **Email display** — when showing sender addresses to users (phishing prevention)
- **URL display** — when rendering user-submitted links
- **Domain validation** — when accepting domain input from users

## Relevance

Relevant if the platform displays external email addresses or URLs from untrusted sources (e.g., client-provided contact info, partner message headers). Consider integrating if email/URL display is user-facing.
