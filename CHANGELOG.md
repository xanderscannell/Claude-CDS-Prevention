# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
