---
title: Cloud Exit
source:
- type: blog
  title: De-cloud and de-k8s -- bringing our apps back home
  author: Farah Schuller
  url: https://dev.37signals.com/bringing-our-apps-back-home/
  date: '2023-03-21'
- type: blog
  title: Our cloud spend in 2022
  author: Fernando Alvarez
  url: https://dev.37signals.com/our-cloud-spend-in-2022/
  date: '2023-01-13'
- type: blog
  title: 37signals datacenter overview
  author: Eron Nicholson
  url: https://dev.37signals.com/37signals-datacenter-overview/
  date: '2023-08-10'
tags:
- infrastructure
- devops
---

# Cloud Exit

37signals moved from AWS/GCP to owned hardware, saving millions annually. Reference summary for infrastructure decision-making.

## Cost Context (2022)

- **$3.2M/year** on AWS ($267K/month)
- Largest items: S3 ($908K), EC2/EKS ($760K), OpenSearch ($520K), RDS ($473K)
- On-prem hardware payback period: ~1 year for equivalent compute

## Migration Strategy

- **Kamal** (originally MRSK) for containerized deployment without Kubernetes
- **Incremental migration**: start with low-risk legacy apps, move critical apps last
- **Zero downtime**: dual-write periods, permission-based cutover enforcement
- Deploy times dropped from minutes to ~1 minute

## Infrastructure (Two Datacenters)

- ~180 servers across Ashburn, VA and Chicago, IL
- Active-active (BGP Anycast) for critical apps; active-standby for others
- EVPN/VXLAN networking with redundancy at every layer

## Relevance to Smaller Apps

This is a 37signals-scale story. For a smaller Rails app:

- **Do not prematurely self-host** -- cloud is fine at small scale
- **Know your costs** -- track cloud spend monthly; evaluate alternatives when it exceeds hardware cost
- **Kamal simplifies deployment** regardless of cloud vs on-prem
- **Avoid Kubernetes** unless you have dedicated ops staff to manage it
