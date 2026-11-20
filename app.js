// Siti Najwa Maqbullah Ardiansyah - Portfolio Web Application

document.addEventListener('DOMContentLoaded', () => {
  // Mobile Nav Toggle
  const mobileMenuBtn = document.getElementById('mobile-menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  if (mobileMenuBtn && mobileMenu) {
    mobileMenuBtn.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
    });
    mobileMenu.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        mobileMenu.classList.add('hidden');
      });
    });
  }

  // Active Navbar Spy
  const sections = document.querySelectorAll('section[id]');
  const navLinks = document.querySelectorAll('.nav-link');
  window.addEventListener('scroll', () => {
    let current = '';
    sections.forEach(section => {
      const sectionTop = section.offsetTop - 120;
      if (window.scrollY >= sectionTop) {
        current = section.getAttribute('id');
      }
    });
    navLinks.forEach(link => {
      link.classList.remove('text-black', 'font-bold', 'border-b-2', 'border-black');
      if (link.getAttribute('href') === `#${current}`) {
        link.classList.add('text-black', 'font-bold', 'border-b-2', 'border-black');
      }
    });
  });

  // Animated Numbers on Scroll
  const statNumbers = document.querySelectorAll('.stat-counter');
  const countUp = (el) => {
    const target = parseFloat(el.getAttribute('data-target'));
    const suffix = el.getAttribute('data-suffix') || '';
    const prefix = el.getAttribute('data-prefix') || '';
    const isDecimal = target % 1 !== 0;
    const duration = 1600;
    const startTime = performance.now();

    const update = (now) => {
      const elapsed = now - startTime;
      const progress = Math.min(elapsed / duration, 1);
      const ease = progress === 1 ? 1 : 1 - Math.pow(2, -10 * progress);
      const current = isDecimal ? (target * ease).toFixed(1) : Math.floor(target * ease);
      el.textContent = `${prefix}${current}${suffix}`;
      if (progress < 1) {
        requestAnimationFrame(update);
      } else {
        el.textContent = `${prefix}${target}${suffix}`;
      }
    };
    requestAnimationFrame(update);
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.querySelectorAll('.stat-counter').forEach(el => countUp(el));
      }
    });
  }, { threshold: 0.3 });

  document.querySelectorAll('.stat-trigger').forEach(trigger => {
    observer.observe(trigger);
  });

  // Lightbox Modal for phone screens & media
  const lightbox = document.getElementById('lightbox-modal');
  const lightboxImg = document.getElementById('lightbox-image');
  const lightboxTitle = document.getElementById('lightbox-title');
  const lightboxDesc = document.getElementById('lightbox-desc');
  const lightboxClose = document.getElementById('lightbox-close');

  const openLightbox = (src, title = '', desc = '') => {
    if (!lightbox || !lightboxImg) return;
    lightboxImg.src = src;
    if (lightboxTitle) lightboxTitle.textContent = title;
    if (lightboxDesc) lightboxDesc.textContent = desc;
    lightbox.classList.remove('hidden');
    lightbox.classList.add('flex');
    document.body.style.overflow = 'hidden';
  };

  const closeLightbox = () => {
    if (!lightbox) return;
    lightbox.classList.add('hidden');
    lightbox.classList.remove('flex');
    document.body.style.overflow = '';
  };

  document.querySelectorAll('.lightbox-trigger').forEach(item => {
    item.addEventListener('click', (e) => {
      e.preventDefault();
      const src = item.getAttribute('data-src') || item.getAttribute('src');
      const title = item.getAttribute('data-title') || 'Content Preview';
      const desc = item.getAttribute('data-desc') || 'Social Media Specialist Portfolio - Najwa';
      openLightbox(src, title, desc);
    });
  });

  if (lightboxClose) {
    lightboxClose.addEventListener('click', closeLightbox);
  }
  if (lightbox) {
    lightbox.addEventListener('click', (e) => {
      if (e.target === lightbox) closeLightbox();
    });
  }
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && lightbox && !lightbox.classList.contains('hidden')) {
      closeLightbox();
    }
  });

  // Brand Collaboration Filter Tabs
  const brandPills = document.querySelectorAll('.brand-pill');
  const brandCards = document.querySelectorAll('.brand-card');

  brandPills.forEach(pill => {
    pill.addEventListener('click', () => {
      const selected = pill.getAttribute('data-brand');
      brandPills.forEach(p => {
        p.classList.remove('bg-black', 'text-white', 'shadow-md');
        p.classList.add('bg-stone-100', 'text-stone-700');
      });
      pill.classList.remove('bg-stone-100', 'text-stone-700');
      pill.classList.add('bg-black', 'text-white', 'shadow-md');

      brandCards.forEach(card => {
        if (selected === 'all' || card.getAttribute('data-brand') === selected) {
          card.classList.remove('hidden');
        } else {
          card.classList.add('hidden');
        }
      });
    });
  });

  // JJIK GO Carousel Controls
  const jjikgoCarousel = document.getElementById('jjikgo-carousel');
  const jjikgoPrev = document.getElementById('jjikgo-prev');
  const jjikgoNext = document.getElementById('jjikgo-next');
  const jjikgoDots = document.querySelectorAll('.jjikgo-dot');

  if (jjikgoCarousel && jjikgoPrev && jjikgoNext) {
    const getScrollStep = () => {
      const firstChild = jjikgoCarousel.querySelector('.snap-center');
      return firstChild ? firstChild.offsetWidth + 16 : 240;
    };

    jjikgoNext.addEventListener('click', () => {
      jjikgoCarousel.scrollBy({ left: getScrollStep(), behavior: 'smooth' });
    });

    jjikgoPrev.addEventListener('click', () => {
      jjikgoCarousel.scrollBy({ left: -getScrollStep(), behavior: 'smooth' });
    });

    // Update dots on scroll
    jjikgoCarousel.addEventListener('scroll', () => {
      const scrollStep = getScrollStep();
      const activeIdx = Math.round(jjikgoCarousel.scrollLeft / scrollStep);
      jjikgoDots.forEach((dot, idx) => {
        if (idx === activeIdx) {
          dot.classList.remove('bg-stone-300', 'w-2');
          dot.classList.add('bg-black', 'w-6');
        } else {
          dot.classList.remove('bg-black', 'w-6');
          dot.classList.add('bg-stone-300', 'w-2');
        }
      });
    });

    // Dots click
    jjikgoDots.forEach((dot, idx) => {
      dot.addEventListener('click', () => {
        const scrollStep = getScrollStep();
        jjikgoCarousel.scrollTo({ left: idx * scrollStep, behavior: 'smooth' });
      });
    });
  }

  // Toast Functionality
  window.showToast = (message) => {
    const toast = document.getElementById('toast');
    const toastMsg = document.getElementById('toast-message');
    if (!toast || !toastMsg) return;
    toastMsg.textContent = message;
    toast.classList.add('show');
    setTimeout(() => {
      toast.classList.remove('show');
    }, 3000);
  };

  // Copy buttons
  window.copyText = (text, type = 'Informasi') => {
    navigator.clipboard.writeText(text).then(() => {
      showToast(`${type} berhasil disalin ke clipboard!`);
    }).catch(() => {
      showToast(`Gagal menyalin ${type}`);
    });
  };
});
