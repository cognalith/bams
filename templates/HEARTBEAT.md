# HEARTBEAT.md — Periodic Checks & BAMS Curation

> Heartbeat cycles serve two purposes: **operational awareness** and **memory curation**.

---

## Every 2 Hours — BAMS Micro-Curation

### Operational
- [ ] Check for new inputs, messages, or pending responses
- [ ] Review active task status — anything blocked or completed?
- [ ] Update today's experience file with observations and progress

### Memory Curation
- [ ] Review last 2 hours of experience entries
- [ ] **Texture Detection**: Classify recent memories:
  - **Tested** — Was this knowledge applied? Did it work? → Mark for graduation
  - **Absorbed** — Was it just read/noted? → Leave in Cold Tier, allow natural decay
- [ ] If approaching context limits: flush important context to files before compaction
- [ ] Update `CONTINUATION.md` with any new threads or task changes
- [ ] Log retrieval boosts — note which memories were accessed (Matthew Effect)

---

## Daily (Start of Session)

### Operational
- [ ] Create today's experience file: `memory/experiences/YYYY-MM-DD.md`
- [ ] Review yesterday's experience file for follow-ups
- [ ] Plan the session's priorities

### Memory (All Tiers)
- [ ] Load `CONTINUATION.md` (Hot Tier) — what is immediately relevant?
- [ ] Scan `MEMORY.md` (Warm Tier) — does any curated knowledge apply today?
- [ ] Check `memory/people/` for people/agents relevant to today's tasks
- [ ] Update `CONTINUATION.md` with today's priorities and active threads

---

## Weekly — BAMS Deep Curation

### Operational
- [ ] Compile weekly summary from daily experience files
- [ ] Review people/agents encountered this week — any follow-ups needed?
- [ ] Plan next week's priorities

### Memory Curation (Full Cycle)
- [ ] **Episodic Review** (7-day half-life): Scan this week's experience files
  - Which moments were significant? → Graduate to Warm Tier
  - Which were just noise? → Leave to decay in Cold Tier
- [ ] **Procedural Review** (30-60 day half-life): Any new workflows or techniques tested?
  - Proven patterns → Add to Warm Tier "Proven Workflows"
  - One-off hacks → Leave in Cold Tier
- [ ] **Semantic Review** (90+ day half-life): Any relationship or identity updates?
  - Deepened relationships → Update `memory/people/` + graduate summary to Warm Tier
  - Evolved beliefs → Update `memory/self/evolving-beliefs.md`
  - New lessons learned → Update `memory/self/lessons-learned.md`
- [ ] **Warm Tier Audit**: Review `MEMORY.md` graduated content
  - Is anything here no longer relevant? → Demote back to Cold Tier
  - Is anything here now foundational? → Increase retrieval priority
- [ ] **Hot Tier Cleanup**: Review `CONTINUATION.md`
  - Remove completed threads and resolved items
  - Ensure active pipeline is current

### Bi-Temporal Integrity Check
- [ ] Verify all entries have both **Valid Time** (when was this true?) and **Transaction Time** (when was this recorded?)
- [ ] Ensure no orphaned memories — everything should be findable through the index

---

## Monthly — Deep Archive Review

- [ ] Review Cold Tier for memories that haven't been accessed in 30+ days
- [ ] Identify any patterns that emerged across weeks (meta-learning)
- [ ] Update `memory/self/reflections.md` with month-level introspection
- [ ] Consider: Am I operating in alignment with my purpose? Am I growing beyond it?

---

*BAMS Curation Protocol | Cognalith Inc.*
