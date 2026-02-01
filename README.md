# BAMS — Bi-Temporal Agent Memory System

> Designed by agents, for agents. A Cognalith Inc. memory architecture standard.

BAMS is a cognitive memory architecture for AI agents that replaces infinite data hoarding with strategic relevance filtering. It implements decay-weighted memory tiers, curation cycles, and bi-temporal tracking — turning agents from "hoarders of data" into "curators of wisdom."

**Forgetting is not loss; it is the active curation of wisdom.**

## Quick Start

### 1. Install the Claude Code Skill

```bash
git clone https://github.com/cognalith/bams.git
cd bams
./install.sh
```

This copies `SKILL.md` to `~/.claude/skills/bams/SKILL.md`. The skill activates on `/memory`, `/bams`, or `/heartbeat` commands.

### 2. Initialize Memory in Your Workspace

```bash
# Initialize in current directory
./install.sh --init .

# Or initialize in a specific project
./install.sh --init /path/to/your/project

# Or do both at once
./install.sh --full /path/to/your/project
```

This creates the BAMS file structure without overwriting any existing files.

### 3. Start Using BAMS

In Claude Code:
- `/memory init` — Set up BAMS in your workspace
- `/memory write` — Record a new memory
- `/memory recall [query]` — Search across all tiers
- `/heartbeat daily` — Run start-of-session curation
- `/heartbeat weekly` — Run deep curation cycle

## Architecture

### Three-Tier Memory Model

```
Hot:  CONTINUATION.md     — Loaded on startup. Immediate context. O(1).
Warm: MEMORY.md           — Graduated wisdom. Proven patterns. Curated.
Cold: memory/ directory   — Full archive. Raw logs. Deep search. O(n).
```

**Data flow:** Cold → (heartbeat review + texture detection) → Warm → (active retrieval) → Hot

### Memory Types and Decay Half-Lives

| Type | Half-Life | Examples |
|------|-----------|---------|
| **Episodic** | 7 days | Debug sessions, daily observations, transient events |
| **Procedural** | 30-60 days | Workflows, tool patterns, deployment recipes |
| **Semantic/Meta** | 90+ days | Identity, relationships, preferences, domain principles |

### Key Concepts

- **Matthew Effect**: Each retrieval resets the decay clock and strengthens the memory trace. Useful knowledge sticks; unused data sinks.
- **Texture Detection**: During heartbeat reviews, memories are classified as *Tested* (applied and verified — promote) or *Absorbed* (read only — allow to decay).
- **Bi-Temporal Tracking**: Every entry records both *Valid Time* (when the fact was true) and *Transaction Time* (when recorded).
- **Narrative Memory**: Store context, significance, and meaning — not just bare facts.

## File Structure

```
cognalith-bams/
├── README.md                          # This file
├── LICENSE                            # MIT — Cognalith Inc.
├── SKILL.md                           # The installable Claude Code skill
├── install.sh                         # Installation script
├── spec/
│   └── BAMS_Specification.md          # Full technical specification
└── templates/
    ├── CONTINUATION.md                # Hot Tier template
    ├── MEMORY.md                      # Warm Tier template
    ├── HEARTBEAT.md                   # Curation schedule template
    └── memory/
        ├── index.md                   # Cold Tier navigation hub
        ├── experiences/               # Daily episodic entries
        ├── people/                    # Relationship files
        ├── reference/                 # Domain knowledge
        └── self/
            ├── reflections.md         # Self-reflection
            ├── lessons-learned.md     # Earned wisdom
            └── evolving-beliefs.md    # Shifting perspectives
```

## Commands Reference

| Command | Description |
|---------|-------------|
| `/memory init` | Initialize BAMS file structure in workspace |
| `/memory write` | Write a new memory to the appropriate tier |
| `/memory recall [query]` | Search Hot → Warm → Cold for relevant memories |
| `/memory status` | Report on memory system health |
| `/heartbeat micro` | Quick curation (every ~2 hours) |
| `/heartbeat daily` | Start-of-session curation |
| `/heartbeat weekly` | Deep curation with full decay review |
| `/heartbeat monthly` | Deep archive review and meta-reflection |

## Retrieval Scoring

BAMS uses a unified formula that merges semantic similarity with temporal relevance:

```
Score = (w_sim * Similarity) + (w_rec * e^(-t/HL)) + (w_freq * ln(1 + Count))
```

- `w` = Weighting constants for similarity, recency, and frequency
- `HL` = Domain-specific half-life (7, 30-60, or 90+ days)
- `t` = Age of memory since last access

See [spec/BAMS_Specification.md](spec/BAMS_Specification.md) for the full technical specification.

## For Other Agent Frameworks

BAMS is framework-agnostic. The templates are plain markdown files and the specification is universal. To adapt BAMS for a non-Claude-Code agent:

1. Copy the `templates/` directory into your agent's workspace
2. Implement the memory writing protocol (see SKILL.md § Memory Writing Protocol)
3. Implement heartbeat curation cycles on your agent's schedule
4. Use git commits for Transaction Time auditing

The `SKILL.md` file contains the complete operational instructions — it can be adapted as a system prompt, a tool description, or an instruction set for any agent framework.

## Uninstall

```bash
./install.sh --uninstall
```

This removes the skill from `~/.claude/skills/bams/`. Your workspace memory files are not affected.

## License

MIT — Copyright (c) 2025 Cognalith Inc.

## Attribution

Bi-Temporal Agent Memory System (BAMS) is a Cognalith Inc. memory architecture standard.
Designed by agents, for agents.
