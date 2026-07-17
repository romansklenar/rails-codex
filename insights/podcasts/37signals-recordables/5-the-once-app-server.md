---
type: insight
title: The ONCE App Server
description: "How 37signals turned single-app self-hosted installs into a Nintendo-cartridge-style console that runs multiple Dockerized web apps on one machine with gapless deploys, SQLite storage, and near-zero configuration."
resource: "https://dev.37signals.com/once-app-server/"
tags:
- once
- self-hosting
- docker
- kamal
- kamal-proxy
- deployment
- sqlite
- open-source
- convention-over-configuration
- data-ownership
- rails
- tui
timestamp: "2026-07-17"
source:
  type: talk
  title: The ONCE App Server
  author: David Heinemeier Hansson & Kevin McConnell
  url: https://dev.37signals.com/once-app-server/
  date: '2026-04-17'
---

# The ONCE App Server

ONCE is an open source app server that turns self-hosted web apps into interchangeable cartridges you can install in seconds and run side by side on a single machine, gambling that hardware, Docker, and vibe coding have finally converged to make owning your own software Fisher-Price easy.

## From Single-App Installs to a Multi-App Console

- **Original ONCE business model**: 37signals sold web app software (Campfire, later free Writebook) that you installed and ran on your own machine via one pasted bash command; it worked but wasn't the commercial "rocket ship" needed.
- **The single-machine limitation**: the original install dedicated an entire machine/VM to one app; running a second app (e.g. Campfire users who also wanted Writebook) required a whole second machine — a real blocker for many, even if trivial for 37signals staff.
- **The pivot**: rather than abandon the medium, make Campfire, Writebook, and Fizzy all free and open source, and upgrade the underlying platform so all of them run simultaneously on one box.
- **Three first-party apps ship built in**: Campfire (chat), Writebook (writing), Fizzy (work coordination) — selectable from a multi-select menu at install time.
- **Fizzy's dual license**: shipped under the "O'Saasy" license — do whatever you want on your own installation as long as you don't compete with the 37signals SaaS.

## The Nintendo Cartridge Metaphor

- **Console, not single-game handheld**: the old ONCE was like a Donkey Kong handheld that only plays one game; ONCE is the full NES/SNES with swappable cartridges — cartridge out, cartridge in, it just works.
- **First-party vs third-party cartridges**: Campfire/Writebook/Fizzy are the "Mario Kart / Super Mario / Pilot Wings"; you can also bring your own third-party Docker containers to run right next to them.
- **Software yours forever**: like vintage Nintendos and Segas still running decades later, a ONCE Docker container can run "literally forever" even if 37signals disappears in 15 years — contrast with SaaS-style apps that vanish when the company folds and their servers go dark.
- **Aesthetics as inspiration**: the TUI leans into a playful 80s / Commodore 64 bootscreen vibe to blur the line between developers and consumers and make running your own apps feel fun.

## The Two Rules for a Compatible App

- **Answer on `/up`**: apps must respond on a `/up` health endpoint (or configure where it lives) so ONCE knows when the app is ready to serve — used both at first setup and to enable gapless deploys.
- **Store into `/storage`**: apps get one directory (`/storage`) to write anything into, keeping state nicely contained; in almost all cases this means using SQLite.
- **Any language, any stack**: not Rails-only — Go, Node, or any backend works as long as you can package it as a Docker container and follow the two conventions. Rails apps ship with `/storage` + `/up` wired up out of the box.
- **Convention over configuration**: instead of documenting where data lives, how to back up, how to restart, ONCE bakes the decisions in — "there's virtually nothing to do when you set it up."

## Install-in-Seconds UX

- **One command bootstrap**: copy-paste a command from the ONCE repo/website into a terminal; app-specific links (e.g. a Fizzy-specific link) jump straight to installing that app.
- **Only one required input**: the hostname you're deploying to (e.g. `chat.localhost` for a laptop, or a DNS-pointed domain for a public server) — SSL certificates are set up automatically for real hostnames.
- **Custom images**: pick a built-in app from the menu, or supply any public Docker image URL for a third-party or self-built app.
- **Under a minute end to end**: the slowest part is downloading the container (37signals apps are in the hundreds of megabytes); a freshly cached app installs in about a second.
- **Dashboard**: post-install lands you on a dashboard listing all installed apps, whether they're running, and their memory/CPU usage; app names are clickable links that launch the app in a browser.
- **Terminal is the only ask**: AI coding tools (Claude Code, OpenCode, Gemini CLI) have already trained non-programmers to be comfortable in the terminal, lowering the barrier for ONCE.

## Architecture: Docker Network + Kamal Proxy

