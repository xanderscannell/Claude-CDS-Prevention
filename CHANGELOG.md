# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-03-31

### Changed
- **Breaking**: Replaced `AGENTS.md` bootloader with `.github/copilot-instructions.md` to match GitHub Copilot's current standard
- Replaced inline templates in `/cds-init` with references to `templates/` directory (876 → 76 lines)
- Trimmed `/cds-checkpoint` to reference the plugin's checkpoint template instead of embedding it inline

### Removed
- `/cds-status` skill (redundant — any AI agent can summarize the context files directly)
- `PHASE_CONTEXT.md` and `CONTEXT/` directory (rarely used, placeholder noise)
- Prompt templates (`code_review.md`, `implement_module.md`) — AI agents already know how to do these tasks
- Install scripts (`install.sh`, `install-copilot.sh`, `customize.sh`) — plugin is installed via marketplace or `/cds-init`
- `.github/skills/` creation from `/cds-init` — skills are built into the plugin
- `SESSION_TEMPLATE.md` (unreferenced)
- Dogfooding `.context/` and `CLAUDE.md` from the plugin repo itself

## [1.0.1] - 2026-02-05

### Changed
- Shortened skill descriptions in frontmatter for better display in skill listings
- Fixed terminology consistency: "Context Degradation Syndrome" used everywhere
- Added `.git` suffix to repository URL in plugin.json for consistency
- Updated date examples in cds-status to use relative dates instead of hardcoded years

### Added
- Additional keywords for better discoverability: memory, persistence, continuity, knowledge-management
- This CHANGELOG file

## [1.0.0] - 2026-02-04

### Added
- Initial release
- Skills: `/cds-init`, `/cds-prevention`, `/cds-checkpoint`, `/cds-status`
- Context file templates: CLAUDE.md, CURRENT_STATUS.md, ARCHITECTURE.md, CONVENTIONS.md, DECISIONS.md, MASTER_PLAN.md, PHASE_CONTEXT.md, SETUP.md
- Prompt templates: code_review.md, implement_module.md
- Session and checkpoint templates
- Installation scripts: install.sh, customize.sh
- Plugin marketplace configuration
