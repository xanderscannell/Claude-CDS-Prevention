---
name: cds-init
description: Initialize the CDS prevention framework in a new project. Creates .context/ directory structure and CLAUDE.md bootloader, then fills placeholders by analyzing the codebase.
---

# Initialize CDS Prevention Framework

This skill sets up the Context Degradation System prevention framework in a project.

## What This Does

1. Creates the `.context/` directory structure with all template files
2. Creates `CLAUDE.md` bootloader in project root
3. Analyzes the codebase to fill in placeholders
4. Suggests a commit message

## Initialization Steps

### Step 1: Check if already initialized

First, check if `.context/` directory and `CLAUDE.md` already exist. If they do, ask the user if they want to reinitialize (this will overwrite existing context).

### Step 2: Create directory structure

Create the following structure:

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
│   └── weekly/
├── CONTEXT/
├── PROMPTS/
│   ├── code_review.md
│   └── implement_module.md
└── templates/
    ├── CHECKPOINT_TEMPLATE.md
    └── SESSION_TEMPLATE.md
```

### Step 3: Analyze the codebase

Explore the project to understand:
- Project structure and purpose
- Tech stack (languages, frameworks, libraries)
- Existing patterns and conventions
- Key components and architecture

### Step 4: Fill placeholders

Replace all `[PLACEHOLDER]` markers with actual values:
- `[PROJECT_NAME]` - from package.json, Cargo.toml, pyproject.toml, or directory name
- `[ONE_SENTENCE_DESCRIPTION]` - inferred from README or codebase analysis
- `[CURRENT_PHASE]` - set to "Initial Setup" or infer from project state
- `[DATE]` - current date

### Step 5: Populate context files

Fill in the context files based on codebase analysis:
- `CONVENTIONS.md` - observed coding patterns, linter config, naming conventions
- `ARCHITECTURE.md` - component structure, data flow, key files
- `CURRENT_STATUS.md` - current project state
- `SETUP.md` - how to set up the dev environment (from README or inferred)

### Step 6: Suggest commit

After initialization, suggest:
```
git add CLAUDE.md .context/
git commit -m "Add CDS prevention context framework"
```

## Templates Location

The template files for the `.context/` structure are available in this plugin's `templates/context/` directory.
