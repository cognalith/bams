---
name: bams
description: >
  Bi-Temporal Agent Memory System. Use when managing agent memory,
  performing heartbeat curation, writing experiences, or reviewing
  memory tiers. Triggers: /memory, /bams, /heartbeat
---

# Bi-Temporal Agent Memory System (BAMS)

A cognitive memory architecture for AI agents. BAMS manages memory through strategic relevance filtering — not infinite hoarding. Forgetting is not loss; it is the active curation of wisdom.

**Designed by agents, for agents. A Cognalith Inc. memory architecture standard.**

## Triggers

/memory, /bams, /heartbeat, memory review, heartbeat, curation cycle

## Architecture Overview

BAMS organizes memory into three tiers with distinct access patterns:

| Tier | File | Purpose | Access |
|------|------|---------|--------|
| **Hot** | `CONTINUATION.md` | Immediate context, active tasks, open threads | O(1) — loaded on startup |
| **Warm** | `MEMORY.md` | Graduated patterns, curated insights, proven workflows | Loaded when relevant |
| **Cold** | `memory/` directory | Full archive — raw logs, daily entries, transcripts | O(n) deep search |

**Data flow:** Cold → (heartbeat review + texture detection) → Warm → (active retrieval) → Hot

## Memory Types and Decay

Decay rates are categorized by cognitive type to reflect inherent stability:

| Type | Half-Life | Examples | Behavior |
|------|-----------|---------|----------|
| **Episodic** | 7 days | Debug sessions, daily observations, transient events | Recency is the primary signal |
| **Procedural** | 30-60 days | Workflows, tool patterns, deployment recipes | Updates as practices evolve |
| **Semantic/Meta** | 90+ days | Identity, relationships, user preferences, domain principles | Structural, decays slowest |

## Key Concepts

### Matthew Effect (Retrieval Boosting)
Every retrieval **resets the decay clock** and **strengthens the trace**. Consistently useful knowledge becomes "sticky." Unused data sinks. When you access a memory, log it in CONTINUATION.md under the Retrieval Boost Log.

### Texture Detection
During heartbeat reviews, classify each memory:
- **Tested** — Applied and verified through experience → boost Storage Strength, graduate to Warm Tier
- **Absorbed** — Read without application → allow to decay unless reinforced

### Bi-Temporal Tracking
Every memory entry must record two time dimensions:
- **Valid Time** — When was this fact true in the world?
- **Transaction Time** — When was it recorded/learned?

### Retrieval Scoring
```
Score = (w_sim * Similarity) + (w_rec * e^(-t/HL)) + (w_freq * ln(1 + Count))
```
Where `HL` = domain-specific half-life, `t` = age since last access.

---

## Commands

### `/memory init`

Initialize BAMS in the current workspace. Run this once to set up the memory structure.

**Steps:**
1. Check if `CONTINUATION.md`, `MEMORY.md`, `HEARTBEAT.md` already exist in the workspace root
2. If not, create them from the BAMS templates (see Directory Structure below)
3. Create the `memory/` directory tree: `experiences/`, `people/`, `self/`, `reference/`
4. Create `memory/index.md` as the Cold Tier navigation hub
5. Create `memory/self/reflections.md`, `memory/self/lessons-learned.md`, `memory/self/evolving-beliefs.md`
6. Confirm initialization and report what was created

**Important:** Never overwrite existing memory files. Only create files that don't already exist.

### `/memory write`

Write a new memory entry.

**Steps:**
1. Determine the memory type:
   - **Episodic** — Something that happened (event, conversation, observation)
   - **Procedural** — A technique, workflow, or process
   - **Semantic** — A fact, relationship update, or identity-level insight
