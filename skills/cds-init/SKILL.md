---
name: cds-init
description: Initialize CDS framework in a new project
---

# Initialize CDS Prevention Framework

Initialize the Context Degradation System prevention framework in a project. This creates the `.context/` directory structure, `CLAUDE.md` bootloader (for Claude Code), and `AGENTS.md` bootloader (for GitHub Copilot, Cursor, and other AI coding agents), then analyzes your codebase to fill in project-specific details.

## How to Use

When the user runs `/cds-init`:

1. **Check if already initialized** — Look for existing `.context/` directory, `CLAUDE.md`, and `AGENTS.md`
   - If they exist, ask if the user wants to reinitialize (this will overwrite existing files)
   - If they don't exist, proceed with initialization

2. **Create the directory structure**:
   ```
   .context/
   ├── CURRENT_STATUS.md
   ├── ARCHITECTURE.md
   ├── CONVENTIONS.md
   ├── DECISIONS.md
   ├── MASTER_PLAN.md
   ├── PHASE_CONTEXT.md
   ├── SETUP.md
   ├── CHECKPOINTS/
   ├── CONTEXT/
   ├── templates/
   │   └── CHECKPOINT_TEMPLATE.md
   └── PROMPTS/
       ├── code_review.md
       └── implement_module.md

   .github/
   └── skills/
       ├── cds-prevention/
       │   └── SKILL.md
       ├── cds-checkpoint/
       │   └── SKILL.md
       └── cds-status/
           └── SKILL.md
   ```

3. **Create files using the templates below** — Copy each template exactly as shown

4. **Analyze the codebase** to detect:
   - Project name (from package.json, Cargo.toml, pyproject.toml, go.mod, or directory name)
   - Description (from README.md if present)
   - Tech stack (languages, frameworks, libraries)
   - Conventions (linting rules, naming patterns, test framework)
   - Architecture (key modules, directory structure)

5. **Fill in placeholders** — Replace `[PLACEHOLDER]` markers with detected values

6. **Create `.github/skills/`** — Copy the CDS skill files into `.github/skills/` so GitHub Copilot and other agents can auto-discover them. Use the skill templates in the "GitHub Skills" section below.

7. **Suggest a commit**:
   ```bash
   git add CLAUDE.md AGENTS.md .context/ .github/skills/
   git commit -m "Initialize CDS prevention context framework"
   ```

---

## Templates

Use these exact templates when creating files. Copy them verbatim, then fill in placeholders based on codebase analysis.

### CLAUDE.md (project root)

