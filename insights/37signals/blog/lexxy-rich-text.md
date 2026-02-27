---
title: 'Lexxy: Rich Text Editor for Rails'
description: "Lexical-based Action Text editor with proper HTML semantics, Markdown support, configurable editor interface"
source:
  type: blog
  title: 'Lexxy: A new rich text editor for Rails'
  author: Jorge Manrubia
  url: https://dev.37signals.com/announcing-lexxy-a-new-rich-text-editor-for-rails/
  date: '2025-09-04'
tags:
- rails
- rich-text
---

# Lexxy: Rich Text Editor for Rails

Action Text editor built on Meta's Lexical framework. Replacement for Trix when richer editing features are needed.

## Why Not Trix

Trix had limitations 37signals couldn't work around — Lexxy was built to address those gaps while staying integrated with Action Text and Active Storage.

## Key Features

- **Proper HTML semantics** — paragraphs are real `<p>` tags (not Trix's `<div>` wrappers)
- **Markdown support** — shortcuts and auto-formatting when pasting Markdown content
- **Code syntax highlighting** — real-time in the editor
- **Smart link creation** — paste a URL onto selected text to create a link
- **Configurable prompts** — supports mentions and interactive elements with multiple loading/filtering strategies
- **Rich attachment previews** — PDF and video previews, not just file icons
- **Action Text + Active Storage integration** — drop-in replacement within Rails

## Architecture

Lexxy introduces a configurable editor interface for Action Text — "configure the editor in Action Text just like you configure the database in Active Record." This means:

- Action Text becomes editor-agnostic (Trix, Lexxy, or future editors)
- Editor choice is a configuration concern, not a code rewrite

## Status

Early beta (September 2025). Available at `basecamp/lexxy` on GitHub.

## When to Evaluate

Worth considering when adding rich text editing to a Rails app. The configurable editor architecture in Action Text (editor as a swappable dependency) is the more impactful pattern for any project.
