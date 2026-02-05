---
name: cds-checkpoint
description: Create a session checkpoint documenting what was accomplished, decisions made, and what comes next. Use at the end of long or productive sessions.
---

# Create Session Checkpoint

This skill creates a checkpoint document summarizing the current session's work.

## When to Use

- End of a long session (2+ hours of work)
- After completing a significant milestone
- Before switching to a different area of the codebase
- When making important architectural decisions

## Checkpoint Creation Process

### Step 1: Gather session context

Read:
- `.context/CURRENT_STATUS.md` - to see what was planned
- Recent git diff or changed files - to see what was actually done
- `.context/DECISIONS.md` - to note any new decisions

### Step 2: Create checkpoint file

Create a new file at `.context/CHECKPOINTS/YYYY-MM-DD-[brief-description].md` using this template:

```markdown
# Checkpoint - [DATE]

## Session Summary

[2-3 sentences: what was accomplished and what state things are in]

## Completed

- [What was finished]
- [What was finished]

## Files Changed

| File | Change |
|------|--------|
| `path/to/file` | [What changed] |

## Issues and Solutions

| Issue | Solution |
|-------|----------|
| [Problem encountered] | [How it was resolved] |

## Decisions Made

- [Decision]: [Rationale] (added to DECISIONS.md as ADR-XXX)

## Next Session Should

1. [First thing to do]
2. [Second thing to do]
3. [Third thing to do]

## Open Questions

- [Anything unresolved that needs attention]
```

### Step 3: Update CURRENT_STATUS.md

After creating the checkpoint, also update `.context/CURRENT_STATUS.md` to reflect:
- What was completed this session
- What's now in progress
- What comes next
- Any new blockers or questions

### Step 4: Suggest commit

```
git add .context/CHECKPOINTS/ .context/CURRENT_STATUS.md
git commit -m "checkpoint: [brief description of session work]"
```
