# Architecture Decision Records

<!-- Record important architectural and technology decisions here.
     This prevents Claude from re-debating settled questions. -->

---

## ADR-001: Use Markdown for all context files

**Date**: 2026-02-05
**Status**: Accepted

**Context**:
The CDS Prevention framework needs a format for storing project context that Claude can read and update.

**Decision**:
Use plain Markdown files for all context storage.

**Rationale**:
- Human-readable and editable without special tools
- Claude naturally understands and generates markdown
- Git-friendly (easy diffs, merge-friendly)
- No dependencies or runtime requirements
- Works across all platforms and editors

**Consequences**:
- (+) Zero dependencies — works anywhere
- (+) Users can manually edit context files
- (+) Context files can be reviewed in PRs
- (-) No structured validation of file contents
- (-) Placeholder detection relies on text patterns

**Alternatives considered**:
- JSON: Structured but harder to read/edit manually
- YAML: More readable than JSON but still more rigid than markdown
- Database: Overkill for this use case, adds dependencies

**Relevant code**: `templates/context/`

---

## ADR-002: CLAUDE.md as bootloader pattern

**Date**: 2026-02-05
**Status**: Accepted

**Context**:
Claude Code automatically reads `CLAUDE.md` from the project root. We need to use this to bootstrap the context loading process without bloating Claude's context window.

**Decision**:
Keep `CLAUDE.md` minimal — it contains instructions to load `.context/` files rather than the full context itself.

**Rationale**:
- `CLAUDE.md` is always loaded, so keep it small
- Detailed context lives in separate files that are loaded on-demand
- Allows progressive disclosure based on current task
- Users can see at a glance what the project is about

**Consequences**:
- (+) Efficient context window usage
- (+) Clear separation of concerns
- (+) Easy to maintain
- (-) Requires Claude to read multiple files at session start

**Alternatives considered**:
- Put everything in CLAUDE.md: Would bloat context window unnecessarily

**Relevant code**: `templates/context/CLAUDE.md`

---

## ADR-003: Use SKILL.md format for Claude Code plugins

**Date**: 2026-02-05
**Status**: Accepted

**Context**:
Claude Code plugins can define skills as either code (JavaScript/TypeScript) or prompts (SKILL.md).

**Decision**:
Use SKILL.md (markdown prompt format) for all CDS Prevention skills.

**Rationale**:
- Skills are instructions for Claude, not code to execute
- Markdown is easier to write and maintain
- No build step or dependencies required
- Matches the markdown-based philosophy of the whole framework

**Consequences**:
- (+) Simple to create and modify skills
- (+) No runtime dependencies
- (+) Skills are self-documenting
- (-) Less programmatic control than code-based skills

**Alternatives considered**:
- JavaScript/TypeScript skills: More powerful but unnecessary complexity for prompt-based operations

**Relevant code**: `skills/*/SKILL.md`

---

## ADR-004: Embed templates directly in cds-init skill

**Date**: 2026-02-05
**Status**: Accepted

**Context**:
The `/cds-init` skill references template files in `templates/context/` but when users install the plugin, Claude has no way to access those files. The skill is just a prompt loaded into Claude's context — it doesn't have file system access to the plugin's installation directory.

**Decision**:
Embed all template contents directly in the `skills/cds-init/SKILL.md` file.

**Rationale**:
- Skills are prompts, not code — they can't read files from the plugin directory
- Claude needs the exact template content to create consistent files
- Self-contained skill ensures templates are always available regardless of installation method

**Consequences**:
- (+) Templates always available to Claude when running /cds-init
- (+) Consistent file creation across all installations
- (+) No dependency on relative paths or plugin directory structure
- (-) SKILL.md file is larger (~700 lines)
- (-) Templates must be updated in two places (templates/ and SKILL.md)

**Alternatives considered**:
- Relative path references: Wouldn't work because skills don't have file system context
- Keep templates separate: Would result in Claude generating inconsistent content

**Relevant code**: `skills/cds-init/SKILL.md`

---

## ADR-005: Add AGENTS.md bootloader for cross-tool compatibility

**Date**: 2026-02-06
**Status**: Accepted

**Context**:
The CDS framework only worked with Claude Code via `CLAUDE.md`. GitHub Copilot, Cursor, and other AI coding agents use the `AGENTS.md` open standard for project instructions and discover skills from `.github/skills/`.

**Decision**:
Generate both `CLAUDE.md` (for Claude Code) and `AGENTS.md` (for Copilot/Cursor/others) during initialization. Also copy skills to `.github/skills/` for Copilot auto-discovery. Provide `install-copilot.sh` for global skill installation to `~/.copilot/skills/`.

**Rationale**:
- `AGENTS.md` is an open standard supported by multiple tools (Copilot, Cursor, etc.)
- SKILL.md format is already identical between Claude Code and Copilot
- `.context/` directory is tool-agnostic markdown — works everywhere
- Additive change — no impact on existing Claude Code users

**Consequences**:
- (+) Framework works with Claude Code, GitHub Copilot, Cursor, and future AGENTS.md-compatible tools
- (+) No breaking changes for existing users
- (+) Single `/cds-init` creates everything for all tools
- (-) Two bootloader files to keep in sync (`CLAUDE.md` and `AGENTS.md`)
- (-) Skills are duplicated in `skills/` and `.github/skills/` (embedded templates)

**Alternatives considered**:
- AGENTS.md only (drop CLAUDE.md): Would break existing Claude Code users who rely on CLAUDE.md auto-loading
- copilot-instructions.md: Copilot-specific, wouldn't work with Cursor or other agents
- Separate Copilot plugin: More maintenance burden, fragments the project

**Relevant code**: `skills/cds-init/SKILL.md`, `scripts/install-copilot.sh`

---

<!-- Copy the template above for each new decision.
     Number sequentially: ADR-005, ADR-006, etc.
     When a decision is reversed, set Status to "Superseded by ADR-XXX" -->
