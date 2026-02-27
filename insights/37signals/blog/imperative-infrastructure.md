---
title: Imperative Infrastructure
description: "Prefer explicit step-by-step infra over declarative state magic, Kamal over K8s"
source:
  type: blog
  title: Leaning imperative
  author: Arman Jindal
  url: https://dev.37signals.com/leaning-imperative/
  date: '2023-09-05'
tags:
- infrastructure
- devops
---

# Imperative Infrastructure

Prefer explicit, step-by-step infrastructure over declarative "desired state" abstractions.

## Core Principles

- **Show your work** -- imperative tooling makes each step visible, like showing work in a math problem
- **Hiding complexity is technical debt** when that complexity needs to be managed and debugged
- **Manual scaling is a feature** -- deliberate capacity planning forces understanding of resource needs
- **Decouple systems** -- purpose-driven configurations that can be upgraded in isolation, not shared interdependent cookbooks

## Tool Philosophy

| Prefer | Over | Why |
|--------|------|-----|
| Kamal | Kubernetes | Simpler deployment without control plane overhead |
| Chef (thin recipes) | Complex declarative manifests | Readable, single-screen configurations |
| KVM + cloud-init | Managed container orchestration | Direct VM control with fast provisioning |
| Docker (for apps) | Docker (for everything) | Containers for app complexity, not infrastructure |

## Applicability to Smaller Apps

The philosophy scales down well:

- **Prefer simple Kamal deploy** over complex CI/CD pipelines with auto-scaling
- **Understand your infrastructure** -- do not adopt abstractions you cannot debug
- **Fewer moving parts** -- each layer of orchestration is a layer of failure modes
- **Explicit over magical** -- a deploy script you can read beats a declarative config you cannot trace
