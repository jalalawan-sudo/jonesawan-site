/* ============================================================
   main.js — Nav, mobile menu, counters, active links
   ============================================================ */

const NAV_HTML = `
<nav id="nav">
  <div class="nav-inner">
    <a class="nav-logo" href="index.html"><span>Jones-Awan</span> Consulting, LLC</a>
    <button class="nav-toggle" aria-label="Toggle menu" onclick="toggleMenu()">
      <span></span><span></span><span></span>
    </button>
    <ul class="nav-links" id="navLinks">
      <li><a href="index.html">Home</a></li>
      <li><a href="about.html">About</a></li>
      <li><a href="calreg.html">CalReg</a></li>
      <li><a href="calnews.html">CalNews</a></li>
      <li><a href="contact.html" class="nav-cta">Contact</a></li>
    </ul>
  </div>
</nav>`;

const FOOTER_HTML = `
<footer>
  <div class="footer-inner">
    <div>© ${new Date().getFullYear()} Jalal Awan, Ph.D. All rights reserved.</div>
    <div class="footer-links">
      <a href="index.html">Home</a>
      <a href="about.html">About</a>
      <a href="calreg.html">CalReg</a>
      <a href="calnews.html">CalNews</a>
      <a href="contact.html">Contact</a>
    </div>
    <div class="social-icons">
      <a href="https://www.linkedin.com/in/jalal-awan-bb43957/" target="_blank" class="social-icon" title="LinkedIn">in</a>
      <a href="https://scholar.google.com/citations?user=0A3_DZUAAAAJ&hl=en" target="_blank" class="social-icon" title="Google Scholar">GS</a>
    </div>
  </div>
</footer>`;

document.addEventListener('DOMContentLoaded', () => {
  document.body.insertAdjacentHTML('afterbegin', NAV_HTML);
  document.body.insertAdjacentHTML('beforeend', FOOTER_HTML);

  // Highlight active nav link
  const page = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-links a').forEach(a => {
    if (a.getAttribute('href') === page) a.classList.add('active');
  });

  // Animated counters — all start simultaneously when .hero-stats enters viewport
  const statsContainer = document.querySelector('.hero-stats');
  if (statsContainer) {
    const counters = statsContainer.querySelectorAll('.hero-stat-num[data-target]');
    if (counters.length) {
      const dur = 1800;
      let started = false;
      const io = new IntersectionObserver(entries => {
        entries.forEach(entry => {
          if (!entry.isIntersecting || started) return;
          started = true;
          io.disconnect();
          const startTime = performance.now();
          const animate = (now) => {
            const elapsed  = now - startTime;
            const progress = Math.min(elapsed / dur, 1);
            // ease-out cubic
            const eased = 1 - Math.pow(1 - progress, 3);
            counters.forEach(el => {
              const end  = +el.dataset.target;
              const pre  = el.dataset.prefix || '';
              const suf  = el.dataset.suffix || '';
              const step = +(el.dataset.step  || 1);
              const raw  = eased * end;
              const val  = progress < 1
                ? Math.floor(raw / step) * step
                : end;
              el.textContent = pre + val + suf;
            });
            if (progress < 1) requestAnimationFrame(animate);
          };
          requestAnimationFrame(animate);
        });
      }, { threshold: 0.5 });
      io.observe(statsContainer);
    }
  }
});

function toggleMenu() {
  document.getElementById('navLinks').classList.toggle('open');
}

document.addEventListener('click', e => {
  if (e.target.closest('.nav-links a')) {
    document.getElementById('navLinks')?.classList.remove('open');
  }
});
