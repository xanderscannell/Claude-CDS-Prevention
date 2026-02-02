#!/usr/bin/env bash
set -euo pipefail

# Install the CDS prevention framework into an existing project.
# Downloads the template, copies .context/ and CLAUDE.md, then cleans up.
#
# Usage (from your project root):
#   curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/main/scripts/install.sh | bash -s -- <project-name>
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

echo "Installing CDS prevention framework..."

# Shallow clone to temp directory
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null

# Copy framework files into the current project
cp -r "$TEMP_DIR/.context" ./.context
cp "$TEMP_DIR/CLAUDE.md" ./CLAUDE.md
mkdir -p ./scripts
cp "$TEMP_DIR/scripts/customize.sh" ./scripts/customize.sh
chmod +x ./scripts/customize.sh

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
echo "  CLAUDE.md              (project root - Claude reads this automatically)"
echo "  .context/              (context framework directory)"
echo "  scripts/customize.sh   (placeholder replacement script)"
echo ""
echo "Commit to your repo:"
echo "  git add CLAUDE.md .context/ scripts/customize.sh"
echo "  git commit -m 'Add CDS prevention context framework'"
