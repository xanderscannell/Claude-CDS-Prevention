# CDS Prevention

Prevent Context Degradation Syndrome (CDS) when working with AI coding assistants across sessions. Compatible with **Claude Code**, **GitHub Copilot**, **Cursor**, and any AI agent that supports the [AGENTS.md](https://github.com/openai/agents.md) or [SKILL.md](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) standards.

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

Install the CDS skills globally so they're available in all your projects:

```bash
curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/refs/heads/master/scripts/install-copilot.sh | bash
```

This copies the skills to `~/.copilot/skills/`, where Copilot discovers them automatically. Then in any project, ask Copilot to "initialize the CDS framework" and it will run `/cds-init` to create:
- `AGENTS.md` — Bootloader for Copilot, Cursor, and other agents (open standard)
- `CLAUDE.md` — Bootloader for Claude Code (also created, for cross-tool compatibility)
- `.context/` — Persistent project context directory
- `.github/skills/` — Project-level CDS skills for Copilot auto-discovery

**Per-project install** (without global skills):

```bash
curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/refs/heads/master/scripts/install.sh | bash -s -- <project-name>
```

This creates `AGENTS.md`, `CLAUDE.md`, `.context/`, and `.github/skills/` directly in your project.

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

If your project already has `.context/` and `CLAUDE.md` (or `AGENTS.md`):

1. Install the plugin (or copy skills to `.github/skills/`)
2. Run `/cds-prevention` at the start of each session
3. Run `/cds-checkpoint` at the end of long sessions

## How It Works

```
Your Project
├── CLAUDE.md               ← Claude Code reads this automatically
├── AGENTS.md               ← Copilot/Cursor/other agents read this automatically
├── .context/               ← Persistent project context
│   ├── CURRENT_STATUS.md   ← Updated every session
│   ├── ARCHITECTURE.md     ← System design
│   ├── CONVENTIONS.md      ← Coding standards
│   ├── DECISIONS.md        ← Architecture Decision Records
│   ├── MASTER_PLAN.md      ← Implementation roadmap
│   └── CHECKPOINTS/        ← Session summaries
├── .github/
│   └── skills/             ← Copilot auto-discovers skills here
│       ├── cds-prevention/
│       ├── cds-checkpoint/
│       └── cds-status/
└── ...
```

The bootloader files (`CLAUDE.md` and `AGENTS.md`) are read automatically by their respective AI tools. They instruct the assistant to load the relevant `.context/` files, follow conventions, and update status at the end of each session. Both files contain the same instructions — `CLAUDE.md` targets Claude Code, while `AGENTS.md` follows the [open standard](https://github.com/openai/agents.md) supported by GitHub Copilot, Cursor, and other tools.

## Daily Workflow

**Start of session**: Run `/cds-prevention` (or let it auto-invoke). The assistant reads context files and understands project state.

**During work**: The assistant follows `CONVENTIONS.md`, checks `DECISIONS.md` before proposing architectural changes, and records new decisions when significant choices are made.

**End of session**: Run `/cds-checkpoint` to create a checkpoint, or the assistant updates `CURRENT_STATUS.md` automatically.

**Multi-machine sync**: Just `git pull`. Context travels with the code.

## File Reference

| File | Purpose | Update Frequency |
|------|---------|-----------------|
| `CLAUDE.md` | Bootloader for Claude Code | Every few sessions |
| `AGENTS.md` | Bootloader for Copilot/Cursor/others | Every few sessions |
| `.context/CURRENT_STATUS.md` | Where the project stands now | Every session |
| `.context/MASTER_PLAN.md` | Implementation roadmap | When phases change |
| `.context/ARCHITECTURE.md` | System design | When architecture evolves |
| `.context/DECISIONS.md` | Architecture Decision Records | When decisions are made |
| `.context/CONVENTIONS.md` | Coding standards | Rarely |
| `.context/SETUP.md` | Dev environment setup | Rarely |
| `.context/PHASE_CONTEXT.md` | Context loading by phase | When phases change |
| `.context/CHECKPOINTS/` | Session summaries | End of long sessions |

## Alternative: Without Plugin

You can also use the framework without installing the Claude Code plugin:

### Install Script Method

Run from your existing project root:

```bash
curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/refs/heads/master/scripts/install.sh | bash -s -- my-project-name
```

This creates `CLAUDE.md`, `AGENTS.md`, `.context/`, and `.github/skills/` — everything needed for both Claude Code and GitHub Copilot.

### Template Method

1. Click **"Use this template"** on GitHub to create your own repo
2. Clone your new repo and run the customization script:

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
./scripts/customize.sh my-project-name
```

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
│   ├── context/              # Context file templates
│   └── prompts/              # Reusable prompt templates
├── scripts/
│   ├── install.sh            # Project-level install script
│   ├── install-copilot.sh    # Global install for Copilot users
│   └── customize.sh          # Placeholder replacement script
└── README.md
```

## What to Customize

After running `/cds-init`, these files need your input:

1. **`CLAUDE.md` / `AGENTS.md`** — Fill in `[ONE_SENTENCE_DESCRIPTION]` and the Current Focus section
2. **`.context/MASTER_PLAN.md`** — Define your implementation phases and goals
3. **`.context/CONVENTIONS.md`** — Document your language, linter, naming conventions, and test framework
4. **`.context/ARCHITECTURE.md`** — Describe your system components and how they connect
5. **`.context/SETUP.md`** — Document how to set up the dev environment

You can also let your AI assistant fill these in — it will detect the `[PLACEHOLDER]` markers and offer to initialize them by exploring your codebase.

## Compatibility

| AI Tool | Bootloader | Skills Location | Status |
|---------|-----------|-----------------|--------|
| Claude Code | `CLAUDE.md` | Plugin marketplace | Fully supported |
| GitHub Copilot | `AGENTS.md` | `.github/skills/` | Fully supported |
| Cursor | `AGENTS.md` | `.github/skills/` | Supported |
| Other agents | `AGENTS.md` | Varies | Should work with any AGENTS.md-compatible agent |

The `.context/` directory and its files work with **any** AI coding assistant — the framework is just structured markdown. The bootloader files and skills are the delivery mechanism that makes it automatic.

## License

MIT
