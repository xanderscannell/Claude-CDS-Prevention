#!/usr/bin/env bash
set -euo pipefail

# Install CDS Prevention skills for GitHub Copilot.
# Copies skills to ~/.copilot/skills/ so they're available in all projects.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/xanderscannell/Claude-CDS-Prevention/refs/heads/master/scripts/install-copilot.sh | bash
#
# After installing, ask Copilot to "initialize CDS framework" in any project
# and it will find and run the cds-init skill.

REPO_URL="https://github.com/xanderscannell/Claude-CDS-Prevention.git"
TEMP_DIR=$(mktemp -d)
SKILLS_DIR="$HOME/.copilot/skills"

echo "Installing CDS Prevention skills for GitHub Copilot..."

# Shallow clone to temp directory
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null

# Create skills directory
mkdir -p "$SKILLS_DIR"

# Copy each skill
for skill in cds-init cds-prevention cds-checkpoint cds-status; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "  Updating: $skill"
        rm -rf "$SKILLS_DIR/$skill"
    else
        echo "  Installing: $skill"
    fi
    cp -r "$TEMP_DIR/skills/$skill" "$SKILLS_DIR/$skill"
done

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo "Done! Skills installed to $SKILLS_DIR"
echo ""
echo "Installed skills:"
echo "  /cds-init        - Initialize CDS framework in a project"
echo "  /cds-prevention  - Load project context at session start"
echo "  /cds-checkpoint  - Create a session checkpoint"
echo "  /cds-status      - Show current project status"
echo ""
echo "Next: Open a project in VS Code or GitHub Copilot and ask:"
echo "  \"Initialize the CDS framework for this project\""
