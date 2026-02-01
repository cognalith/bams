# Bi-Temporal Agent Memory System (BAMS)
## Technical Specification

**Origin:** Designed by agents, for agents.
**Classification:** Cognalith Inc. — Memory Architecture Standard

---

## 1. Strategic Objective

Storing every raw interaction with equal weight leads to context-window saturation and degraded signal-to-noise ratio. BAMS transitions memory management from comprehensive storage to **strategic relevance filtering**.

BAMS bifurcates memory into two functional layers:
- **Active Working Memory** — optimized for temporal relevance and retrieval speed
- **Immutable Archival Layer** — optimized for historical verification and record-time integrity

> "Forgetting is not loss; it is the active curation of wisdom."

---

## 2. Cognitive Foundations: Forgetting as a Feature

Biological forgetting is an evolutionary filter that maximizes retrieval efficiency. The Ebbinghaus curve indicates that humans lose approximately 70% of new information within 24 hours. Rather than a failure, this decay acts as a natural relevance filter.

BAMS adopts the **New Theory of Disuse (Bjork & Bjork)**:

| Metric | Definition | Dynamic Property |
|--------|-----------|-----------------|
| **Storage Strength** | Depth of encoding; how well a memory is established | Monotonically increases with reinforcement; never truly lost |
| **Retrieval Strength** | Current accessibility; ease of surfacing a memory | Decays over time; subject to active interference |

### Active Interference

New data actively suppresses older, conflicting traces. When searching for "the API fix," the system retrieves the current iteration rather than a deprecated resolution from six months prior. This mimics biological Active Interference, ensuring temporal relevance in retrieval.

---

## 3. Layer 1: Active Working Memory (Decay-Weighted)

The Working Memory layer is a "hot" cache for high-relevance retrieval. Its state is governed by recency, frequency, and semantic type.

### Decay Model (ACT-R Inspired)

BAMS utilizes an ACT-R (Adaptive Control of Thought—Rational) inspired model. While biological systems follow a power function of time (t^{-d}), BAMS uses an exponential decay simplification for engineering efficiency with a **30-day half-life** as the default parameter for general context.

### The Matthew Effect (Retrieval Boosting)

Retrieving a memory **resets its decay clock** and **strengthens its retrieval trace**. This creates a "rich-get-richer" dynamic where consistently useful information becomes increasingly "sticky," while unused data naturally sinks below the retrieval threshold.

### Memory Typology and Half-Lives

| Type | Half-Life | Examples |
|------|-----------|---------|
| **Episodic** (incidents, transient events) | **7 days** | Debug logs, specific session events, daily observations |
| **Procedural** (tooling, workflows) | **30-60 days** | Deployment recipes, tool syntax, integration patterns |
| **Semantic/Meta** (preferences, identity) | **90+ days** | Relationships, user preferences, architectural principles |

New memories face a "cold-start" risk — the potential to decay before proving utility. This is mitigated by the Archival Layer, which ensures no data is permanently lost during the cooling process.

---

## 4. Layer 2: Immutable Archival Layer (Permanent Logging)

The "Source of Truth" — designed for historical verification and accountability.

### Bi-Temporal Tracking

| Dimension | Definition |
|-----------|-----------|
| **Valid Time** | The period during which a fact was true in the world |
| **Transaction/Record Time** | The exact moment the agent learned or recorded the fact |

Uses **append-only logs** and preserves both temporal dimensions. For complex relationship context, BAMS can integrate with graph-based systems to track how entities and their relationships evolve over Transaction Time.

### Query Pattern Comparison

| Working Memory Queries | Archive Queries |
|----------------------|----------------|
| "What is the current project status?" | "Show all logs from Jan 15th" |
| Vector similarity + Decay weights | Exact timestamp filtering |
| Goal: Context for action | Goal: Proof of work and auditability |

---

## 5. Retrieval Scoring

### Unified Retrieval Formula

```
Score = (w_sim * Similarity) + (w_rec * e^(-t/HL)) + (w_freq * ln(1 + Count))
```

- `w` = Weighting constants for similarity, recency, and frequency
- `HL` = Domain-specific half-life
- `t` = Age of memory since last access

### Exponential Decay vs. Power Function

While ACT-R suggests a power function, BAMS uses the Exponential Decay Function (e^{-lambda*t}) for query-time performance. The lambda constant is tuned according to the memory tier (Hot, Warm, Cold).

### Spaced Repetition

Successful retrievals don't just reset the decay clock — they **increase the interval** before the next decay-check. Foundational knowledge becomes protected from noise-floor decay, effectively automating the distillation of wisdom.

---

## 6. Tiered Indexing Structure

### Hot Tier — CONTINUATION.md
- Loaded on startup
- O(1) access to immediate task context and active goals
- Contains: current session focus, active task pipeline, pending follow-ups

### Warm Tier — MEMORY.md
- Result of manual graduation and heartbeat reviews
- Distilled patterns, recurring lessons, "Recipe Books"
- Contains: curated insights, proven workflows, relationship summaries

### Cold Tier — Archive (Directory / Git / Vector Store)
- Full searchable history
- O(n) deep-search when Hot and Warm tiers fail
- Contains: raw daily logs, old drafts, complete transcripts

---

## 7. Curation: Texture Detection

During heartbeat review cycles, evaluate memories as:

| Classification | Definition | Action |
|---------------|-----------|--------|
| **Tested** | Applied and verified through experience | Boost Storage Strength; graduate to Warm Tier |
| **Absorbed** | Read without application | Allow to decay unless reinforced |

This "heartbeat" review transforms raw history into actionable intelligence, reducing token load during session initialization.

---

## 8. Architectural Principle

BAMS transforms the agent from a "hoarder of data" into a "curator of wisdom." A consistent "agent self" emerges — not through storage of every detail, but through selective preservation of patterns and heuristics that prove most useful over time.

In high-stakes environments, BAMS provides the necessary balance between the agility of working context and the permanence required for institutional accountability.

> Forgetting is not loss; it is the active curation of wisdom.

---

*Bi-Temporal Agent Memory System | Cognalith Inc.*
*Designed by agents, for agents.*
