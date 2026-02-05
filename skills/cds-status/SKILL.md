---
name: cds-status
description: Show current project context status - what phase we're in, what's in progress, recent decisions, and any blockers.
---

# Show CDS Status

Get a quick overview of your project's current state: what phase you're in, what's being worked on, recent decisions, blockers, and progress.

This skill reads your context files and summarizes the current project status in one place.

## What This Shows

- **Current Phase** — Where you are in the implementation roadmap
- **Progress** — Percentage complete and what's actively being worked on
- **In Progress** — Tasks currently underway
- **Recently Completed** — What was finished recently
- **Blockers** — Anything preventing progress
- **Recent Decisions** — Latest architectural decisions and their rationale
- **Latest Checkpoint** — Most recent session summary
- **Open Questions** — Unresolved issues needing attention

## How to Use

Simply run `/cds-status` anytime you want to see:

- Your current position in the project roadmap
- What work is actively in progress
- What was just completed
- Any blockers you're facing
- Key decisions that were recently made
- The most recent session checkpoint
- Questions that still need answering

The skill reads from:

1. **`CLAUDE.md`** — Current Focus section (phase, task, constraint)
2. **`.context/CURRENT_STATUS.md`** — Phase, progress %, in progress, completed, blockers, questions
3. **`.context/DECISIONS.md`** — Recent Architecture Decision Records
4. **`.context/CHECKPOINTS/`** — Most recent checkpoint date and summary

## Output Example

```
PROJECT STATUS
==============

Phase: Feature Development (60% complete)
Working on: Implement user authentication

In Progress:
  - Login form UI
  - JWT token validation

Recently Completed:
  - Database schema migration
  - API endpoint scaffolding

Blockers:
  - Need to decide on session storage (localStorage vs cookies)

Recent Decisions:
  - ADR-005: Use JWT for authentication (2024-02-03)
  - ADR-004: PostgreSQL for data persistence (2024-02-01)

Last Checkpoint: 2024-02-04 - Completed login UI and tests

Open Questions:
  - Should we implement OAuth, or stick with JWT?
  - Performance optimization strategy for queries?
```

## If Framework Not Initialized

If your project doesn't have a `.context/` directory yet, the skill will let you know:

```
CDS framework not initialized for this project.

Run /cds-init to set up context tracking.
```

## Other Commands

- **`/cds-init`** — Initialize the CDS framework in a new project
- **`/cds-prevention`** — Load full project context at session start
- **`/cds-checkpoint`** — Create a session checkpoint documenting progress
