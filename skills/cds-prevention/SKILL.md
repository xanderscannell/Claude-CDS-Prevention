---
name: cds-prevention
description: Load and update project context across sessions
---

# CDS Prevention Framework

Prevent Context Degradation Syndrome (CDS) — when an AI assistant loses track of project state between sessions, forgets architecture decisions, repeats mistakes, or ignores established conventions.

This skill reads and updates your project's persistent context files so Claude maintains complete awareness across sessions.

## Session Start: Load Context

At the START of each session, this skill loads:

1. **`.context/CURRENT_STATUS.md`** — What was accomplished last session, what's in progress, what's next
2. **`.context/CONVENTIONS.md`** — Coding standards and patterns to follow
3. **`.context/ARCHITECTURE.md`** — System design and how components connect

Then reads as needed based on your task:
- **`.context/MASTER_PLAN.md`** — Full roadmap, to understand where current work fits
- **`.context/DECISIONS.md`** — Architecture Decision Records to avoid re-debating settled questions
- **`.context/PHASE_CONTEXT.md`** — Which files matter most for the current phase

## During Work: Follow Context

While working:

- **Follow CONVENTIONS.md** for all code you write
- **Check DECISIONS.md** before proposing architectural changes — the decision may already be made
- **Record new decisions** in `DECISIONS.md` when significant technical choices are made

## Session End: Update Context

At the END of each session:

1. **Update `.context/CURRENT_STATUS.md`** with:
   - What was completed this session
   - What's in progress
   - What should happen next
   - Any new blockers or open questions

2. **Update `CLAUDE.md`'s Current Focus section** if priorities changed

3. **Create a checkpoint** in `.context/CHECKPOINTS/` if the session was long or made significant progress

4. **Commit the changes** (git add + commit with message describing what was done)

## File Reference

| File | Purpose | Updated |
|------|---------|---------|
| `CLAUDE.md` | Bootloader (Claude reads automatically) | Every few sessions |
| `.context/CURRENT_STATUS.md` | Where the project stands right now | Every session |
| `.context/MASTER_PLAN.md` | Implementation roadmap | When phases change |
| `.context/ARCHITECTURE.md` | System design and components | When architecture evolves |
| `.context/DECISIONS.md` | Architecture Decision Records | When decisions are made |
| `.context/CONVENTIONS.md` | Coding standards and patterns | Rarely |
| `.context/SETUP.md` | Dev environment setup | Rarely |
| `.context/PHASE_CONTEXT.md` | What to read per project phase | When phases change |
| `.context/CHECKPOINTS/` | Session summaries and snapshots | End of long sessions |

## Need to Initialize?

If you see `[PLACEHOLDER]` markers (like `[CURRENT_TASK]`, `[PHASE_NAME]`, etc.) in `CLAUDE.md` or `.context/` files, run `/cds-init` to initialize the framework with your project details.

## Other Commands

- **`/cds-init`** — Set up the CDS framework in a new project
- **`/cds-checkpoint`** — Create a session checkpoint documenting progress
- **`/cds-status`** — Show current project status and recent activity
