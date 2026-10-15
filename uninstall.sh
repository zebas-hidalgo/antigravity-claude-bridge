#!/usr/bin/env bash
# ==============================================================================
# Antigravity-Claude Bridge: Uninstaller
# Removes claude-planner and antigravity-executor
# ==============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${RED}Uninstalling Antigravity <-> Claude Code Bridge...${NC}"

rm -rf "${HOME}/.gemini/config/skills/claude-planner"
echo -e "${GREEN}✓ Removed claude-planner from Antigravity${NC}"

rm -rf "${HOME}/.claude/skills/antigravity-executor"
echo -e "${GREEN}✓ Removed antigravity-executor from Claude Code${NC}"

echo -e "\n${GREEN}Uninstallation complete.${NC} (Note: ~/.claude/CLAUDE.md was preserved)"
