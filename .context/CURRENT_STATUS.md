# Project Status

**Last updated**: 2026-02-07

## Current Position

**Phase**: Stable Release
**Subphase**: Cross-tool compatibility
**Progress**: 97% complete

## Recently Completed

- Fixed install.sh to copy from `templates/context/` instead of the repo's own `.context/` (was shipping real project data to users)
- Fixed install.sh to include `cds-init` in `.github/skills/` copy loop
- Fixed raw GitHub URLs in install.sh, install-copilot.sh, and README.md (`/main/` → `/refs/heads/master/`)
- Added GitHub Copilot / Cursor compatibility via AGENTS.md bootloader and .github/skills/
- Created `install-copilot.sh` script for global Copilot skill installation

## In Progress

- [ ] Changes from this session are uncommitted — need to stage, commit, and push

## Next Up

1. Commit and publish the install script fixes
2. Gather user feedback from marketplace users and Copilot users
3. Consider additional utility skills (e.g., decision recording, phase transitions)
4. Improve template customization options

## Active Files and Modules

```
.claude-plugin/
├── plugin.json          [status: done]
└── marketplace.json     [status: done]

skills/
├── cds-init/            [status: done — updated with AGENTS.md + .github/skills/]
├── cds-prevention/      [status: done — agent-agnostic, dual bootloader]
├── cds-checkpoint/      [status: done — agent-agnostic, dual bootloader]
└── cds-status/          [status: done — agent-agnostic, dual bootloader]

scripts/
├── install.sh           [status: done — updated for AGENTS.md + .github/skills/]
├── install-copilot.sh   [status: done — NEW]
└── customize.sh         [status: done — updated for AGENTS.md]

templates/
├── context/             [status: done]
└── prompts/             [status: done]
```

## Recent Decisions

- **2026-02-07**: install.sh must copy from `templates/context/`, never from the repo's own `.context/`
- **2026-02-06**: Add AGENTS.md bootloader for cross-tool compatibility (see DECISIONS.md #ADR-005)
- **2026-02-05**: Embed templates directly in cds-init SKILL.md (see DECISIONS.md #ADR-004)

## Open Questions

- **Q**: Should the plugin auto-detect when context files have placeholders and offer to fill them?
  - Leaning toward: Yes, this would improve first-run experience
  - Blocked by: Nothing — just needs implementation

## Notes for AI Assistant

- This repository is the CDS Prevention plugin itself — it uses its own framework for dogfooding
- The `templates/` directory contains the files that get copied when users run `/cds-init`
- The `.context/` directory here is for tracking development of the plugin itself — NEVER ship it to users via install scripts
- The skills now support both Claude Code (via CLAUDE.md) and GitHub Copilot/Cursor (via AGENTS.md)
- install-copilot.sh copies skills to ~/.copilot/skills/ for global Copilot availability
- The default branch is `master`, not `main` — raw GitHub URLs must use `/refs/heads/master/`