```markdown
# [PROJECT_NAME]

> [ONE_SENTENCE_DESCRIPTION]

## Context System

This project uses a context framework in `.context/` to prevent context degradation across sessions. You MUST follow these instructions every session.

### First-Time Setup (Placeholder Detection)

If you see `[PLACEHOLDER]` markers (like `[CURRENT_TASK]`, `[PHASE_NAME]`, etc.) in this file or in `.context/` files, the framework hasn't been initialized for this project yet. Before doing anything else:

1. Explore the codebase to understand the project structure, purpose, tech stack, and patterns
2. Fill in all `[PLACEHOLDER]` markers in this file (`CLAUDE.md`)
3. Fill in `.context/CURRENT_STATUS.md` with actual project state
4. Fill in `.context/ARCHITECTURE.md` with the real system design
5. Fill in `.context/CONVENTIONS.md` with the actual coding standards you observe
6. Fill in `.context/MASTER_PLAN.md` if the user provides a roadmap
7. Suggest a commit message for the user to commit the initialized context

### Every Session — Start

Before writing any code, read these files in order:

1. **`.context/CURRENT_STATUS.md`** — what was accomplished last session, what's in progress, what's next
2. **`.context/CONVENTIONS.md`** — coding standards to follow
3. **`.context/ARCHITECTURE.md`** — system design and how components connect

Read as needed based on the task:

- `.context/MASTER_PLAN.md` — full roadmap, to understand where current work fits
- `.context/DECISIONS.md` — past architectural decisions, to avoid re-debating settled questions
- `.context/PHASE_CONTEXT.md` — which files matter most for the current phase

### Every Session — During Work

- **Follow CONVENTIONS.md** for all code you write
- **Check DECISIONS.md** before proposing architectural changes — the decision may already be made
- **Record new decisions** in `DECISIONS.md` when significant technical choices are made (use the ADR template)

### Every Session — End

Before the session ends:

1. **Update `.context/CURRENT_STATUS.md`** with:
   - What was completed
   - What's in progress
   - What should happen next
   - Any new blockers or open questions
2. **Update this file's Current Focus section** if priorities changed
3. **Create a checkpoint** in `.context/CHECKPOINTS/` if the session was long or made significant progress (use the template in `.context/templates/CHECKPOINT_TEMPLATE.md`)
4. **Suggest a commit message** that includes both code and context changes — never commit or push automatically

## Current Focus

**Phase**: [CURRENT_PHASE]
**Working on**: [CURRENT_TASK]
**Key constraint**: [KEY_CONSTRAINT]

## Reference

| File | Purpose |
|------|---------|
| `.context/CURRENT_STATUS.md` | Where the project stands right now |
| `.context/MASTER_PLAN.md` | Implementation roadmap |
| `.context/ARCHITECTURE.md` | System design and components |
| `.context/DECISIONS.md` | Architecture Decision Records |
| `.context/CONVENTIONS.md` | Coding standards and patterns |
| `.context/SETUP.md` | Dev environment setup |
| `.context/PHASE_CONTEXT.md` | What to read per project phase |
| `.context/CONTEXT/` | Deep-dive docs for specific areas |
| `.context/CHECKPOINTS/` | Session summaries |
```

---

### AGENTS.md (project root)

This file is the bootloader for GitHub Copilot, Cursor, and other AI coding agents that support the AGENTS.md standard. It contains the same context-loading instructions as CLAUDE.md but uses agent-agnostic language.

```markdown
# [PROJECT_NAME]

> [ONE_SENTENCE_DESCRIPTION]

## Context System

This project uses a context framework in `.context/` to prevent context degradation across sessions. You MUST follow these instructions every session.

### First-Time Setup (Placeholder Detection)

If you see `[PLACEHOLDER]` markers (like `[CURRENT_TASK]`, `[PHASE_NAME]`, etc.) in this file or in `.context/` files, the framework hasn't been initialized for this project yet. Before doing anything else:

1. Explore the codebase to understand the project structure, purpose, tech stack, and patterns
2. Fill in all `[PLACEHOLDER]` markers in this file (`AGENTS.md`) and in `CLAUDE.md` if it exists
3. Fill in `.context/CURRENT_STATUS.md` with actual project state
4. Fill in `.context/ARCHITECTURE.md` with the real system design
5. Fill in `.context/CONVENTIONS.md` with the actual coding standards you observe
6. Fill in `.context/MASTER_PLAN.md` if the user provides a roadmap
7. Suggest a commit message for the user to commit the initialized context

### Every Session — Start

Before writing any code, read these files in order:

1. **`.context/CURRENT_STATUS.md`** — what was accomplished last session, what's in progress, what's next
2. **`.context/CONVENTIONS.md`** — coding standards to follow
3. **`.context/ARCHITECTURE.md`** — system design and how components connect

Read as needed based on the task:

- `.context/MASTER_PLAN.md` — full roadmap, to understand where current work fits
- `.context/DECISIONS.md` — past architectural decisions, to avoid re-debating settled questions
- `.context/PHASE_CONTEXT.md` — which files matter most for the current phase

### Every Session — During Work

- **Follow CONVENTIONS.md** for all code you write
- **Check DECISIONS.md** before proposing architectural changes — the decision may already be made
- **Record new decisions** in `DECISIONS.md` when significant technical choices are made (use the ADR template)

### Every Session — End

Before the session ends:

1. **Update `.context/CURRENT_STATUS.md`** with:
   - What was completed
   - What's in progress
   - What should happen next
   - Any new blockers or open questions
2. **Update this file's Current Focus section** if priorities changed
3. **Create a checkpoint** in `.context/CHECKPOINTS/` if the session was long or made significant progress (use the template in `.context/templates/CHECKPOINT_TEMPLATE.md`)
4. **Suggest a commit message** that includes both code and context changes — never commit or push automatically

## Current Focus

**Phase**: [CURRENT_PHASE]
**Working on**: [CURRENT_TASK]
**Key constraint**: [KEY_CONSTRAINT]

## Reference

| File | Purpose |
|------|---------|
| `.context/CURRENT_STATUS.md` | Where the project stands right now |
| `.context/MASTER_PLAN.md` | Implementation roadmap |
| `.context/ARCHITECTURE.md` | System design and components |
| `.context/DECISIONS.md` | Architecture Decision Records |
| `.context/CONVENTIONS.md` | Coding standards and patterns |
| `.context/SETUP.md` | Dev environment setup |
| `.context/PHASE_CONTEXT.md` | What to read per project phase |
| `.context/CONTEXT/` | Deep-dive docs for specific areas |
| `.context/CHECKPOINTS/` | Session summaries |
```

