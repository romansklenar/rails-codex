---
title: "Kamal: Hot Deployment Tool to Watch—or a Total Game Changer?"
description: "Objective analysis of Kamal (formerly MRSK) as a Docker container deployment tool compared to Kubernetes, Heroku, and cloud-managed services, covering use cases, limitations, and decision criteria"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Kirill Kuznetsov"
  url: "https://evilmartians.com/chronicles/mrsk-hot-deployment-tool-or-total-game-changer"
  date: '2024-04-02'
tags:
- kamal
- deployment
- docker
- kubernetes
- infrastructure
- devops
- containers
- capistrano
---

# Kamal: Hot Deployment Tool to Watch—or a Total Game Changer?

Evil Martians' SRE team provides an objective analysis of Kamal's promises, applications, and pitfalls to help teams decide whether it's the right deployment tool for their project.

## What Is Kamal

- Kamal (formerly MRSK) is a container deployment CLI tool created by DHH, the creator of Ruby on Rails
- Conceptually indebted to Capistrano: "Kamal marries the procedural simplicity of Capistrano with the advantages of modern containerization techniques"
- Designed as an imperative tool that does not hide complex logic under declarative abstractions
- Written as a Ruby gem — forkable and customizable
- Standalone CLI that runs from a Docker container, local machine, or CI/CD workflow
- Requires only: target servers (VPS, EC2, bare metal) and a container registry

## The Deployment Landscape Before Kamal

- `Heroku`, `Fly.io`, `Render` — excellent DX, recommended for early-stage projects, but costs can skyrocket as scale grows
- `Kubernetes` — best at-scale solution, huge ecosystem, managed on AWS EKS / GCP GKE / DigitalOcean, but steep learning curve
- `Nomad` — requires experienced teams, small community
- `Mesos` — steeper learning curve than Kubernetes, limited ecosystem
- `Docker Swarm` — simpler but not as configurable, no robust community or cloud adoption
- `Amazon ECS` / `Google Cloud Run` — vendor lock-in, require vendor-specific knowledge, complex additional tooling
- `Ansible`, `Chef`, `Puppet` — universal configuration tools, not tailored for container build/deploy workflows

## Key Benefits of Kamal

- Simple and minimalistic: requires no vast infrastructure knowledge to get started
- No vendor lock: runs anywhere that can SSH to target servers
- YAML configuration merging via "destinations" concept: define a base config, add per-environment overrides for staging/review apps
- App health checks before spinning up new containers, preventing total outages
- Easy log grepping tool for setups without dedicated log aggregation
- Fast rollback: containers can be quickly rolled back
- ENV file templating using Rails credentials by default
- Deploy lock mechanism: prevents concurrent deploys, enables maintenance windows
- "Accessories" section: deploy supporting containers (Redis, search, cache) to designated servers, not restarted on every `kamal deploy`

## Application Management Commands

- Run command on all servers (e.g., `kamal run`)
- Run command on primary server only
- Interactive session in a separate container (e.g., Rails task for production fixes)
- Commands in currently running app container (for debugging live processes)

## Notable Version Improvements

- v1.0.0: improved zero-downtime deployment process
- v1.1.0: improvement to run one-time tasks like database migrations
- v1.3.0: background jobs without requiring Traefik setup
- v1.4.0: cross-architecture local builds support
- Handbook by Josef Strzibny available as supplementary documentation

## Points to Consider (Limitations)

- Does not offer new secret tools to speed up deployment times — Docker build speed still depends on server speed, `Dockerfile` quality, app size, layer caching, network speed, and app startup time
- Not a cloud-to-bare-metal migration tool: has no tooling to aid bare-metal server management or provisioning
- Setting up a fleet of bare metal servers requires specialized knowledge: provisioning, network rules, load balancers, backup systems, monitoring, log aggregation, image registries
- Adding a PostgreSQL container to `accessories` is fine for demos/review apps but not production without significant configuration effort — managed database services are still advisable
- No built-in monitoring or log aggregation solution: teams must bring their own (Prometheus + Grafana + ELK/Loki, or New Relic for small setups)
- Documentation was historically weak, though a proper handbook now exists
- Hype around 37signals' migration to bare metal conflates Kamal with their entire custom infrastructure stack (Chef, custom VM provisioning, etc.)

## Decision Guide: Should You Use Kamal?

- Stay on `Heroku`/`Fly.io`/`Render` if they fit and you're happy: save time and avoid ops complexity
- Use Kamal if you prefer VPS or bare metal over public clouds
- Leave Kubernetes in place if you already have it comfortable — don't migrate just for Kamal
- Use Kubernetes (not Kamal) if your app has regular usage spikes requiring frequent auto-scaling
- Investigate Kamal if you find Kubernetes too difficult but want containerized deployments
- Kamal is best suited for teams with some infrastructure expertise who want simplicity over power

## Who Benefits Most

- Small-to-medium projects leaving Heroku due to cost that can't yet justify Kubernetes complexity
- Teams comfortable with SSH-based deployments seeking modern containerization without orchestrator overhead
- Projects needing quick review apps or staging environments via the destinations/config-merging feature
- Engineers who want imperative, readable deployment scripts rather than declarative reconciliation loops
