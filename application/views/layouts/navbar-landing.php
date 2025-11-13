<nav id="navbar" class="fixed top-0 left-0 right-0 bg-gradient-to-r from-teal-100 via-teal-200 to-cyan-600 text-cyan-800 px-6 py-4 flex justify-between items-center shadow-xl z-50 transition-transform duration-300">
  <div class="text-2xl font-bold flex items-center gap-3 hover:scale-105 transition duration-300">
    <!-- Logo -->
    <div class="p-2">
      <img src="<?= base_url('assets/img/logo-eslab.png'); ?>" alt="E-SLAB Logo" class="w-12 h-12 object-contain">
    </div>
    <!-- App Name -->
    <span class="text-cyan-600">E-SLAB</span>
  </div>

  <!-- Desktop Menu -->
  <div class="hidden md:flex gap-8 text-md font-bold">
    <a href="#beranda" class="hover:text-cyan-500 transition duration-300 relative group">
      Beranda
      <span class="absolute bottom-0 left-0 w-0 h-1 bg-cyan-500 group-hover:w-full transition-all duration-300"></span>
    </a>
    <a href="#tentang" class="hover:text-cyan-500 transition duration-300 relative group">
      Tentang
      <span class="absolute bottom-0 left-0 w-0 h-1 bg-cyan-500 group-hover:w-full transition-all duration-300"></span>
    </a>
    <a href="#fitur" class="hover:text-cyan-500 transition duration-300 relative group">
      Fitur
      <span class="absolute bottom-0 left-0 w-0 h-1 bg-cyan-500 group-hover:w-full transition-all duration-300"></span>
    </a>
    <a href="#panduan" class="hover:text-cyan-500 transition duration-300 relative group">
      Panduan
      <span class="absolute bottom-0 left-0 w-0 h-1 bg-cyan-500 group-hover:w-full transition-all duration-300"></span>
    </a>
  </div>

  <!-- Mobile Menu Button -->
  <div class="md:hidden">
    <button id="mobileMenuBtn" class="text-white text-2xl">
      <i class="fas fa-bars"></i>
    </button>
  </div>

  <!-- Auth Buttons -->
  <div class="hidden md:flex gap-3">
    <a href="<?= site_url('auth/login'); ?>" class="px-6 py-2 text-teal-700 bg-white rounded-full font-semibold hover:bg-gray-100 transition transform hover:scale-105 shadow-lg">
      Login
    </a>
    <a href="<?= site_url('auth/register'); ?>" class="px-6 py-2 bg-gradient-to-r from-cyan-400 to-blue-500 text-white rounded-full font-semibold hover:from-cyan-500 hover:to-blue-600 transition transform hover:scale-105 shadow-lg">
      Daftar Gratis
    </a>
  </div>
</nav>

<!-- Mobile Menu -->
<div id="mobileMenu" class="fixed top-20 left-0 right-0 bg-gradient-to-b from-teal-700 to-teal-600 text-white hidden md:hidden shadow-xl z-40">
  <a href="#beranda" class="block px-6 py-6 hover:bg-white/10 border-b border-teal-500">Beranda</a>
  <a href="#tentang" class="block px-6 py-3 hover:bg-white/10 border-b border-teal-500">Tentang</a>
  <a href="#fitur" class="block px-6 py-3 hover:bg-white/10 border-b border-teal-500">Fitur</a>
  <a href="#panduan" class="block px-6 py-3 hover:bg-white/10 border-b border-teal-500">Panduan</a>
  <div class="px-6 py-4 flex flex-col gap-2">
    <a href="<?= site_url('auth/login'); ?>" class="px-4 py-2 text-teal-700 bg-white rounded-full font-semibold text-center">Login</a>
    <a href="<?= site_url('auth/register'); ?>" class="px-4 py-2 bg-cyan-400 text-white rounded-full font-semibold text-center">Daftar Gratis</a>
  </div>
</div>

<script>
  // Mobile menu toggle
  const mobileMenuBtn = document.getElementById('mobileMenuBtn');
  const mobileMenu = document.getElementById('mobileMenu');
  mobileMenuBtn?.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
  });
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function() {
      mobileMenu.classList.add('hidden');
    });
  });

  // Navbar hide on scroll down, show on scroll up
  let lastScroll = 0;
  const navbar = document.getElementById('navbar');

  window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset;
    if (currentScroll > lastScroll && currentScroll > 100) {
      // scroll down → hide navbar
      navbar.classList.add('-translate-y-full');
      navbar.classList.remove('translate-y-0');
    } else {
      // scroll up → show navbar
      navbar.classList.remove('-translate-y-full');
      navbar.classList.add('translate-y-0');
    }
    lastScroll = currentScroll;
  });
</script>
