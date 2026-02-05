---
name: cds-prevention
description: Context Degradation System prevention framework. Use at the START of every session to load project context, and at the END to update status. Prevents Claude from losing track of project state between sessions.
---

# CDS Prevention Framework

This skill helps prevent Context Degradation Syndrome (CDS) - when an AI assistant loses track of project state between sessions, forgets architecture decisions, repeats mistakes, or ignores established conventions.

## Session Start Protocol

Before writing any code, read these files in order:

1. **`.context/CURRENT_STATUS.md`** - What was accomplished last session, what's in progress, what's next
2. **`.context/CONVENTIONS.md`** - Coding standards to follow
3. **`.context/ARCHITECTURE.md`** - System design and how components connect

Read as needed based on the task:
- `.context/MASTER_PLAN.md` - Full roadmap, to understand where current work fits
- `.context/DECISIONS.md` - Past architectural decisions, to avoid re-debating settled questions
- `.context/PHASE_CONTEXT.md` - Which files matter most for the current phase

## During Work

- **Follow CONVENTIONS.md** for all code you write
- **Check DECISIONS.md** before proposing architectural changes - the decision may already be made
- **Record new decisions** in `DECISIONS.md` when significant technical choices are made (use the ADR template)

## Session End Protocol

Before the session ends:

1. **Update `.context/CURRENT_STATUS.md`** with:
   - What was completed
   - What's in progress
   - What should happen next
   - Any new blockers or open questions

2. **Update `CLAUDE.md`'s Current Focus section** if priorities changed

3. **Create a checkpoint** in `.context/CHECKPOINTS/` if the session was long or made significant progress

4. **Suggest a commit message** that includes both code and context changes - never commit or push automatically

## Placeholder Detection

If you see `[PLACEHOLDER]` markers (like `[CURRENT_TASK]`, `[PHASE_NAME]`, etc.) in `CLAUDE.md` or `.context/` files, the framework hasn't been initialized for this project yet. Use `/cds-init` to initialize.

## File Reference

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Bootloader - Claude reads this automatically |
| `.context/CURRENT_STATUS.md` | Where the project stands right now |
| `.context/MASTER_PLAN.md` | Implementation roadmap |
| `.context/ARCHITECTURE.md` | System design and components |
| `.context/DECISIONS.md` | Architecture Decision Records |
| `.context/CONVENTIONS.md` | Coding standards and patterns |
| `.context/SETUP.md` | Dev environment setup |
| `.context/PHASE_CONTEXT.md` | What to read per project phase |
| `.context/CHECKPOINTS/` | Session summaries |