---

### .context/CURRENT_STATUS.md

```markdown
# Project Status

**Last updated**: [DATE]

## Current Position

**Phase**: [PHASE_NAME]
**Subphase**: [SUBPHASE_NAME]
**Progress**: [X]% complete

## Recently Completed

- [Completed task with brief description]
- [Completed task with brief description]

## In Progress

- [ ] [Current task 1] - [brief note on where it stands]
- [ ] [Current task 2]

## Next Up

1. [Next task after current work]
2. [Following task]

## Active Files and Modules

```
src/
├── module1/    [status: done / in-progress X% / not started]
├── module2/    [status]
└── module3/    [status]
```

## Recent Decisions

- **[DATE]**: [Decision summary] (see DECISIONS.md #ADR-XXX)

## Open Questions

- **Q**: [Question that needs answering]
  - Leaning toward: [Current thinking]
  - Blocked by: [What's preventing resolution, if anything]

## Blockers

<!-- Remove this section if nothing is blocked -->
- [Blocker description and what's needed to unblock]

## Notes for AI Assistant

<!-- Anything the AI assistant should know that doesn't fit above -->
- [Important context, patterns in use, things to watch out for]
```

---

### .context/ARCHITECTURE.md

```markdown
# System Architecture

## High-Level Overview

[System diagram or prose description of how the major components fit together]

```
[Component A] ──► [Component B] ──► [Component C]
       │                                    │
       ▼                                    ▼
[Component D]                        [Component E]
```

## Components

### [COMPONENT_NAME]

**Purpose**: [What it does]
**Tech stack**: [Languages, frameworks, libraries]
**Key files**:
- `path/to/main/file`
- `path/to/config`

**Interfaces**:
- Input: [What it receives]
- Output: [What it produces]

**Notes**: [Design constraints, performance characteristics, etc.]

---

### [COMPONENT_NAME]

**Purpose**: [What it does]
**Tech stack**: [Languages, frameworks, libraries]
**Key files**:
- `path/to/main/file`

---

<!-- Repeat for each component -->

## Data Flow

[Describe how data moves through the system, from input to output]

1. [Step 1: data enters here]
2. [Step 2: processed by X]
3. [Step 3: stored in Y]
4. [Step 4: served via Z]

## External Dependencies

| Dependency | Purpose | Version |
|-----------|---------|---------|
| [Library/Service] | [Why we use it] | [Version] |

## Key Design Patterns

- **[Pattern name]**: Used in [where], because [why]
- **[Pattern name]**: Used in [where], because [why]

## Technology Decisions

See [DECISIONS.md](DECISIONS.md) for rationale behind technology choices.
```

---

