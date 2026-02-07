#!/usr/bin/env bash
set -euo pipefail

# Install the CDS prevention framework into an existing project.
# Downloads the template, copies .context/, CLAUDE.md, AGENTS.md, and
# .github/skills/, then cleans up.
#
# Usage (from your project root):
#   curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/refs/heads/master/scripts/install.sh | bash -s -- <project-name>
#
# Or clone and run directly:
#   git clone --depth 1 https://github.com/xanderscannell/Claude-CDS-Prevention.git .cds-tmp
#   .cds-tmp/scripts/install.sh <project-name>

REPO_URL="https://github.com/xanderscannell/Claude-CDS-Prevention.git"
PROJECT_NAME="${1:-}"
TEMP_DIR=".cds-install-tmp"

# Guard against overwriting existing context
if [ -d ".context" ]; then
    echo "Error: .context/ already exists in this directory."
    echo "The framework may already be installed."
    exit 1
fi

if [ -f "CLAUDE.md" ]; then
    echo "Warning: CLAUDE.md already exists. It will be overwritten."
    echo ""
fi

if [ -f "AGENTS.md" ]; then
    echo "Warning: AGENTS.md already exists. It will be overwritten."
    echo ""
fi

echo "Installing CDS prevention framework..."

# Shallow clone to temp directory
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null

# Copy template files into the current project (NOT the repo's own .context/)
mkdir -p ./.context/CHECKPOINTS
for f in CURRENT_STATUS.md ARCHITECTURE.md CONVENTIONS.md DECISIONS.md MASTER_PLAN.md PHASE_CONTEXT.md SETUP.md; do
    cp "$TEMP_DIR/templates/context/$f" "./.context/$f"
done
cp "$TEMP_DIR/templates/context/CHECKPOINT_TEMPLATE.md" "./.context/CHECKPOINTS/CHECKPOINT_TEMPLATE.md"
cp "$TEMP_DIR/templates/context/SESSION_TEMPLATE.md" "./.context/CHECKPOINTS/SESSION_TEMPLATE.md"
cp "$TEMP_DIR/templates/context/CLAUDE.md" ./CLAUDE.md
cp "$TEMP_DIR/templates/context/CLAUDE.md" ./AGENTS.md
mkdir -p ./scripts
cp "$TEMP_DIR/scripts/customize.sh" ./scripts/customize.sh
chmod +x ./scripts/customize.sh

# Copy skills for GitHub Copilot auto-discovery
mkdir -p ./.github/skills
for skill in cds-init cds-prevention cds-checkpoint cds-status; do
    cp -r "$TEMP_DIR/skills/$skill" "./.github/skills/$skill"
done

# Clean up
rm -rf "$TEMP_DIR"

# Run customize if project name was provided
if [ -n "$PROJECT_NAME" ]; then
    echo ""
    bash ./scripts/customize.sh "$PROJECT_NAME"
else
    echo ""
    echo "Framework installed!"
    echo ""
    echo "Next: run ./scripts/customize.sh <your-project-name> to replace placeholders."
fi

echo ""
echo "Files added:"
echo "  CLAUDE.md              (bootloader for Claude Code)"
echo "  AGENTS.md              (bootloader for Copilot/Cursor/other agents)"
echo "  .context/              (context framework directory)"
echo "  .github/skills/        (CDS skills for GitHub Copilot auto-discovery)"
echo "  scripts/customize.sh   (placeholder replacement script)"
echo ""
echo "Commit to your repo:"
echo "  git add CLAUDE.md AGENTS.md .context/ .github/skills/ scripts/customize.sh"
echo "  git commit -m 'Add CDS prevention context framework'"
