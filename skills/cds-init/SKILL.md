---
name: cds-init
description: Initialize the CDS prevention framework in a new project. Creates .context/ directory structure and CLAUDE.md bootloader, then fills placeholders by analyzing the codebase.
---

# Initialize CDS Prevention Framework

Initialize the Context Degradation System prevention framework in a project. This creates the `.context/` directory structure and `CLAUDE.md` bootloader, then analyzes your codebase to fill in project-specific details.

## What This Does

1. **Check if already initialized** - Detect existing `.context/` and `CLAUDE.md`
2. **Create directory structure** - Set up `.context/` with all necessary subdirectories
3. **Create template files** - Populate with starter templates from the CDS Prevention plugin
4. **Analyze codebase** - Detect project name, tech stack, and conventions
5. **Fill placeholders** - Replace `[PROJECT_NAME]`, `[ONE_SENTENCE_DESCRIPTION]`, etc. with actual values
6. **Suggest commit** - Recommend a git commit to save your initialized context

## How to Use

Simply run `/cds-init` in your project root. Claude will:

1. Check if `.context/` and `CLAUDE.md` already exist
   - If yes, ask if you want to reinitialize (overwrites existing files)
   - If no, proceed with initialization

2. Create the `.context/` directory structure:
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
   └── PROMPTS/
       ├── code_review.md
       └── implement_module.md
   ```

3. Analyze your project to discover:
   - **Project name** - from package.json, Cargo.toml, pyproject.toml, or directory name
   - **Description** - from README.md or codebase patterns
   - **Tech stack** - detected languages, frameworks, libraries
   - **Conventions** - linting rules, naming patterns, test framework
   - **Architecture** - key modules, components, directory structure

4. Populate context files with detected information:
   - `CLAUDE.md` - Project bootloader (Claude reads this automatically)
   - `CONVENTIONS.md` - Coding standards and patterns
   - `ARCHITECTURE.md` - System design and components
   - `CURRENT_STATUS.md` - Initial project status
   - `SETUP.md` - Development environment setup instructions

5. Suggest a commit:
   ```bash
   git add CLAUDE.md .context/
   git commit -m "Initialize CDS prevention context framework"
   ```

## What Gets Created

After running `/cds-init`, you'll have:

| File | Purpose | Contains |
|------|---------|----------|
| `CLAUDE.md` | Bootloader (Claude reads automatically) | Project name, description, phase info |
| `.context/CURRENT_STATUS.md` | Session tracker | Progress, in-progress items, blockers |
| `.context/ARCHITECTURE.md` | System design | Components, data flow, key files |
| `.context/CONVENTIONS.md` | Coding standards | Linting, naming, patterns, test framework |
| `.context/DECISIONS.md` | Architecture records | Decision history (use ADR format) |
| `.context/MASTER_PLAN.md` | Implementation roadmap | Phases, milestones, goals |
| `.context/SETUP.md` | Dev environment | Installation, setup, dependencies |
| `.context/PHASE_CONTEXT.md` | Phase guide | Which files matter per phase |

## Next Steps

After initialization, review and customize:

1. **`CLAUDE.md`** - Update the `Current Focus` section
2. **`MASTER_PLAN.md`** - Define your implementation phases
3. **`CONVENTIONS.md`** - Verify detected conventions are correct
4. **`ARCHITECTURE.md`** - Review and refine the system design
5. **`SETUP.md`** - Confirm dev environment setup instructions

Then use:
- **`/cds-prevention`** at session start to load context
- **`/cds-status`** anytime to check current progress
- **`/cds-checkpoint`** to save session snapshots
