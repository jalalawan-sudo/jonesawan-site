# CalNews Update Workflow
**Jones-Awan Consulting Website — Internal Reference**

---

## Quick Reference (what to say next time)

```
/update-calnews
```

That's it. The agent handles everything — research, shows you stories, waits for your approval, archives the old week, writes the new week, commits and pushes to both repos.

---

## What the agent does (4-phase workflow)

```
Phase 1 → Research        Research agent searches all approved sources for the week
Phase 2 → SHOW & WAIT     Presents numbered list of stories. YOU pick which ones.
Phase 3 → CONFIRM ARCHIVE Asks if you want to archive the current issue. YOU confirm.
Phase 4 → Implement       Writes files, archives old week, commits, pushes both repos.
```

**Critical rule baked in:** The agent will NEVER write files before you approve the story list. You will always be shown the research first.

---

## Approved research sources (in priority order)

| Source | Beat | Notes |
|--------|------|-------|
| CalMatters | Energy, climate, CPUC, politics | Lazo (pipeline), Carollo (solar/NEM), Walters (commentary), Kuang (rates) |
| Canary Media | Clean energy, solar, heat pumps, grid | St. John (grid/solar), Takemura (buildings/gas) |
| CalRegulatory | CPUC voting meeting results | Best source for weekly CPUC roundups |
| CPUC news page | Press releases, decisions | cpuc.ca.gov/news-and-updates |
| Utility Dive | California utility/grid | Good for procurement and grid stories |
| LA Times | Energy beat | Often blocks crawlers; try if accessible |

---

## What gets created/updated each week

```
Website/calnews.html                    ← main page, full rewrite of STORIES + RECENT arrays
Website/archive/calnews-YYYY-MM-DD.html ← frozen copy of the outgoing week (new file each week)
```

Both are committed to:
- `claude-code-test` (dev repo — github.com/jalalawan-sudo/claude-code-test)
- `jonesawan-site` (live site — github.com/jalalawan-sudo/jonesawan-site → www.jonesawan.com)

---

## calnews.html structure (for reference)

All content is driven by two JS arrays in the `<script>` block at the bottom:

```js
const STORIES = [...]   // 7–10 story objects; JS picks random featured story
const RECENT  = [...]   // exactly 4 recent development cards (top strip)
```

Story object shape:
```js
{
  id: 20,                    // increment from highest existing id
  title: "...",
  url: "https://...",        // verified URL only
  date: "March 24, 2026",
  source: "CalMatters",
  author: "Alejandro Lazo",  // exact byline; null if not found
  category: "Pipeline · Federal Conflict",
  summary: "...with <strong>key figures</strong> bolded...",
  relatedCalreg: { label: "A.24-04-017 — LS Power CPCN", anchor: "proc-a2404017" }
  // or: relatedCalreg: null
}
```

Recent item object shape:
```js
{
  type: "CPUC Decision",
  typeColor: "#0369a1",
  title: "...",
  desc: "One-sentence description.",
  date: "March 23, 2026 · R.25-07-013",
  url: "https://..."
}
```

---

## Archive file rules

- Filename: `calnews-YYYY-MM-DD.html` where date = last day of the outgoing week
- All relative paths become `../` prefixed: `css/style.css` → `../css/style.css`
- Archive banner added at top of `<body>` pointing back to current issue
- Sidebar: current = `../calnews.html` (link to live page), archived week = `active`
- JS arrays and render code are frozen exactly — no changes

---

## Sidebar structure in calnews.html

```html
<div class="cn-sidebar-hdg">Current Issue</div>
<a href="calnews.html" class="cn-sidebar-link active">Week of Mar 16–24, 2026</a>

<div class="cn-sidebar-hdg">Archive</div>
<a href="archive/calnews-2026-03-13.html" ...>Week of Mar 9–13, 2026</a>
<a href="archive/calnews-2026-03-06.html" ...>Week of Mar 2–6, 2026</a>
<!-- older entries below -->
```

Each update: move current → first archive entry; new week → current.

---

## Repo sync (both repos must always match)

| Repo | Location | GitHub | Live URL |
|------|----------|--------|----------|
| Dev (source of truth) | `/Users/jawan/Documents/Claude Code Test/Website/` | jalalawan-sudo/claude-code-test | — |
| Live site | `/tmp/jonesawan-site/` | jalalawan-sudo/jonesawan-site | www.jonesawan.com |

If `/tmp/jonesawan-site` is missing (e.g. after reboot):
```bash
git clone https://github.com/jalalawan-sudo/jonesawan-site /tmp/jonesawan-site
```

---

## Story selection preferences (what Jalal has approved in the past)

- **Always include** CPUC voting meeting results (CalRegulatory roundup) — highest signal
- **Always include** major CPUC decisions (rate cases, procurement orders, denials)
- **High value**: stories with specific dollar figures, docket numbers, MW/GW figures
- **High value**: federal-state conflict stories relevant to California utilities
- **Mix sources**: don't run all CalMatters or all Canary Media — variety preferred
- **Avoid**: pure opinion pieces without regulatory hook; stories older than 10 days

---

## Type colors for RECENT items

```
Leadership     #00b4a6  (teal)
Major Decision #0369a1  (blue)
Court Decision #7c3aed  (purple)
Ratepayer Win  #b45309  (amber)
Litigation     #dc2626  (red)
Grid           #00b4a6  (teal)
CPUC Action    #b45309  (amber)
```

---

## History of issues published

| Issue | Archive file | Stories | Updated |
|-------|-------------|---------|---------|
| Week of Mar 16–24, 2026 | (current) | 8 | Mar 24, 2026 |
| Week of Mar 9–13, 2026 | calnews-2026-03-13.html | 9 | Mar 12, 2026 |
| Week of Mar 2–6, 2026 | calnews-2026-03-06.html | — | — |
| Week of Feb 23–27, 2026 | calnews-2026-02-28.html | — | — |
| Week of Feb 16–20, 2026 | calnews-2026-02-21.html | — | — |
