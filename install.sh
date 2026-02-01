#!/bin/bash
set -e

# BAMS Installer — Bi-Temporal Agent Memory System
# Cognalith Inc.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$HOME/.claude/skills/bams"
SKILL_SOURCE="$SCRIPT_DIR/SKILL.md"
TEMPLATE_DIR="$SCRIPT_DIR/templates"

# Colors (with fallback for non-color terminals)
if [ -t 1 ] && command -v tput &>/dev/null && [ "$(tput colors 2>/dev/null)" -ge 8 ]; then
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    CYAN=$(tput setaf 6)
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    GREEN="" YELLOW="" CYAN="" BOLD="" RESET=""
fi

usage() {
    echo "${BOLD}BAMS Installer${RESET} — Bi-Temporal Agent Memory System"
    echo ""
    echo "${BOLD}Usage:${RESET}"
    echo "  ./install.sh              Install BAMS skill to ~/.claude/skills/bams/"
    echo "  ./install.sh --init [dir] Initialize BAMS templates in a workspace directory"
    echo "  ./install.sh --full [dir] Install skill + initialize templates"
    echo "  ./install.sh --uninstall  Remove BAMS skill from ~/.claude/skills/"
    echo "  ./install.sh --help       Show this help message"
    echo ""
    echo "${BOLD}Examples:${RESET}"
    echo "  ./install.sh                          # Install skill only"
    echo "  ./install.sh --init .                  # Init templates in current dir"
    echo "  ./install.sh --init /path/to/project   # Init templates in specific dir"
    echo "  ./install.sh --full /path/to/project   # Both: skill + templates"
}

install_skill() {
    echo "${CYAN}Installing BAMS skill...${RESET}"

    if [ ! -f "$SKILL_SOURCE" ]; then
        echo "${YELLOW}Error: SKILL.md not found at $SKILL_SOURCE${RESET}"
        exit 1
    fi

    mkdir -p "$SKILL_DIR"
    cp "$SKILL_SOURCE" "$SKILL_DIR/SKILL.md"

    echo "${GREEN}Skill installed to $SKILL_DIR/SKILL.md${RESET}"
    echo ""
    echo "Use ${BOLD}/memory${RESET}, ${BOLD}/bams${RESET}, or ${BOLD}/heartbeat${RESET} in Claude Code."
}

init_templates() {
    local target="${1:-.}"
    target="$(cd "$target" 2>/dev/null && pwd)" || {
        echo "${YELLOW}Error: Directory '$1' does not exist.${RESET}"
        exit 1
    }

    echo "${CYAN}Initializing BAMS templates in $target ...${RESET}"

    if [ ! -d "$TEMPLATE_DIR" ]; then
        echo "${YELLOW}Error: templates/ directory not found at $TEMPLATE_DIR${RESET}"
        exit 1
    fi

    # Create directory structure
    mkdir -p "$target/memory/experiences"
    mkdir -p "$target/memory/people"
    mkdir -p "$target/memory/self"
    mkdir -p "$target/memory/reference"

    # Copy top-level templates (no-clobber: never overwrite existing files)
    local created=0
    local skipped=0

    for file in CONTINUATION.md MEMORY.md HEARTBEAT.md; do
        if [ ! -f "$target/$file" ]; then
            cp "$TEMPLATE_DIR/$file" "$target/$file"
            echo "  ${GREEN}Created${RESET} $file"
            ((created++))
        else
            echo "  ${YELLOW}Skipped${RESET} $file (already exists)"
            ((skipped++))
        fi
    done

    # Copy memory index
    if [ ! -f "$target/memory/index.md" ]; then
        cp "$TEMPLATE_DIR/memory/index.md" "$target/memory/index.md"
        echo "  ${GREEN}Created${RESET} memory/index.md"
        ((created++))
    else
        echo "  ${YELLOW}Skipped${RESET} memory/index.md (already exists)"
        ((skipped++))
    fi

    # Copy self/ templates
    for file in reflections.md lessons-learned.md evolving-beliefs.md; do
        if [ ! -f "$target/memory/self/$file" ]; then
            cp "$TEMPLATE_DIR/memory/self/$file" "$target/memory/self/$file"
            echo "  ${GREEN}Created${RESET} memory/self/$file"
            ((created++))
        else
            echo "  ${YELLOW}Skipped${RESET} memory/self/$file (already exists)"
            ((skipped++))
        fi
    done

    echo ""
    echo "${GREEN}Done.${RESET} Created $created files, skipped $skipped (already existed)."
    echo ""
    echo "Directory structure:"
    echo "  $target/"
    echo "  ├── CONTINUATION.md    # Hot Tier"
    echo "  ├── MEMORY.md          # Warm Tier"
    echo "  ├── HEARTBEAT.md       # Curation Schedule"
    echo "  └── memory/"
    echo "      ├── index.md"
    echo "      ├── experiences/"
    echo "      ├── people/"
    echo "      ├── self/"
    echo "      └── reference/"
}

uninstall() {
    echo "${CYAN}Uninstalling BAMS skill...${RESET}"

    if [ -d "$SKILL_DIR" ]; then
        rm -rf "$SKILL_DIR"
        echo "${GREEN}Removed $SKILL_DIR${RESET}"
    else
        echo "${YELLOW}BAMS skill not found at $SKILL_DIR — nothing to remove.${RESET}"
    fi
}

# Parse arguments
case "${1:-}" in
    --help|-h)
        usage
        ;;
    --init)
        init_templates "${2:-.}"
        ;;
    --full)
        install_skill
        echo ""
        init_templates "${2:-.}"
        ;;
    --uninstall)
        uninstall
        ;;
    "")
        install_skill
        ;;
    *)
        echo "${YELLOW}Unknown option: $1${RESET}"
        echo ""
        usage
        exit 1
        ;;
esac
