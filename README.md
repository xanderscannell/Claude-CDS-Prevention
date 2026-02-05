# Claude CDS Prevention

A Claude Code plugin that prevents Context Degradation Syndrome (CDS) when working across sessions.

## What is CDS?

Context Degradation Syndrome happens when an AI assistant loses track of project state between sessions — forgetting architecture decisions, repeating mistakes, or ignoring established conventions. This plugin gives Claude persistent context by storing structured project knowledge in files it reads automatically at the start of every session.

## Installation

### From Plugin Marketplace (Recommended)

```bash
# Add the marketplace
/plugin marketplace add xanderscannell/Claude-CDS-Prevention

# Install the plugin
/plugin install cds-prevention
```

### Manual Installation

Clone this repo and add it as a local plugin:

```bash
git clone https://github.com/xanderscannell/Claude-CDS-Prevention.git
/plugin marketplace add ./Claude-CDS-Prevention
/plugin install cds-prevention
```

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

If your project already has `.context/` and `CLAUDE.md`:

1. Install the plugin
2. Run `/cds-prevention` at the start of each session
3. Run `/cds-checkpoint` at the end of long sessions

## How It Works

```
Your Project
├── CLAUDE.md               ← Claude reads this automatically (bootloader)
├── .context/               ← Persistent project context
│   ├── CURRENT_STATUS.md   ← Updated every session
│   ├── ARCHITECTURE.md     ← System design
│   ├── CONVENTIONS.md      ← Coding standards
│   ├── DECISIONS.md        ← Architecture Decision Records
│   ├── MASTER_PLAN.md      ← Implementation roadmap
│   └── CHECKPOINTS/        ← Session summaries
└── ...
```

`CLAUDE.md` is the bootloader — Claude Code reads it automatically when starting a session. It instructs Claude to load the relevant `.context/` files, follow conventions, and update status at the end of each session.

## Daily Workflow

**Start of session**: Run `/cds-prevention` or let Claude auto-invoke it. Claude reads context files and understands project state.

**During work**: Claude follows `CONVENTIONS.md`, checks `DECISIONS.md` before proposing architectural changes, and records new decisions when significant choices are made.

**End of session**: Run `/cds-checkpoint` to create a checkpoint, or Claude updates `CURRENT_STATUS.md` automatically.

**Multi-machine sync**: Just `git pull`. Context travels with the code.

## File Reference

| File | Purpose | Update Frequency |
|------|---------|-----------------|
| `CLAUDE.md` | Bootloader (project root) | Every few sessions |
| `.context/CURRENT_STATUS.md` | Where the project stands now | Every session |
| `.context/MASTER_PLAN.md` | Implementation roadmap | When phases change |
| `.context/ARCHITECTURE.md` | System design | When architecture evolves |
| `.context/DECISIONS.md` | Architecture Decision Records | When decisions are made |
| `.context/CONVENTIONS.md` | Coding standards | Rarely |
| `.context/SETUP.md` | Dev environment setup | Rarely |
| `.context/PHASE_CONTEXT.md` | Context loading by phase | When phases change |
| `.context/CHECKPOINTS/` | Session summaries | End of long sessions |

## Alternative: Without Plugin

You can also use the framework without installing the plugin:

### Template Method

1. Click **"Use this template"** on GitHub to create your own repo
2. Clone your new repo and run the customization script:

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
./scripts/customize.sh my-project-name
```

### Install Script Method

Run from your existing project root:

```bash
curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/main/scripts/install.sh | bash -s -- my-project-name
```

## Plugin Structure

```
Claude-CDS-Prevention/
├── .claude-plugin/
│   ├── plugin.json           # Plugin manifest
│   └── marketplace.json      # Marketplace listing
├── skills/
│   ├── cds-prevention/       # Main context management skill
│   ├── cds-init/             # Project initialization skill
│   ├── cds-checkpoint/       # Checkpoint creation skill
│   └── cds-status/           # Status display skill
├── templates/
│   ├── context/              # Context file templates
│   └── prompts/              # Reusable prompt templates
├── scripts/
│   ├── install.sh            # Standalone install script
│   └── customize.sh          # Placeholder replacement script
└── README.md
```

## What to Customize

After running `/cds-init`, these files need your input:

1. **`CLAUDE.md`** — Fill in `[ONE_SENTENCE_DESCRIPTION]` and the Current Focus section
2. **`.context/MASTER_PLAN.md`** — Define your implementation phases and goals
3. **`.context/CONVENTIONS.md`** — Document your language, linter, naming conventions, and test framework
4. **`.context/ARCHITECTURE.md`** — Describe your system components and how they connect
5. **`.context/SETUP.md`** — Document how to set up the dev environment

You can also let Claude fill these in — it will detect the `[PLACEHOLDER]` markers and offer to initialize them by exploring your codebase.

## License

MIT
