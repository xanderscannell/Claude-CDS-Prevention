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

<!-- Copy the template above for each new decision.
     Number sequentially: ADR-004, ADR-005, etc.
     When a decision is reversed, set Status to "Superseded by ADR-XXX" -->