### .context/CONVENTIONS.md

```markdown
# Project Conventions

## Language and Runtime

- **Language**: [Python/TypeScript/etc]
- **Version**: [e.g., Python 3.11+, Node 20+]
- **Package manager**: [pip/npm/pnpm/etc]

## Code Style

- **Formatter**: [Black/Prettier/etc]
- **Linter**: [Ruff/ESLint/etc]
- **Type checker**: [mypy/TypeScript strict/etc]

## Naming Conventions

| Element | Convention | Example |
|---------|-----------|---------|
| Classes | PascalCase | `DataProcessor` |
| Functions | [snake_case/camelCase] | `process_data` |
| Constants | UPPER_SNAKE_CASE | `MAX_RETRIES` |
| Private members | _leading_underscore | `_internal_cache` |
| Files | [snake_case/kebab-case] | `data_processor.py` |

## File Organization

```
src/
  [module_name]/
    __init__.py       # Public exports
    core.py           # Main logic
    types.py          # Type definitions
    utils.py          # Module-specific helpers
tests/
  test_[module_name].py
```

## Error Handling

<!-- Describe your project's error handling pattern -->
```
[Example code showing the expected error handling pattern]
```

## Testing

- **Framework**: [pytest/jest/etc]
- **Coverage target**: [X]%
- **Test naming**: `test_[function]_[scenario]_[expected_result]`
- **Run tests**: `[command to run tests]`

## Git Conventions

- **Commit format**: `<type>(<scope>): <description>`
- **Types**: feat, fix, docs, test, refactor, perf, chore
- **Branch naming**: `feature/description`, `fix/description`

## Import Order

<!-- Describe your expected import ordering -->
1. Standard library
2. Third-party packages
3. Local modules
```

---

### .context/DECISIONS.md

```markdown
# Architecture Decision Records

<!-- Record important architectural and technology decisions here.
     This prevents your AI assistant from re-debating settled questions. -->

---

## ADR-001: [DECISION_TITLE]

**Date**: [YYYY-MM-DD]
**Status**: Accepted

**Context**:
[What situation or problem prompted this decision?]

**Decision**:
[What we decided to do]

**Rationale**:
- [Reason 1]
- [Reason 2]

**Consequences**:
- (+) [Positive outcome]
- (-) [Trade-off or downside]

**Alternatives considered**:
- [Alternative]: [Why we didn't choose it]

**Relevant code**: `path/to/implementation`

---

<!-- Copy the template above for each new decision.
     Number sequentially: ADR-002, ADR-003, etc.
     When a decision is reversed, set Status to "Superseded by ADR-XXX" -->
```

---

### .context/MASTER_PLAN.md

```markdown
# Master Implementation Plan

## Project: [PROJECT_NAME]

## Overview

[High-level description of what you're building and why]

## Success Criteria

- [ ] [Top-level goal 1]
- [ ] [Top-level goal 2]
- [ ] [Top-level goal 3]

---

## Phase 1: [PHASE_NAME]

**Goal**: [What this phase accomplishes]

### 1.1 [SUBPHASE_NAME]
- [ ] [Task]
- [ ] [Task]

### 1.2 [SUBPHASE_NAME]
- [ ] [Task]
- [ ] [Task]

### Phase 1 Milestones
- [ ] [Milestone with measurable criteria]
- [ ] [Milestone with measurable criteria]

---

## Phase 2: [PHASE_NAME]

**Goal**: [What this phase accomplishes]
**Depends on**: Phase 1 milestones

### 2.1 [SUBPHASE_NAME]
- [ ] [Task]
- [ ] [Task]

### Phase 2 Milestones
- [ ] [Milestone with measurable criteria]

---

<!-- Add more phases as needed. Keep each phase focused on a clear goal. -->

## Timeline Dependencies

```
Phase 1 ──► Phase 2 ──► Phase 3
                ╲
                 ──► Phase 4 (can run in parallel with Phase 3)
