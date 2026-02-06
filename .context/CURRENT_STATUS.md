# Project Status

**Last updated**: 2026-02-06

## Current Position

**Phase**: Stable Release
**Subphase**: Cross-tool compatibility
**Progress**: 97% complete

## Recently Completed

- Added GitHub Copilot / Cursor compatibility via AGENTS.md bootloader and .github/skills/
- Created `install-copilot.sh` script for global Copilot skill installation
- Made all skill language agent-agnostic (replaced "Claude" with "the AI assistant" where appropriate)
- Updated all 4 skills to detect and support both CLAUDE.md and AGENTS.md bootloaders
- Added AGENTS.md template to /cds-init embedded templates
- Added .github/skills/ creation step to /cds-init
- Updated install.sh and customize.sh to handle AGENTS.md and .github/skills/
- Updated README with Copilot installation instructions and compatibility table

## In Progress

- [x] Dogfooding: Using the plugin on its own repository to validate the framework
- [x] Embedded templates directly in /cds-init skill for portability
- [x] GitHub Copilot / Cursor / AGENTS.md cross-tool compatibility

## Next Up

1. Gather user feedback from marketplace users and Copilot users
2. Consider additional utility skills (e.g., decision recording, phase transitions)
3. Improve template customization options
4. Test install-copilot.sh script end-to-end with actual Copilot setup

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

- **2026-02-06**: Add AGENTS.md bootloader for cross-tool compatibility (see DECISIONS.md #ADR-005)
- **2026-02-05**: Embed templates directly in cds-init SKILL.md (see DECISIONS.md #ADR-004)
- **2026-02-05**: Use SKILL.md format for Claude Code plugin skills (see DECISIONS.md #ADR-003)

## Open Questions

- **Q**: Should the plugin auto-detect when context files have placeholders and offer to fill them?
  - Leaning toward: Yes, this would improve first-run experience
  - Blocked by: Nothing — just needs implementation

## Notes for AI Assistant

- This repository is the CDS Prevention plugin itself — it uses its own framework for dogfooding
- The `templates/` directory contains the files that get copied when users run `/cds-init`
- The `.context/` directory here is for tracking development of the plugin itself
- The skills now support both Claude Code (via CLAUDE.md) and GitHub Copilot/Cursor (via AGENTS.md)
- install-copilot.sh copies skills to ~/.copilot/skills/ for global Copilot availability
