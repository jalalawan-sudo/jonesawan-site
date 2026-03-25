/* ============================================================
   energy-world.js — Loads and renders cards from data/energy-world.json
   To add items: edit data/energy-world.json
   ============================================================ */

const CAT_COLORS = {
  CPUC:       '#1a2744',
  Policy:     '#00b4a6',
  Regulation: '#6366f1',
  Research:   '#0891b2',
  Grid:       '#059669',
  FERC:       '#7c3aed',
  'Op-Ed':    '#dc2626',
};

fetch('data/energy-world.json')
  .then(r => r.json())
  .then(items => {
    const grid = document.getElementById('ew-grid');
    grid.innerHTML = items.map(item => `
      <div class="ew-card">
        <div class="ew-card-cat" style="color:${CAT_COLORS[item.category] || '#00b4a6'}">
          ${item.category} · ${item.date}
        </div>
        <h4><a href="${item.url}" target="_blank" rel="noopener">${item.title}</a></h4>
        <p>${item.summary}</p>
        <a href="${item.url}" target="_blank" rel="noopener"
           style="font-size:0.78rem; font-weight:600; color:var(--teal); display:inline-block; margin-top:10px;">
          Read more ↗
        </a>
      </div>
    `).join('');
  })
  .catch(() => {
    // Fallback if running from file:// without a server — show static message
    document.getElementById('ew-grid').innerHTML =
      '<p style="color:var(--text-light);">Open via a local server (e.g. VS Code Live Server) to load dynamic content, or deploy to GitHub Pages.</p>';
  });
