#!/usr/bin/env bash
# ==============================================================================
# Antigravity-Claude Bridge: Universal Installer
# Installs claude-planner for Antigravity and antigravity-executor for Claude Code
# ==============================================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}====================================================${NC}"
echo -e "${BLUE}  Installing Antigravity <-> Claude Code Bridge      ${NC}"
echo -e "${BLUE}====================================================${NC}"

# 1. Paths
GEMINI_SKILLS_DIR="${HOME}/.gemini/config/skills"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"
CLAUDE_GLOBAL_MD="${HOME}/.claude/CLAUDE.md"

# 2. Install claude-planner into Antigravity
echo -e "\n${YELLOW}[1/4] Installing claude-planner into Antigravity...${NC}"
mkdir -p "${GEMINI_SKILLS_DIR}/claude-planner"
cp "${SCRIPT_DIR}/skills/claude-planner/SKILL.md" "${GEMINI_SKILLS_DIR}/claude-planner/SKILL.md"
echo -e "${GREEN}✓ claude-planner installed at: ${GEMINI_SKILLS_DIR}/claude-planner/SKILL.md${NC}"

# 3. Install antigravity-executor into Claude Code
echo -e "\n${YELLOW}[2/4] Installing antigravity-executor into Claude Code...${NC}"
mkdir -p "${CLAUDE_SKILLS_DIR}/antigravity-executor"
cp "${SCRIPT_DIR}/skills/antigravity-executor/SKILL.md" "${CLAUDE_SKILLS_DIR}/antigravity-executor/SKILL.md"
echo -e "${GREEN}✓ antigravity-executor installed at: ${CLAUDE_SKILLS_DIR}/antigravity-executor/SKILL.md${NC}"

# 4. Install bonsai-bim-orchestrator into both environments
echo -e "\n${YELLOW}[3/4] Installing bonsai-bim-orchestrator (Bonsai OpenBIM)...${NC}"
mkdir -p "${GEMINI_SKILLS_DIR}/bonsai-bim-orchestrator" "${CLAUDE_SKILLS_DIR}/bonsai-bim-orchestrator"
cp -r "${SCRIPT_DIR}/skills/bonsai-bim-orchestrator/"* "${GEMINI_SKILLS_DIR}/bonsai-bim-orchestrator/"
cp -r "${SCRIPT_DIR}/skills/bonsai-bim-orchestrator/"* "${CLAUDE_SKILLS_DIR}/bonsai-bim-orchestrator/"
echo -e "${GREEN}✓ bonsai-bim-orchestrator installed in Antigravity and Claude${NC}"

# 5. Configure global CLAUDE.md
echo -e "\n${YELLOW}[4/4] Configuring global Claude Code rules...${NC}"
mkdir -p "${HOME}/.claude"
RULE_MARKER="antigravity-executor"

if [ -f "${CLAUDE_GLOBAL_MD}" ]; then
    if grep -q "${RULE_MARKER}" "${CLAUDE_GLOBAL_MD}"; then
        echo -e "${GREEN}✓ Global CLAUDE.md already contains antigravity-executor rule.${NC}"
    else
        echo -e "\n# Antigravity Bridge Rule" >> "${CLAUDE_GLOBAL_MD}"
        echo "- When given a plan file in docs/plans/*.md, activate and follow the antigravity-executor skill." >> "${CLAUDE_GLOBAL_MD}"
        echo "- Always pause at [CHECKPOINT: User Review] blocks in plans." >> "${CLAUDE_GLOBAL_MD}"
        echo -e "${GREEN}✓ Appended bridge rules to ${CLAUDE_GLOBAL_MD}${NC}"
    fi
else
    cp "${SCRIPT_DIR}/templates/CLAUDE.md" "${CLAUDE_GLOBAL_MD}"
    echo -e "${GREEN}✓ Created global ${CLAUDE_GLOBAL_MD}${NC}"
fi

# 5. Optional token optimization tips
echo -e "\n${BLUE}====================================================${NC}"
echo -e "${GREEN}Installation complete!${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "Recommended token-saving tools for Claude Code:"
echo -e "  1. Caveman (slashes conversational output tokens by ~70%):"
echo -e "     ${YELLOW}claude plugin marketplace add JuliusBrussee/caveman${NC}"
echo -e "     ${YELLOW}claude plugin install caveman@caveman${NC}"
echo -e "  2. RTK Proxy (Rust Token Killer, compresses CLI/terminal logs):"
echo -e "     ${YELLOW}cargo install rtk-cli && rtk init -g${NC}"
echo -e "====================================================\n"