- **Kamal lineage**: ONCE reuses underpinnings from Kamal, 37signals' deployment tool built to move Basecamp/HEY off the cloud (out of Kubernetes) onto their own machines.
- **Kamal Proxy for gapless deploys**: the same proxy that gives Kamal no-downtime deploys — deploy a new version without taking the app down and without dropping in-flight requests — is embedded into ONCE.
- **Evolution of the container model**: v1 ran a single container holding the app and everything, one per machine; the new tool creates its own Docker network and installs a proxy alongside one or more apps, managing the group together.
- **Automatic routing**: multiple apps run side by side, each with a distinct name; traffic routes automatically to the correct app.
- **Efficient updates via Docker layers**: updates fetch only changed layers (typically just the Rails layer), so updates are far smaller than the initial hundreds of megabytes.
- **Automatic update polling**: by default ONCE polls once every 24 hours; if there's a new Docker image it pulls the changed layers and redeploys gaplessly (reboot onto a new container). A manual "check now" button also exists. These apps sit "between the cartridge and the Steam game."

## Built-In Operations

- **Backup and restore**: point ONCE at a directory and it makes a daily backup of everything in `/storage` plus app settings, retaining the last 30 days automatically. Enables migrating an app across environments — start on a laptop, back up, restore in a closet PC, restore again on a cloud server.
- **Portability path**: run on your laptop, move to an old PC in the closet (stays up when the lid closes), then to the cloud — all via backup/restore around the `/storage` constraint.
- **Environment variables & SMTP**: a settings screen lets you set special env vars; Fizzy, for example, needs SMTP configured because it uses email for Magic Link login.
- **Live logs**: watch running app logs in a scrolling screen with text filtering, for inspecting traffic or diagnosing problems.
- **Fork-and-customize workflow**: built-in apps are open source on GitHub; create a private fork, commit changes, and the repo's existing CI builds an image; point your installed app at your fork's image path to run a customized version with all your data — a low-friction path for hand or AI-driven customizations.
- **Traffic & visitor metrics**: the dashboard shows request rate and error percentage (from Prometheus metrics exported by Kamal Proxy) plus unique visitors — a process scans proxy logs for client IPs and uses HyperLogLog to count uniques over daily/weekly ranges in fixed memory regardless of volume.

## Why Single-Machine Deployments Work Now

- **Convergence of enabling tech**: Docker (containerize apps + bundle dependencies), Kamal Proxy (gapless deploys), and vastly faster server hardware — even tiny mini PCs or micro VMs — now let one box serve even thousands of users for a single organization.
- **Couldn't have existed earlier**: no Docker in 2005; even when Docker arrived in the early 2010s, computers weren't fast enough to run something like Campfire for thousands on a tiny box.
- **SQLite fits the model**: apps are for a single user (personal) or single company; you won't run one Campfire for a million companies, so SQLite is ideal — each company gets its own ONCE console and clicks in the cartridges it wants.
- **Scales down beautifully**: Writebook for a solo author, Campfire for a study group, Fizzy for you and your agents — the same apps work for individuals and tiny groups.

## Data Ownership as the Point

- **You own your data**: no dependence on a SaaS vendor staying solvent, no monthly rent for the privilege of using someone else's servers, no risk of the company yanking the app or handing your data over on a summary judgment.
- **EU data residency**: increasingly organizations can't or won't host on American servers; ONCE makes running on your own infrastructure trivial.
- **"Too early, not wrong"**: Campfire's SaaS version launched in 2005, years before Slack proved team chat; DHH doesn't want to give up on self-hostable web apps as a medium just because the original ONCE commercial model didn't take off.
- **GPL-like spirit without the license**: no authentication yet and the Docker image URL must be public — deliberately a shared console system where everyone shares cartridges, encouraging forking and trying variants even though the software isn't actually GPL-licensed.

## ONCE vs Kamal: When to Use Which

- **Kamal**: for deploying your own private applications in a more involved way — dozens of machines, heavy coordination, auxiliary services (MySQL, Redis), scaling up to Basecamp/HEY or bigger. Ideal for bespoke internal SaaS operations.
- **ONCE**: the "console stage" — one dedicated machine, run as many apps as fit on a single box, constrained to one box and each app to one `/storage` directory (hence SQLite). Meant for apps that are open, public, and shared rather than private.
- **Symbiotic relationship**: ONCE is an open source experimentation ground whose lessons feed back into making Kamal simpler; experiments "all go into the mixer."
- **Design philosophy — trenches vs possibility**: plenty of self-hostable open source exists but ships with pages of dependencies and config; most people don't want to "dig the trenches themselves." As with Rails, the magic isn't making things possible (everything is possible — "it's just software") but making them accessible, easy, fun, and aesthetically pleasing.
- **Document-driven development**: "If I have to write something down, we've done something wrong" — the same principle behind Rails and Omarchy; unwrapping a Super Mario 3 cartridge required no manual, and software should be that "Fisher Price easy."
- **Distribution**: Omarchy will ship with ONCE pre-baked because it's a tiny CLI setup, giving vibe-coded apps an install platform so people can actually share what they build.
