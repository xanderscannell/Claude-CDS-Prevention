---
name: cds-status
description: Show current project context status - what phase we're in, what's in progress, recent decisions, and any blockers.
---

# Show CDS Status

This skill provides a quick overview of the current project context.

## What This Shows

1. **Current Phase** - Where we are in the master plan
2. **In Progress** - What's currently being worked on
3. **Recent Activity** - What was completed recently
4. **Blockers** - Anything blocking progress
5. **Recent Decisions** - Latest architectural decisions

## How to Display Status

### Read and summarize these files:

1. **CLAUDE.md** - Extract Current Focus section
2. **`.context/CURRENT_STATUS.md`** - Extract:
   - Current phase and progress percentage
   - In Progress items
   - Recent completions
   - Blockers
   - Open questions

3. **`.context/DECISIONS.md`** - Show the 2-3 most recent ADRs (just titles and dates)

4. **`.context/CHECKPOINTS/`** - Note the date of the most recent checkpoint

### Output Format

```
PROJECT STATUS
==============

Phase: [Phase name] ([X]% complete)
Working on: [Current task from CLAUDE.md]

In Progress:
  - [Task 1]
  - [Task 2]

Recently Completed:
  - [Task 1]
  - [Task 2]

Blockers:
  - [Blocker or "None"]

Recent Decisions:
  - ADR-XXX: [Title] ([Date])
  - ADR-XXX: [Title] ([Date])

Last Checkpoint: [Date] or "No checkpoints yet"

Open Questions:
  - [Question or "None"]
```

## If Framework Not Initialized

If `.context/` doesn't exist or contains only placeholders, inform the user:

```
CDS framework not initialized for this project.
Run /cds-init to set up context tracking.
```
