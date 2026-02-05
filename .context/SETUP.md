# Development Environment Setup

## Prerequisites

- Claude Code CLI installed
- Git

## Installation (For Development)

```bash
# Clone the repo
git clone https://github.com/xanderscannell/Claude-CDS-Prevention.git
cd Claude-CDS-Prevention

# Add as a local marketplace for testing
/plugin marketplace add ./Claude-CDS-Prevention

# Install the plugin
/plugin install cds-prevention
```

## Installation (For Users)

```bash
# Add the marketplace
/plugin marketplace add xanderscannell/Claude-CDS-Prevention

# Install the plugin
/plugin install cds-prevention
```

## Environment Variables

None required — this is a pure-markdown plugin with no external dependencies.

## Running Locally

No build or run step. The plugin is loaded by Claude Code when invoked via `/cds-*` commands.

## Testing

Manual testing only:

1. Install the plugin in a test project
2. Run `/cds-init` to initialize context
3. Verify context files are created correctly
4. Run `/cds-status` to verify status display
5. Run `/cds-checkpoint` to verify checkpoint creation
6. Run `/cds-prevention` to verify context loading

## Building

No build step required — the plugin is markdown and JSON files only.

## Common Issues

### Plugin not found after installation
**Fix**: Make sure the marketplace is added first with the correct path/URL, then install the plugin.

### Skills not appearing
**Fix**: Check that `plugin.json` has the correct skill paths and that each skill directory contains a valid `SKILL.md` file.

### Context files have placeholders
**Fix**: Run `/cds-init` in your project to fill in placeholder values, or manually edit the files.
