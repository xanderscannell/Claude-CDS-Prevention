# Claude CDS Prevention

A context framework that prevents Context Degradation Syndrome (CDS) when working with Claude Code across sessions.

## What is CDS?

Context Degradation Syndrome happens when an AI assistant loses track of project state between sessions — forgetting architecture decisions, repeating mistakes, or ignoring established conventions. This framework gives Claude persistent context by storing structured project knowledge in files it reads automatically at the start of every session.

## Quick Start: New Project

1. Click **"Use this template"** on GitHub to create your own repo
2. Clone your new repo and run the customization script:

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
./scripts/customize.sh my-project-name
```

3. Fill in the context files for your project (see [What to Customize](#what-to-customize))
4. Start coding — Claude will read `CLAUDE.md` automatically

## Quick Start: Existing Project

Run the install script from your project root:

```bash
curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/main/scripts/install.sh | bash -s -- my-project-name
```

Or do it manually:

```bash
git clone --depth 1 https://github.com/xanderscannell/Claude-CDS-Prevention.git .cds-tmp
cp -r .cds-tmp/.context ./.context
cp .cds-tmp/CLAUDE.md ./CLAUDE.md
mkdir -p ./scripts
cp .cds-tmp/scripts/customize.sh ./scripts/customize.sh
rm -rf .cds-tmp
./scripts/customize.sh my-project-name
git add CLAUDE.md .context/ scripts/customize.sh
git commit -m "Add CDS prevention context framework"
```

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
│   ├── ...
│   └── CHECKPOINTS/        ← Session summaries
├── src/
└── ...
```

`CLAUDE.md` is the bootloader — Claude Code reads it automatically when starting a session. It instructs Claude to load the relevant `.context/` files, follow conventions, and update status at the end of each session.

Everything is tracked in your repo. No separate repositories, no sync scripts, no hidden artifacts. Just normal git.

## Daily Workflow

**Start of session**: Claude reads `CLAUDE.md` automatically, which points it to `.context/` files. No action needed from you.

**During work**: Claude follows `CONVENTIONS.md`, checks `DECISIONS.md` before proposing architectural changes, and records new decisions when significant choices are made.

**End of session**: Claude updates `CURRENT_STATUS.md` with what was done, what's next, and any blockers. Commit your code and context together:

```bash
git add -A
git commit -m "feat: add user auth + context update"
```

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
| `.context/CONTEXT/` | Deep-dive area docs | As needed |
| `.context/PROMPTS/` | Reusable prompts | As needed |
| `.context/CHECKPOINTS/` | Session summaries | End of long sessions |
| `.context/templates/` | Templates for checkpoints and sessions | Reference only |

## What to Customize

After running `customize.sh`, these files need your input:

1. **`CLAUDE.md`** — Fill in `[ONE_SENTENCE_DESCRIPTION]` and the Current Focus section
2. **`.context/MASTER_PLAN.md`** — Define your implementation phases and goals
3. **`.context/CONVENTIONS.md`** — Document your language, linter, naming conventions, and test framework
4. **`.context/ARCHITECTURE.md`** — Describe your system components and how they connect
5. **`.context/SETUP.md`** — Document how to set up the dev environment

You can also let Claude fill these in — it will detect the `[PLACEHOLDER]` markers and offer to initialize them by exploring your codebase.

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/customize.sh` | Replaces `[PROJECT_NAME]` and `[DATE]` placeholders in context files |
| `scripts/install.sh` | Adds the framework to an existing project (used by the curl one-liner) |
