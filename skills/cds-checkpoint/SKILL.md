---
name: cds-checkpoint
description: Create session checkpoint documenting progress
---

# Create Session Checkpoint

Create a snapshot of your session's work. Checkpoints document what was accomplished, decisions made, issues solved, and what should happen next. This helps future sessions understand the project's progress and context.

## When to Create a Checkpoint

- **End of a long session** (2+ hours of focused work)
- **After completing a significant milestone** (major feature, refactor, bug fix)
- **Before switching to a different area** of the codebase
- **When making important architectural decisions**
- **Whenever you want a session summary** for future reference

## Checkpoint Creation Process

This skill will:

1. **Gather session context** by reading:
   - `.context/CURRENT_STATUS.md` — what was planned
   - Recent git log and diff — what was actually done
   - `.context/DECISIONS.md` — any new decisions made

2. **Create a checkpoint file** at `.context/CHECKPOINTS/YYYY-MM-DD-[brief-description].md` with:
   - Session summary (2-3 sentences)
   - Completed tasks and milestones
   - Files changed with descriptions
   - Issues encountered and how they were solved
   - New decisions made
   - What the next session should focus on
   - Any open questions or unresolved issues

3. **Update `.context/CURRENT_STATUS.md`** to reflect:
   - What was completed this session
   - What's now in progress
   - What comes next
   - Any new blockers or questions

4. **Suggest a commit** to save the checkpoint:
   ```bash
   git add .context/CHECKPOINTS/ .context/CURRENT_STATUS.md
   git commit -m "checkpoint: [brief description of session work]"
   ```

## Checkpoint Template

Each checkpoint file includes:

```markdown
# Checkpoint - [DATE]

## Session Summary
[2-3 sentences: what was accomplished and current state]

## Completed
- [Task 1]
- [Task 2]

## Files Changed
| File | Change |
|------|--------|
| `path/to/file` | [What changed] |

## Issues and Solutions
| Issue | Solution |
|-------|----------|
| [Problem] | [Resolution] |

## Decisions Made
- [Decision]: [Rationale] (added to DECISIONS.md as ADR-XXX)

## Next Session Should
1. [First priority]
2. [Second priority]
3. [Third priority]

## Open Questions
- [Anything needing attention]
```

## Benefits

- **Future context** — Know exactly what happened in past sessions
- **Progress tracking** — See milestones and completed work
- **Decision history** — Understand why architectural choices were made
- **Blockers** — Identify and resolve issues systematically
- **Continuity** — New sessions can pick up exactly where you left off

## Other Commands

- **`/cds-prevention`** — Load project context at session start
- **`/cds-status`** — View current project status
- **`/cds-init`** — Set up the CDS framework in a new project