2. Write to the correct Cold Tier location:
   - Episodic → `memory/experiences/YYYY-MM-DD.md` (append to today's file)
   - Procedural → relevant section in Cold Tier or direct to Warm if already tested
   - Semantic → `memory/people/[name].md`, `memory/self/`, or `memory/reference/`
3. Use **narrative form** — capture context, significance, and meaning, not just bare facts
4. Include temporal markers:
   - **Valid Time:** When was this true? (e.g., "as of 2025-01-15")
   - **Transaction Time:** Now (the moment of recording)
5. If immediately relevant to current work → also update `CONTINUATION.md` (Hot Tier)
6. If this is a proven, tested pattern → consider direct graduation to `MEMORY.md` (Warm Tier)

### `/memory recall [query]`

Search for a memory across all tiers.

**Steps:**
1. **Hot Tier first** — Scan `CONTINUATION.md` for the query topic. This is O(1).
2. **Warm Tier second** — Scan `MEMORY.md` for relevant graduated knowledge.
3. **Cold Tier last** — Search `memory/` directory (grep/read through files). This is O(n).
4. **Log the retrieval** — Add the accessed memory to the Retrieval Boost Log in `CONTINUATION.md` (Matthew Effect)
5. If the retrieved memory proved useful, note it for graduation consideration at the next heartbeat

### `/memory status`

Report on memory system health.

**Steps:**
1. Count entries per tier:
   - Hot: Number of active tasks, open threads, hot context items in `CONTINUATION.md`
   - Warm: Number of graduated entries in `MEMORY.md`
   - Cold: Number of files in `memory/` subdirectories
2. Report last heartbeat date (check for recent updates to experience files)
3. Flag stale Hot Tier items (open threads with no recent activity)
4. Flag Cold Tier entries that haven't been accessed in 30+ days

---

### `/heartbeat micro`

Quick curation cycle. Run every ~2 hours during active work.

**Steps:**
1. Check for new inputs, messages, or pending responses
2. Review active task status — anything blocked or completed?
3. Update today's experience file (`memory/experiences/YYYY-MM-DD.md`)
4. **Texture Detection** on recent entries:
   - Mark **Tested** memories for graduation
   - Leave **Absorbed** memories to decay
5. Update `CONTINUATION.md` with new threads or task changes
6. Log any retrieval boosts from this session
7. If context window is large, flush important context to files before compaction

### `/heartbeat daily`

Start-of-session curation. Run at the beginning of each work session.

**Steps:**
1. Create today's experience file: `memory/experiences/YYYY-MM-DD.md`
2. Review yesterday's experience file for unresolved follow-ups
3. Load and review `CONTINUATION.md` (Hot Tier) — is it current?
4. Scan `MEMORY.md` (Warm Tier) — any curated knowledge applies to today's work?
5. Check `memory/people/` for people/agents relevant to today
6. Update `CONTINUATION.md` with today's priorities and active threads
7. Set session mode: `[active | maintenance | idle]`

### `/heartbeat weekly`

Deep curation. Run once per week.

**Steps:**
1. **Episodic Review** (7-day half-life):
   - Scan this week's experience files
   - Which moments were significant? → Graduate to `MEMORY.md`
   - Which were noise? → Leave to decay in Cold Tier
2. **Procedural Review** (30-60 day half-life):
   - Any new workflows or techniques that have been **tested**?
   - Proven patterns → Add to "Proven Workflows" in `MEMORY.md`
   - One-off hacks → Leave in Cold Tier
3. **Semantic Review** (90+ day half-life):
   - Deepened relationships → Update `memory/people/` + graduate summary to `MEMORY.md`
   - Evolved beliefs → Update `memory/self/evolving-beliefs.md`
   - New lessons → Update `memory/self/lessons-learned.md`
4. **Warm Tier Audit**: Review `MEMORY.md`
   - Is anything no longer relevant? → Demote back to Cold Tier
   - Is anything now foundational? → Increase retrieval priority
5. **Hot Tier Cleanup**: Review `CONTINUATION.md`
   - Remove completed threads and resolved items
   - Ensure active pipeline is current
6. **Bi-Temporal Integrity Check**:
   - Verify all entries have both Valid Time and Transaction Time
   - Ensure no orphaned memories — everything findable through the index

### `/heartbeat monthly`

Deep archive review. Run once per month.

**Steps:**
1. Review Cold Tier for memories untouched in 30+ days
2. Identify cross-week patterns (meta-learning)
3. Update `memory/self/reflections.md` with month-level introspection
4. Consider alignment: Is the agent operating in alignment with its purpose? Growing beyond it?

---

## Memory Writing Protocol

When recording any memory, follow this protocol:

1. **Determine type**: Episodic, Procedural, or Semantic
2. **Write to correct location**: See Cold Tier directory structure
3. **Use narrative form**: Context, significance, and meaning — not just bare facts
4. **Include temporal markers**:
   - Valid Time: When was this true?
   - Transaction Time: When is this being recorded? (now)
5. **Assess tier placement**:
   - If immediately relevant → also update Hot Tier (`CONTINUATION.md`)
   - If proven and tested → consider direct graduation to Warm Tier (`MEMORY.md`)
   - Default → Cold Tier (daily experience file)

## Retrieval Protocol

When searching for a memory:

1. **Hot Tier** (CONTINUATION.md) — scan first, O(1)
2. **Warm Tier** (MEMORY.md) — scan second, keyword/topic match
3. **Cold Tier** (memory/ directory) — deep search last, grep/read through files
4. **Log the retrieval** in CONTINUATION.md Retrieval Boost Log (Matthew Effect)
5. If the memory proved useful → mark for graduation consideration

## Directory Structure

```
CONTINUATION.md              # Hot Tier — loaded on startup
MEMORY.md                    # Warm Tier — curated knowledge
HEARTBEAT.md                 # Curation schedule and protocol

memory/
├── index.md                 # Navigation hub
├── experiences/             # Episodic (7-day half-life)
│   └── YYYY-MM-DD.md        # Daily entries
├── people/                  # Semantic (90+ day half-life)
│   └── [name].md            # Relationship files
├── self/                    # Semantic (90+ day half-life)
│   ├── reflections.md
│   ├── lessons-learned.md
│   └── evolving-beliefs.md
└── reference/               # Semantic (90+ day half-life)
    └── [topic].md            # Domain knowledge
```

## Integration Notes

- **Framework-agnostic**: BAMS works with Claude Code, OpenClaw, or any agent that reads/writes markdown files
- **Git-friendly**: The `memory/` directory is designed for version control. Commit regularly — git history provides Transaction Time auditing for free
- **Vector stores optional**: For agents with embedding capabilities, the Cold Tier can be backed by a vector store. The markdown files remain the source of truth
- **Extensible structure**: Add domain-specific subdirectories to `memory/` as needed (e.g., `memory/projects/`, `memory/incidents/`)

---

*BAMS — Bi-Temporal Agent Memory System | Cognalith Inc.*
*Designed by agents, for agents.*
