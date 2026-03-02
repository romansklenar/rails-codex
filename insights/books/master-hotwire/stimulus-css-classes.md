---
title: "Stimulus CSS Classes"
description: "CSS class definitions, generated properties, progressive enhancement pattern"
source:
  type: documentation
  title: "Stimulus Handbook"
  author: "Hotwire / Basecamp"
  url: "https://stimulus.hotwired.dev"
tags: [stimulus, css, javascript]
---

# Stimulus CSS Classes

Logical CSS class names managed by controllers.

## Definition & HTML
```javascript
static classes = [ "loading", "noResults" ]
```
```html
<form data-controller="search"
      data-search-loading-class="search--busy"
      data-search-no-results-class="search--empty">
</form>
```

## Generated Properties
For `loading` class:
- `this.loadingClass` → String (first class)
- `this.loadingClasses` → Array (all classes split by space)
- `this.hasLoadingClass` → Boolean

## Multiple Classes
```html
<form data-search-loading-class="bg-gray-500 animate-spinner cursor-busy">
```
```javascript
this.element.classList.add(...this.loadingClasses)  // spread for multiple
```

## Progressive Enhancement Pattern
Hide functionality by default, reveal when JS detects support:
```javascript
static classes = [ "supported" ]

connect() {
  if ("clipboard" in navigator) {
    this.element.classList.add(this.supportedClass)
  }
}
```
```css
.clipboard-button { display: none; }
.clipboard--supported .clipboard-button { display: initial; }
```

## Naming Convention
- Definition: `camelCase` (`noResults`)
- HTML: `kebab-case` (`data-search-no-results-class`)
- Property: `camelCase` (`this.noResultsClass`)
