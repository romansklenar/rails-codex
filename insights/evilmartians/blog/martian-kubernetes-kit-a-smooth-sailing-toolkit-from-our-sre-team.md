---
title: "Martian Kubernetes Kit: A Smooth-Sailing Toolkit from Our SRE Team"
description: "Evil Martians' turnkey Kubernetes configuration package built on Terragrunt/Terraform, Argo CD, Prometheus, Grafana Loki, and GitOps principles to reduce adoption complexity for client projects"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Kirill Kuznetsov"
  url: "https://evilmartians.com/chronicles/martian-kubernetes-kit-a-smooth-sailing-toolkit-from-our-sre-team"
  date: '2023-12-20'
tags: [kubernetes, infrastructure, devops, terraform, argo-cd, prometheus, grafana, gitops, preview-apps, helm]
---

# Martian Kubernetes Kit: A Smooth-Sailing Toolkit from Our SRE Team

Evil Martians' SRE team introduces a battle-tested, turnkey Kubernetes configuration package that de-complexifies cluster adoption through GitOps, open-source monitoring, and automated preview apps.

## Why Kubernetes Over Alternatives

- Kubernetes is the most advanced container orchestration solution: vast ecosystem, extreme flexibility, and handles a huge number of edge cases
- All major cloud providers offer managed Kubernetes: AWS EKS, GCP GKE, DigitalOcean, and others
- Clients on AWS ECS managed by CloudFormation could have saved tens of thousands of dollars by switching to Kubernetes for custom architecture changes
- Running 20–30 full enterprise-level preview apps simultaneously is significantly cheaper and more seamless on the right Kubernetes setup
- Applications with specific peak times and fluctuation loads benefit from Kubernetes' configurable autoscaling
- Complex, scalable on-premise applications benefit from Kubernetes' predictable, uniform environment
- Kubernetes is not vendor-locked in the modern world (unlike AWS ECS / GCP Cloud Run)

## The Problem: Bare Kubernetes Clusters Lack Everything

- A fresh managed Kubernetes cluster (even on AWS EKS) ships with nothing: no monitoring, no log aggregation, no deployment tooling
- Each new client project required repeating the same Kubernetes setup work — motivating the creation of a shared base configuration
- Without a standardized toolkit, infrastructure becomes hard to keep up-to-date and hard to transfer between teams

## What Is Martian Kubernetes Kit

- A turnkey Kubernetes configuration package used and maintained for Evil Martians' clients
- Provides a full Kubernetes experience out-of-the-box: monitoring, log aggregation, preview apps, CI/CD, secret management
- Built entirely from open-source tools — no proprietary components or Evil Martians vendor lock
- Designed for transferability: any engineer can pick up and continue supporting the infrastructure independently

## GitOps Infrastructure as Code

- Infrastructure managed with `Terragrunt`/`Terraform` for cloud provider setup (AWS and GCP supported)
- Cluster contents managed with `Argo CD` for continuous delivery and Kubernetes resource management
- `Argo CD` provides proper rollback management and a UI accessible to more developers
- `Argo CD` also manages the full set of kit components, enabling coordinated upgrades across all client clusters
- Without Martian Kubernetes Kit, all of this must be manually configured from scratch

## Economic Open Source Monitoring

- Replaces expensive SaaS options like DataDog and the difficult-to-use AWS CloudWatch
- Every Kubernetes-ready component exposes metrics in Prometheus format — instant coverage
- Stack: `Prometheus` + `Grafana` — amount of data collected from a default Prometheus setup far exceeds typical CloudWatch coverage
- Monitoring and metrics visible in same Grafana instance as log exploration

## Log Aggregation with Grafana Loki

- `Grafana Loki` included by default as log aggregation solution
- Accessible via same Grafana instance used for monitoring — unified observability interface
- Usually cheaper than alternatives, including other open-source options

## Automated Preview Apps

- Label a pull request on GitHub → get a full copy of the application running automatically
- Close or unlabel the PR → copy is automatically removed
- `Argo CD` manages the preview app lifecycle
- Clients have run up to 30 full enterprise-level preview apps simultaneously
- Designed to be easily adoptable: a major focus of the kit's development effort

## Predictable Cluster Upgrades

- Kubernetes ecosystem evolves rapidly; outdated clusters create maintenance debt
- Martian Kubernetes Kit enables 2–3 full cluster upgrades per year across all clients using it
- Clients who previously struggled to keep infrastructure up-to-date now receive predictable, coordinated upgrades

## Additional Kit Components

- Flexible secret management integration
- CI/CD workflows prepared for numerous deployment scenarios
- Certificate management (`cert-manager` or equivalent)
- Convenient scripts and Helm chart templates for quality-of-life improvements
- Helm charts exist for Evil Martians' own tools: `AnyCable` and `imgproxy`

## Real Client Case Studies

- Client on AWS ECS + CloudFormation: needed to add AnyCable with metrics, fix deployment process (unwieldy with bare CloudFormation), and get alerts for database and deployments — all included out-of-the-box in Martian Kubernetes Kit
- Client with no prior Kubernetes knowledge: now runs their cluster independently, with Evil Martians providing only periodic updates and rare fixes

## When to Move to Kubernetes

- Major signal: you need something your current platform can't provide — better autoscaling, lower infrastructure costs, fewer limitations, microservices integration, custom databases
- Kubernetes is worth considering if the long-term cost/benefit of bending your current platform is unfavorable
- Not appropriate for every project: weigh the cost/benefit tradeoff carefully
- Use the quickstart guide from the next article in the series to assess readiness

## Series Structure

- Part 1 (this article): overview and business case for the Martian Kubernetes Kit
- Part 2: technical secrets and implementation details of the toolkit
- Part 3: running apps and running them well on Kubernetes
