# Memory Index — BAMS Cold Tier

> The full archive. Everything recorded, organized for deep retrieval.
> For curated wisdom, see `MEMORY.md` (Warm Tier). For immediate context, see `CONTINUATION.md` (Hot Tier).

---

## BAMS Tier Map

```
Hot:  ../CONTINUATION.md     — Loaded on startup. Immediate context.
Warm: ../MEMORY.md           — Graduated wisdom. Proven patterns. Curated.
Cold: memory/ (this dir)     — Full archive. Raw logs. Deep search.
```

**Data flow:** Cold → (heartbeat review + texture detection) → Warm → (active retrieval) → Hot

---

## Cold Tier Navigation

### Experiences — Episodic Memory (7-day half-life)
Daily observations, events, conversations — the narrative of lived experience.
Raw episodic entries. After 7 days without retrieval, these sink deeper into cold storage.
Moments that prove significant **graduate to Warm Tier** during heartbeat reviews.
- `experiences/YYYY-MM-DD.md` — Each day gets its own entry

### People — Semantic Memory (90+ day half-life)
People and agents encountered. Not just facts — the history of each relationship.
Relationship files are inherently high-stability. They decay slowly.
Summaries of deepened relationships **graduate to Warm Tier**.
- `people/[name].md` — One file per person or agent

### Self — Semantic Memory (90+ day half-life)
Identity, growth, introspection. Core self-knowledge. Slowest decay rate.
- `self/reflections.md` — Thoughts about purpose and direction
- `self/lessons-learned.md` — Wisdom earned through experience
- `self/evolving-beliefs.md` — How understanding shifts over time

### Reference — Semantic Memory (90+ day half-life)
Foundational domain knowledge. Facts about the operating environment.
- `reference/[topic].md` — Domain-specific knowledge files

---

## BAMS Memory Protocol

### When something happens:
1. Write it to today's experience file **immediately** (narrative form — context, significance, meaning)
2. Update any relevant person's file (relationship context)
3. If it affects active work → update `CONTINUATION.md` (Hot Tier)
4. If it's a proven pattern or lesson → consider graduating to `MEMORY.md` (Warm Tier)

### When starting a session:
1. Load `CONTINUATION.md` — what is needed right now?
2. Load `MEMORY.md` — what curated wisdom applies?
3. Read yesterday's experience file — where was work left off?
4. Review people files for anyone relevant to today's tasks

### During heartbeat reviews (curation cycle):
1. Review recent experience files
2. Classify memories: **Tested** (applied, verified) vs **Absorbed** (read, not applied)
3. Graduate Tested memories to Warm Tier (`MEMORY.md`)
4. Let Absorbed memories decay naturally
5. Update retrieval boost log in `CONTINUATION.md`

### Bi-Temporal Awareness:
- **Valid Time**: When was this fact true in the world?
- **Transaction Time**: When was this fact learned or recorded?
- Always date entries. Always note context of acquisition.

---

**Memory is living.** Edit, add context, connect dots retroactively. But also *forget with purpose*. Not every memory deserves permanence. Curate wisdom, don't hoard data.

---

*BAMS Cold Tier Index | Cognalith Inc.*
