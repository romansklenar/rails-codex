---
title: "Better Navigation Patterns"
source: https://dev.37signals.com/better-navigation-in-hey/
description: "Trusted referrer back navigation, hierarchical safety nets, simpler over clever"
tags: [hotwire, ux]
---

# Better Navigation Patterns

UX design story, not a coding standard. Summary retained for reference.

## Context

HEY replaced a confusing "home button disguised as back button" with a proper back button. The post describes design decisions, not implementation patterns.

## Key Takeaways

- **Trusted referrer check** — back navigation should verify the referrer is within the app, never navigate to an external site (e.g., a shared link that opened the app)
- **Hierarchical safety net** — repeated back actions should eventually reach the app's root, not trap users in loops
- **Subnavigation consistency** — settings/section pages should always show section nav so users know where they are
- **Simpler beats clever** — the team rejected `history.back()` and Turbo `restorationData` in favor of a simple referrer-based approach with fewer edge cases

## What Was NOT Used

- Browser `history.back()` (unreliable, can exit the app)
- Turbo's `restorationData` (too many edge cases)
- Custom navigation state management