```

## Risk Areas

| Risk | Impact | Mitigation |
|------|--------|------------|
| [Risk] | [High/Med/Low] | [How to handle it] |
```

---

### .context/PHASE_CONTEXT.md

```markdown
# Context Loading by Phase

<!-- This file tells your AI assistant (and you) which context files are most relevant
     for each phase of the project. Saves time by avoiding loading everything. -->

## Phase 1: [PHASE_NAME]

**Always read**:
- `CURRENT_STATUS.md`
- `CONVENTIONS.md`

**Read if relevant**:
- `ARCHITECTURE.md` (sections: [relevant sections])
- `CONTEXT/[relevant_file].md`

**Can skip**:
- [Files not relevant to this phase]

---

## Phase 2: [PHASE_NAME]

**Always read**:
- `CURRENT_STATUS.md`
- `CONVENTIONS.md`
- `ARCHITECTURE.md`

**Read if relevant**:
- `CONTEXT/[relevant_file].md`
- `DECISIONS.md` (ADRs: [relevant numbers])

---

<!-- Add more phases as your MASTER_PLAN grows.
     The goal is efficient context loading - the AI assistant doesn't need to read
     every file every time. Point it to what matters for the current work. -->
```

---

### .context/SETUP.md

```markdown
# Development Environment Setup

## Prerequisites

- [Requirement 1, e.g., Python 3.11+]
- [Requirement 2, e.g., Docker]
- [Requirement 3, e.g., specific API keys]

## Installation

```bash
# Clone the repo
git clone [REPO_URL]
cd [PROJECT_NAME]

# Install dependencies
[install command]

# Set up environment variables
cp .env.example .env
# Edit .env with your values
```

## Environment Variables

```bash
# .env.example
[VAR_NAME]=[description or example value]
[VAR_NAME]=[description or example value]
```

## Running Locally

```bash
[command to start the project]
```

## Running Tests

```bash
# All tests
[test command]

# Specific module
[targeted test command]

# With coverage
[coverage command]
```

## Building

```bash
[build command]
```

## Common Issues

### [Issue description]
**Fix**: [How to resolve it]

### [Issue description]
**Fix**: [How to resolve it]
```

---

### .context/templates/CHECKPOINT_TEMPLATE.md

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

---

### .context/PROMPTS/code_review.md

```markdown
# Prompt: Code Review

Read for context before reviewing:
1. `.context/CONVENTIONS.md` - coding standards
2. `.context/ARCHITECTURE.md` - system design

## Instructions

Review the following code against our project standards.

```[language]
[paste code here]
```

Check for:
1. Follows naming conventions from CONVENTIONS.md?
2. Has appropriate type annotations?
3. Error handling follows our patterns?
4. Security issues (injection, data exposure, etc.)?
5. Performance concerns?
6. Test coverage adequate?
7. Consistent with ARCHITECTURE.md patterns?

Provide:
- Issues found (with severity: critical/warning/nit)
- Suggested fixes
- Any positive observations
```

---

### .context/PROMPTS/implement_module.md

```markdown
# Prompt: Implement Module

Read for context before implementing:
1. `.context/CURRENT_STATUS.md` - what we're working on
2. `.context/CONVENTIONS.md` - coding standards
3. `.context/ARCHITECTURE.md` - where this fits in the system

## Instructions

Implement the following module: **[MODULE_NAME]**

### Requirements
- [Requirement 1]
- [Requirement 2]

### Steps
1. Show function/class signatures first for approval
2. Implement with type annotations per CONVENTIONS.md
3. Follow error handling patterns from CONVENTIONS.md
4. Create tests with [X]%+ coverage

### Files to create/modify
- `src/[path]/[name].[ext]`
- `tests/test_[name].[ext]`

### Constraints
- [Performance requirement, if any]
- [Compatibility requirement, if any]
- Must integrate with [existing component] per ARCHITECTURE.md
```

---

## GitHub Skills

Create these files in `.github/skills/` so GitHub Copilot and other agents auto-discover them.

