# System Architecture

## High-Level Overview

CDS Prevention is a Claude Code plugin that provides persistent project context through structured markdown files. Claude reads `CLAUDE.md` automatically, which bootstraps the context loading process.

```
┌─────────────────────────────────────────────────────────────────┐
│                    Claude Code Session                          │
│  ┌───────────────┐         ┌────────────────────────────────┐  │
│  │   CLAUDE.md   │────────►│        .context/ Files          │  │
│  │  (Bootloader) │         │  ┌────────────────────────┐    │  │
│  └───────────────┘         │  │   CURRENT_STATUS.md    │    │  │
│         │                  │  │   ARCHITECTURE.md      │    │  │
│         ▼                  │  │   CONVENTIONS.md       │    │  │
│  ┌───────────────┐         │  │   DECISIONS.md         │    │  │
│  │    Skills     │         │  │   MASTER_PLAN.md       │    │  │
│  │  /cds-init    │─────────│  │   CHECKPOINTS/         │    │  │
│  │  /cds-status  │         │  └────────────────────────┘    │  │
│  │ /cds-checkpoint│        └────────────────────────────────┘  │
│  └───────────────┘                                              │
└─────────────────────────────────────────────────────────────────┘
```

## Components

### CLAUDE.md (Bootloader)

**Purpose**: Entry point that Claude reads automatically; instructs Claude to load context files
**Location**: Project root
**Key sections**:
- Project name and description
- Context system instructions
- Current focus (phase, task, constraint)
- Reference table to all context files

**Notes**: This file is kept concise to avoid polluting Claude's context window. Detailed information lives in `.context/` files.

---

### Skills

**Purpose**: Slash commands that execute context operations
**Tech stack**: Markdown-based SKILL.md format (Claude Code plugin standard)
**Key files**:
- `skills/cds-init/SKILL.md` — Initialize framework in new projects
- `skills/cds-prevention/SKILL.md` — Load/update context during sessions
- `skills/cds-checkpoint/SKILL.md` — Create session snapshots
- `skills/cds-status/SKILL.md` — Show current project status

**Notes**: Skills are prompts, not code. Claude interprets the SKILL.md instructions and executes them.

---

### Templates

**Purpose**: Starter files copied when initializing a new project
**Location**: `templates/`
**Key files**:
- `templates/context/` — All `.context/` file templates
- `templates/prompts/` — Reusable prompt templates

**Notes**: Templates use `[PLACEHOLDER]` markers that Claude replaces with project-specific content.

---

### Plugin Manifests

**Purpose**: Define the plugin for Claude Code's plugin system
**Key files**:
- `.claude-plugin/plugin.json` — Plugin metadata and skill paths
- `.claude-plugin/marketplace.json` — Marketplace listing information

---

## Data Flow

1. **Session start**: Claude reads `CLAUDE.md` automatically
2. **Context loading**: `CLAUDE.md` instructs Claude to read `.context/` files
3. **During work**: Claude follows conventions, checks decisions, writes code
4. **Session end**: Claude updates `CURRENT_STATUS.md` with progress
5. **Checkpoints**: User runs `/cds-checkpoint` to create snapshots

## External Dependencies

| Dependency | Purpose | Version |
|-----------|---------|---------|
| Claude Code | Runtime environment | Any |
| Git | Version control for context files | Any |

## Key Design Patterns

- **Bootloader pattern**: `CLAUDE.md` is minimal and points to detailed files
- **Progressive disclosure**: Load only what's needed for current task
- **Human-readable persistence**: All context stored in markdown
- **Git-native**: Context travels with code via version control

## Technology Decisions

See [DECISIONS.md](DECISIONS.md) for rationale behind technology choices.
