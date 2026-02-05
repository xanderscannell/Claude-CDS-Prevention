# Project Conventions

## Language and Runtime

- **Language**: Markdown (SKILL.md files), JSON (manifests), Bash (scripts)
- **Runtime**: Claude Code plugin system
- **Package manager**: N/A (no dependencies)

## Code Style

- **Formatter**: N/A (markdown files)
- **Linter**: N/A
- **Type checker**: N/A

## File Conventions

### SKILL.md Files

Skills use YAML frontmatter followed by markdown content:

```markdown
---
name: skill-name
description: One-line description
---

# Skill Title

Instructions for Claude to execute...
```

### Context Files

- Use markdown headers consistently (`#`, `##`, `###`)
- Include a "Last updated" date where relevant
- Use tables for structured data
- Use code blocks for file trees and examples

### Placeholder Markers

Use `[PLACEHOLDER]` format for values that should be filled in:
- `[PROJECT_NAME]` — Name of the project
- `[ONE_SENTENCE_DESCRIPTION]` — Brief project description
- `[CURRENT_PHASE]` — Current implementation phase
- `[DATE]` — Current date

## Naming Conventions

| Element | Convention | Example |
|---------|-----------|---------|
| Skill names | kebab-case | `cds-init`, `cds-checkpoint` |
| Context files | UPPER_SNAKE_CASE.md | `CURRENT_STATUS.md` |
| Template files | Match target name | `CLAUDE.md`, `ARCHITECTURE.md` |
| Directories | lowercase | `skills/`, `templates/` |

## File Organization

```
.claude-plugin/
  plugin.json           # Plugin manifest
  marketplace.json      # Marketplace listing

skills/
  [skill-name]/
    SKILL.md            # Skill definition

templates/
  context/              # Context file templates
  prompts/              # Prompt templates
```

## Documentation

- Keep `CLAUDE.md` concise — it's read every session
- Put detailed information in `.context/` files
- Use the ADR format for architectural decisions
- Include examples in skill files

## Git Conventions

- **Commit format**: `<type>: <description>`
- **Types**: feat, fix, docs, chore, refactor
- **Examples**:
  - `feat: Add cds-status skill`
  - `fix: Correct placeholder syntax in CLAUDE.md`
  - `docs: Update README installation instructions`

## Template Guidelines

When creating templates:
1. Use clear placeholder markers
2. Include comments explaining sections
3. Provide examples where helpful
4. Keep structure consistent across files
