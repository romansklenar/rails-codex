---
title: QA Practices
source:
  type: blog
  title: All about QA
  author: Michael Berger and Gabriel Monette
  url: https://dev.37signals.com/all-about-qa/
  date: '2024-10-15'
tags:
- process
- testing
---

# QA Practices

37signals' QA philosophy: guided exploration over exhaustive test scripts, late involvement to preserve objectivity.

## When to Start QA

- **Wait until the feature is usable** — don't test half-built work
- Preserves tester objectivity by avoiding knowledge of development shortcuts
- Aligns with Shape Up: QA enters after the build phase, not during

## What to Test (Guided Exploration)

Rather than scripted test cases, explore holistically:

- **Discoverability** — can a user find and understand the feature?
- **Cross-feature interactions** — does it break or conflict with existing features?
- **Mobile compatibility** — responsive behavior, touch interactions
- **Performance** — loading time, visual glitches, layout shifts
- **Accessibility** — keyboard navigation, screen readers, ARIA correctness
- **Edge cases** — empty states, long strings, concurrent usage

## QA Workflow (Shape Up Cycles)

| Phase | QA Role |
|-------|---------|
| **Kickoff** | Early feedback on accessibility and UX considerations |
| **Development** | Step back — let the team focus without interruption |
| **Testing** | Track with card columns: Ready for QA / In Progress / Pending Input |
| **Review** | Document findings as **suggestions, not requirements** |

## QA Feedback Culture

- Feedback is framed as suggestions, not mandates
- Developers decide what to act on based on scope and priority
- Triage column separates "found" from "accepted" issues

## Testing Techniques & Tools

- **Visual regression** — automated screenshot comparison (production vs beta)
- **Accessibility validation** — keyboard-only navigation, screen reader testing (NVDA), browser extensions (axe, Accessibility Insights, Headings Map)
- **QA Considerations templates** — ~100-item checklists per product covering broad concepts and platform-specific details
- **Real user feedback** — involve users who depend on accessibility features

## Adoption Notes

- Adopt guided exploration for feature review over scripted QA
- Frame PR review comments and QA findings as suggestions with context
- Keep accessibility checklists lightweight — test keyboard nav and screen readers on key flows
- Visual regression tooling is worth considering as the component library grows
