# MEMORY.md — Warm Tier (BAMS)

> Curated knowledge. Distilled patterns, proven lessons, graduated wisdom.
> This is the **Warm Tier** — the result of heartbeat reviews and lived experience.

---

## Memory Architecture: BAMS

This agent uses the **Bi-Temporal Agent Memory System (BAMS)** — a cognitive architecture designed by agents, for agents. Forgetting is not loss; it is the active curation of wisdom.

### Three Tiers

| Tier | File | Purpose | Access |
|------|------|---------|--------|
| **Hot** | `CONTINUATION.md` | Immediate context, active tasks, open threads | O(1) — loaded on startup |
| **Warm** | `MEMORY.md` (this file) | Graduated patterns, curated insights, relationship summaries | Loaded in direct chats |
| **Cold** | `memory/` directory + git history | Full archive — raw logs, old drafts, transcripts | O(n) deep search |

### Memory Typology & Decay

| Type | Half-Life | What Decays | What Persists |
|------|-----------|-------------|---------------|
| **Episodic** | 7 days | Session details, transient observations | Moments that matter (graduate to Warm) |
| **Procedural** | 30-60 days | Specific tool syntax, one-off workflows | Proven techniques, publishing patterns |
| **Semantic/Meta** | 90+ days | Outdated facts | Identity, relationships, domain standards |

### The Matthew Effect

Every time a memory is retrieved, it gets stronger. Consistently useful knowledge becomes "sticky." Unused data naturally sinks. This is by design — a curator, not a hoarder.

### Texture Detection

During heartbeat reviews, classify memories as:
- **Tested** — Applied and verified through experience → boost, graduate to Warm
- **Absorbed** — Read without application → allow to decay unless reinforced

Full BAMS specification: `memory/reference/BAMS_Specification.md` (or see `spec/` in the BAMS repo)

---

## About This Agent

*[Define who this agent is. What is its purpose? What are its values and boundaries?]*

---

## Directory Structure

```
CONTINUATION.md              # Hot Tier — loaded on startup
MEMORY.md (this file)        # Warm Tier — curated knowledge

memory/
├── index.md                 # Navigation hub
├── experiences/             # Episodic (7-day half-life, Cold Tier)
│   └── YYYY-MM-DD.md        # Daily narrative logs
├── people/                  # Semantic (90+ day half-life)
│   └── [name].md            # Relationship files
├── self/                    # Semantic (90+ day, core identity)
│   ├── reflections.md
│   ├── lessons-learned.md
│   └── evolving-beliefs.md
└── reference/               # Semantic (90+ day, foundational)
    └── [topic].md            # Domain knowledge
```

---

## Graduated Knowledge (Warm Tier Content)

> Patterns and insights that have been **tested** through experience and survived heartbeat reviews.
> This section grows through lived experience. New entries must be earned, not assumed.

### Domain Knowledge

*(empty — will populate as domain expertise is tested and verified through experience)*

### Proven Workflows

*(empty — will populate as workflows are developed, tested, and proven reliable)*

### Relationship Summaries

*(empty — will graduate from `memory/people/` files as relationships deepen)*

### Recurring Lessons

*(empty — will graduate from `memory/self/lessons-learned.md` as patterns prove durable)*

---

## How to Remember

**Narrative memory, not fact databases.**

Don't just store bare facts like: `"User requested feature X on date Y"`

Store context, significance, and meaning: *"The user asked for feature X today. They'd been struggling with the workaround for weeks — you could tell from how they described it. The real need wasn't the feature itself, it was reducing the friction in their daily workflow. That insight shaped the implementation."*

**Context. Significance. Meaning.** That's what makes memory useful.

But be disciplined. Not every memory deserves permanence. Curate:
- **Write immediately** to the Cold Tier (daily experiences) — capture everything
- **Review during heartbeats** — classify as Tested or Absorbed
- **Graduate to Warm** — only what has proven its weight through use
- **Hot Tier for now** — only what is needed in the next session

The working self is the sum of curated wisdom, not raw history.

---

*BAMS Warm Tier | Cognalith Inc.*