### .github/skills/cds-prevention/SKILL.md

```markdown
---
name: cds-prevention
description: Load and update project context across sessions to prevent Context Degradation Syndrome. Use at the start of every session.
---

# CDS Prevention — Load Context

Prevent Context Degradation Syndrome (CDS) — when an AI assistant loses track of project state between sessions, forgets architecture decisions, repeats mistakes, or ignores established conventions.

## Session Start: Load Context

At the START of each session, read these files:

1. **`.context/CURRENT_STATUS.md`** — What was accomplished last session, what's in progress, what's next
2. **`.context/CONVENTIONS.md`** — Coding standards and patterns to follow
3. **`.context/ARCHITECTURE.md`** — System design and how components connect

Then read as needed:
- **`.context/MASTER_PLAN.md`** — Full roadmap
- **`.context/DECISIONS.md`** — Architecture Decision Records
- **`.context/PHASE_CONTEXT.md`** — Which files matter for the current phase

## During Work

- **Follow CONVENTIONS.md** for all code you write
- **Check DECISIONS.md** before proposing architectural changes
- **Record new decisions** in `DECISIONS.md` when significant technical choices are made

## Session End: Update Context

1. **Update `.context/CURRENT_STATUS.md`** with what was completed, what's in progress, and what's next
2. **Update the Current Focus section** in `CLAUDE.md` and/or `AGENTS.md` if priorities changed
3. **Create a checkpoint** in `.context/CHECKPOINTS/` for long or significant sessions
```

### .github/skills/cds-checkpoint/SKILL.md

```markdown
---
name: cds-checkpoint
description: Create a session checkpoint documenting progress, decisions, and next steps. Use at the end of long sessions or after major milestones.
---

# Create Session Checkpoint

Create a checkpoint file at `.context/CHECKPOINTS/YYYY-MM-DD-[brief-description].md` documenting this session's work.

## Process

1. Read `.context/CURRENT_STATUS.md` and recent git log/diff
2. Create the checkpoint file with: session summary, completed tasks, files changed, issues solved, decisions made, and next steps
3. Update `.context/CURRENT_STATUS.md` to reflect current state
4. Update the Current Focus section in whichever bootloader files exist (`CLAUDE.md` and/or `AGENTS.md`) if priorities changed
5. Suggest a commit:
   ```bash
   git add .context/CHECKPOINTS/ .context/CURRENT_STATUS.md CLAUDE.md AGENTS.md
   git commit -m "checkpoint: [brief description of session work]"
   ```
```

### .github/skills/cds-status/SKILL.md

```markdown
---
name: cds-status
description: Show current project context status including phase, progress, blockers, and recent decisions. Use anytime to get a quick project overview.
---

# Show CDS Status

Read the following files and present a summary of the current project state:

1. `CLAUDE.md` and/or `AGENTS.md` — Current Focus section
2. `.context/CURRENT_STATUS.md` — Phase, progress, in-progress tasks, blockers
3. `.context/DECISIONS.md` — Recent Architecture Decision Records
4. `.context/CHECKPOINTS/` — Most recent checkpoint
```

---

## After Initialization

Once files are created and placeholders filled:

1. Tell the user what was created
2. Summarize detected project details (name, tech stack, etc.)
3. Explain that **both `CLAUDE.md` and `AGENTS.md`** were created:
   - `CLAUDE.md` is read by Claude Code
   - `AGENTS.md` is read by GitHub Copilot, Cursor, and other AI coding agents
   - Both contain the same context-loading instructions
4. Explain that **`.github/skills/`** was created with CDS skills for GitHub Copilot auto-discovery
5. Suggest they review and customize:
   - `CLAUDE.md` and `AGENTS.md` — Update the Current Focus section
   - `MASTER_PLAN.md` — Define implementation phases
   - `CONVENTIONS.md` — Verify detected conventions
   - `ARCHITECTURE.md` — Refine system design
6. Suggest the commit command shown above
