# CDS Prevention

Prevent Context Degradation Syndrome (CDS) when working with AI coding assistants across sessions. Compatible with **Claude Code** and **GitHub Copilot**.

## What is CDS?

Context Degradation Syndrome happens when an AI assistant loses track of project state between sessions — forgetting architecture decisions, repeating mistakes, or ignoring established conventions. This framework gives your AI assistant persistent context by storing structured project knowledge in files it reads automatically at the start of every session.

## Installation

### Claude Code (Plugin Marketplace)

```bash
# Add the marketplace
/plugin marketplace add xanderscannell/Claude-CDS-Prevention

# Install the plugin
/plugin install cds-prevention
```

### Claude Code (Manual)

Clone this repo and add it as a local plugin:

```bash
git clone https://github.com/xanderscannell/Claude-CDS-Prevention.git
/plugin marketplace add ./Claude-CDS-Prevention
/plugin install cds-prevention
```

### GitHub Copilot / Cursor / Other Agents

Run `/cds-init` in your project. It creates:
- `.github/copilot-instructions.md` — Bootloader for GitHub Copilot
- `CLAUDE.md` — Bootloader for Claude Code
- `.context/` — Persistent project context directory

## Available Skills

Once installed, you get these slash commands:

| Command | Description |
|---------|-------------|
| `/cds-prevention` | Main skill - load context at session start, update at session end |
| `/cds-init` | Initialize the framework in a new project |
| `/cds-checkpoint` | Create a session checkpoint documenting progress |
| `/cds-status` | Show current project context status |

## Quick Start

### New Project

1. Install the plugin (see above)
2. Run `/cds-init` in your project directory
3. Fill in the generated context files
4. Commit the changes

### Existing Project with Framework Already Installed

If your project already has `.context/` and `CLAUDE.md` (or `.github/copilot-instructions.md`):

1. Install the plugin
2. Run `/cds-prevention` at the start of each session
3. Run `/cds-checkpoint` at the end of long sessions

## How It Works

```
Your Project
├── CLAUDE.md               ← Claude Code reads this automatically
├── .github/
│   └── copilot-instructions.md  ← GitHub Copilot reads this automatically
├── .context/               ← Persistent project context
│   ├── CURRENT_STATUS.md   ← Updated every session
│   ├── ARCHITECTURE.md     ← System design
│   ├── CONVENTIONS.md      ← Coding standards
│   ├── DECISIONS.md        ← Architecture Decision Records
│   ├── MASTER_PLAN.md      ← Implementation roadmap
│   └── CHECKPOINTS/        ← Session summaries
└── ...
```

The bootloader files (`CLAUDE.md` and `.github/copilot-instructions.md`) are read automatically by their respective AI tools. They instruct the assistant to load the relevant `.context/` files, follow conventions, and update status at the end of each session. Both files contain the same instructions — `CLAUDE.md` targets Claude Code, while `.github/copilot-instructions.md` targets GitHub Copilot.

## Daily Workflow

**Start of session**: Run `/cds-prevention` (or let it auto-invoke). The assistant reads context files and understands project state.

**During work**: The assistant follows `CONVENTIONS.md`, checks `DECISIONS.md` before proposing architectural changes, and records new decisions when significant choices are made.

**End of session**: Run `/cds-checkpoint` to create a checkpoint, or the assistant updates `CURRENT_STATUS.md` automatically.

**Multi-machine sync**: Just `git pull`. Context travels with the code.

## File Reference

| File | Purpose | Update Frequency |
|------|---------|-----------------|
| `CLAUDE.md` | Bootloader for Claude Code | Every few sessions |
| `.github/copilot-instructions.md` | Bootloader for GitHub Copilot | Every few sessions |
| `.context/CURRENT_STATUS.md` | Where the project stands now | Every session |
| `.context/MASTER_PLAN.md` | Implementation roadmap | When phases change |
| `.context/ARCHITECTURE.md` | System design | When architecture evolves |
| `.context/DECISIONS.md` | Architecture Decision Records | When decisions are made |
| `.context/CONVENTIONS.md` | Coding standards | Rarely |
| `.context/SETUP.md` | Dev environment setup | Rarely |
| `.context/PHASE_CONTEXT.md` | Context loading by phase | When phases change |
| `.context/CHECKPOINTS/` | Session summaries | End of long sessions |

## Plugin Structure

```
Claude-CDS-Prevention/
├── .claude-plugin/
│   ├── plugin.json           # Plugin manifest (Claude Code)
│   └── marketplace.json      # Marketplace listing (Claude Code)
├── skills/
│   ├── cds-prevention/       # Main context management skill
│   ├── cds-init/             # Project initialization skill
│   ├── cds-checkpoint/       # Checkpoint creation skill
│   └── cds-status/           # Status display skill
├── templates/
│   └── context/              # Context file templates
└── README.md
```

## What to Customize

After running `/cds-init`, these files need your input:

1. **`CLAUDE.md` / `.github/copilot-instructions.md`** — Fill in `[ONE_SENTENCE_DESCRIPTION]` and the Current Focus section
2. **`.context/MASTER_PLAN.md`** — Define your implementation phases and goals
3. **`.context/CONVENTIONS.md`** — Document your language, linter, naming conventions, and test framework
4. **`.context/ARCHITECTURE.md`** — Describe your system components and how they connect
5. **`.context/SETUP.md`** — Document how to set up the dev environment

You can also let your AI assistant fill these in — it will detect the `[PLACEHOLDER]` markers and offer to initialize them by exploring your codebase.

## Compatibility

| AI Tool | Bootloader | Status |
|---------|-----------|--------|
| Claude Code | `CLAUDE.md` | Fully supported |
| GitHub Copilot | `.github/copilot-instructions.md` | Fully supported |

The `.context/` directory and its files work with **any** AI coding assistant — the framework is just structured markdown. The bootloader files and skills are the delivery mechanism that makes it automatic.

## License

MIT
