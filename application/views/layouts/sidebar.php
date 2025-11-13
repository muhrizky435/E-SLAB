<?php
// Ambil role & segmen URI untuk deteksi menu aktif
$role = $this->session->userdata('role');
$seg1 = $this->uri->segment(1); // cont: 'admin' atau controller user
$seg2 = $this->uri->segment(2); // cont: 'user', 'dashboard_admin', 'katalog_alat'
$seg3 = $this->uri->segment(3);

// Tentukan "current" key yg mudah dipakai untuk pengecekan menu aktif
// Jika route memakai prefix 'admin', gunakan seg2; jika non-admin, gunakan seg1.
if ($seg1 === 'admin') {
  $current = $seg2 ?: 'dashboard_admin';
} else {
  $current = $seg1 ?: 'dashboard';
}

// Helper singkat (array check) untuk membuat kondisi open/active lebih rapi
$is_in = function ($keys) use ($current) {
  return in_array($current, (array)$keys, true);
};
?>

<!-- Sidebar Desktop -->
<aside id="sidebar" class="hidden md:block fixed top-0 left-0 w-64 h-full bg-gradient-to-b from-[#66D2CE] to-[#4FC6B3] text-white font-semibold p-5 z-40 shadow-xl transition-all">
  <div class="flex flex-col items-center mb-8 gap-3">
    <a href="<?= site_url('dashboard'); ?>" class="flex flex-col items-center group">

      <!-- Logo di atas teks -->
      <div class="w-16 h-16 bg-white/30 rounded-2xl flex items-center justify-center shadow-md backdrop-blur-sm mb-2 
                transition-transform duration-300 transform group-hover:scale-110">
        <img src="<?= base_url('assets/img/logo-eslab.png'); ?>" alt="Logo E-SLAB" class="w-10 h-10 object-contain drop-shadow-lg" />
      </div>

      <!-- Tulisan E-SLAB -->
      <div class="flex items-center space-x-2 transition-transform duration-300 transform group-hover:-translate-y-1 cursor-pointer">
        <span class="text-3xl font-extrabold drop-shadow-md tracking-wide">E-SLAB</span>
      </div>

      <!-- Garis bawah animasi -->
      <div class="w-20 border-b-2 border-white/80 rounded transition-transform duration-300 transform group-hover:scale-x-110"></div>
    </a>
  </div>

  <nav class="space-y-2">
    <?php if ($role === 'user'): ?>

      <!-- Dashboard (user) -->
      <a href="<?= site_url('dashboard'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl transition-colors duration-200 <?= $current === 'dashboard' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/40' ?>">
        <i class="fa-solid fa-house"></i>
        <span>Dashboard</span>
      </a>

      <!-- Peminjaman (user) -->
      <div x-data="{ openBarang: <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'true' : 'false' ?> }">
        <button @click="openBarang = !openBarang"
          class="flex items-center justify-between w-full px-4 py-2 rounded-xl mt-4 transition-colors duration-200 <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
          <span class="flex items-center gap-3"><i class="fa-solid fa-box"></i><span>Peminjaman</span></span>
          <i :class="openBarang ? 'fa-chevron-up' : 'fa-chevron-down'" class="fa-solid"></i>
        </button>
        <div x-show="openBarang" x-transition class="ml-8 mt-2 space-y-1 text-sm">
          <a href="<?= site_url('peminjaman/alat'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'katalog_alat' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Katalog Alat
          </a>
          <a href="<?= site_url('peminjaman/bahan'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'katalog_bahan' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Katalog Bahan
          </a>
        </div>
      </div>

      <!-- Keranjang -->
      <a href="<?= site_url('keranjang'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl transition-colors duration-200 <?= $current === 'keranjang' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
        <i class="fa-solid fa-cart-shopping"></i>
        <span>Keranjang</span>
      </a>

      <!-- Riwayat -->
      <a href="<?= site_url('riwayat'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl transition-colors duration-200 <?= $current === 'riwayat' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
        <i class="fa-solid fa-clock-rotate-left"></i>
        <span>Riwayat</span>
      </a>

      <!-- Notifikasi -->
      <a href="<?= site_url('notifikasi'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl transition-colors duration-200 <?= $current === 'notifikasi' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
        <i class="fa-solid fa-bell"></i>
        <span>Notifikasi</span>
      </a>

      <!-- Bantuan -->
      <a href="<?= site_url('bantuan'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl transition-colors duration-200 <?= $current === 'bantuan' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
        <i class="fa-solid fa-circle-question"></i>
        <span>Bantuan</span>
      </a>

      <!-- Setting -->
      <a href="<?= site_url('profile_setting'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl transition-colors duration-200 <?= $current === 'profile_setting' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
        <i class="fa-solid fa-cog"></i>
        <span>Setting</span>
      </a>

      <!-- Logout -->
      <a href="<?= site_url('auth/logout'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl mt-4 bg-red/60 hover:bg-red-300 transition-colors duration-200 text-red-600 font-semibold">
        <i class="fa-solid fa-right-from-bracket"></i>
        <span>Log Out</span>
      </a>

    <?php elseif ($role === 'admin'): ?>

      <!-- Dashboard Admin -->
      <a href="<?= site_url('admin/dashboard_admin'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl transition-colors duration-200 <?= $current === 'dashboard_admin' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
        <i class="fa-solid fa-house"></i>
        <span>Dashboard</span>
      </a>

      <!-- Data Barang (admin) -->
      <div x-data="{ openBarang: <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'true' : 'false' ?> }">
        <button @click="openBarang = !openBarang"
          class="flex items-center justify-between w-full px-4 py-2 rounded-xl mt-4 transition-colors duration-200 <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
          <span class="flex items-center gap-3"><i class="fa-solid fa-box"></i><span>Data Barang</span></span>
          <i :class="openBarang ? 'fa-chevron-up' : 'fa-chevron-down'" class="fa-solid"></i>
        </button>
        <div x-show="openBarang" x-transition class="ml-8 mt-2 space-y-1 text-sm">
          <a href="<?= site_url('admin/katalog_alat'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'katalog_alat' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Data Alat
          </a>
          <a href="<?= site_url('admin/katalog_bahan'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'katalog_bahan' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Data Bahan
          </a>
        </div>
      </div>

      <!-- Peminjaman (admin) -->
      <div x-data="{ openPeminjaman: <?= $is_in(['adminpeminjaman', 'pengembalian', 'daftarRiwayat']) ? 'true' : 'false' ?> }">
        <button @click="openPeminjaman = !openPeminjaman"
          class="flex items-center justify-between w-full px-4 py-2 rounded-xl mt-2 transition-colors duration-200 <?= $is_in(['adminpeminjaman', 'pengembalian']) ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
          <span class="flex items-center gap-3"><i class="fa-solid fa-book"></i><span>Peminjaman</span></span>
          <i :class="openPeminjaman ? 'fa-chevron-up' : 'fa-chevron-down'" class="fa-solid"></i>
        </button>
        <div x-show="openPeminjaman" x-transition class="ml-8 mt-2 space-y-1 text-sm">
          <a href="<?= site_url('admin/adminpeminjaman'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'adminpeminjaman' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Verifikasi Peminjaman
          </a>
          <a href="<?= site_url('admin/pengembalian'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'pengembalian' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Pengembalian
          </a>
          <a href="<?= site_url('admin/daftarRiwayat'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'daftarRiwayat' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Daftar Riwayat Peminjaman
          </a>
        </div>
      </div>

      <!-- Manajemen User -->
      <div x-data="{ openUser: <?= $is_in(['user', 'user_approval']) ? 'true' : 'false' ?> }">
        <button @click="openUser = !openUser"
          class="flex items-left text-left justify-between w-full px-4 py-2 rounded-xl mt-2 transition-colors duration-200 <?= $is_in(['user', 'user_approval']) ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
          <span class="flex items-left gap-3"><i class="fa-solid fa-users"></i><span>Manajemen User</span></span>
          <i :class="openUser ? 'fa-chevron-up' : 'fa-chevron-down'" class="fa-solid"></i>
        </button>
        <div x-show="openUser" x-transition class="ml-8 mt-2 space-y-1 text-sm">
          <a href="<?= site_url('admin/user'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'user' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Data User
          </a>
          <a href="<?= site_url('admin/user_approval'); ?>"
            class="block px-3 py-2 rounded-lg transition-colors duration-150 <?= $current === 'user_approval' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">
            Persetujuan Admin
          </a>
        </div>
      </div>

      <!-- Setting -->
      <a href="<?= site_url('profile_setting'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl mt-2 transition-colors duration-200 <?= $current === 'profile_setting' ? 'bg-white/90 text-teal-700 shadow-md font-semibold' : 'hover:bg-white/20' ?>">
        <i class="fa-solid fa-cog"></i>
        <span>Setting</span>
      </a>

      <!-- Logout -->
      <a href="<?= site_url('auth/logout'); ?>"
        class="flex items-center gap-3 px-4 py-2 rounded-xl mt-4 bg-red/60 hover:bg-red-300 transition-colors duration-200 text-red-600 font-semibold">
        <i class="fa-solid fa-right-from-bracket"></i>
        <span>Log Out</span>
      </a>

    <?php endif; ?>
  </nav>
</aside>

<!-- Sidebar Mobile (menggunakan the same active logic) -->
<div id="mobileSidebar" class="fixed top-0 left-0 w-64 bg-gradient-to-b from-[#66D2CE] to-[#4FC6B3] shadow-md p-5 h-full transform -translate-x-full transition-transform duration-300 z-50">
  <div class="flex justify-between items-center mb-6">
    <a href="<?= site_url('dashboard'); ?>" class="flex items-center gap-3">
      <span class="text-2xl font-extrabold text-white">E-SLAB</span>
    </a>
    <button onclick="toggleSidebar()" class="text-white text-xl font-bold">×</button>
  </div>

  <nav class="space-y-2 text-white">
    <?php if ($role === 'user'): ?>
      <a href="<?= site_url('dashboard'); ?>" class="block px-4 py-2 rounded-lg <?= $current === 'dashboard' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Dashboard</a>
      <div x-data="{ open: <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'true' : 'false' ?> }">
        <button @click="open = !open" class="w-full text-left px-4 py-2 rounded-lg <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Peminjaman <i :class="open ? 'fa-chevron-up' : 'fa-chevron-down'" class="fa-solid float-right"></i></button>
        <div x-show="open" x-transition class="ml-4 mt-2 space-y-1">
          <a href="<?= site_url('peminjaman/alat'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'katalog_alat' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Katalog Alat</a>
          <a href="<?= site_url('peminjaman/bahan'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'katalog_bahan' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Katalog Bahan</a>
        </div>
      </div>
      <a href="<?= site_url('keranjang'); ?>" class="block px-4 py-2 rounded-lg <?= $current === 'keranjang' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Keranjang</a>
      <a href="<?= site_url('riwayat'); ?>" class="block px-4 py-2 rounded-lg <?= $current === 'riwayat' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Riwayat</a>
      <a href="<?= site_url('notifikasi'); ?>" class="block px-4 py-2 rounded-lg <?= $current === 'notifikasi' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Notifikasi</a>
      <a href="<?= site_url('profile_setting'); ?>" class="block px-4 py-2 rounded-lg <?= $current === 'profile_setting' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Setting</a>
      <a href="<?= site_url('auth/logout'); ?>" class="block px-4 py-2 mt-4 rounded-lg bg-red/60 hover:bg-red-300 text-red-600 font-semibold">Log Out</a>

    <?php elseif ($role === 'admin'): ?>
      <a href="<?= site_url('admin/dashboard_admin'); ?>" class="block px-4 py-2 rounded-lg <?= $current === 'dashboard_admin' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Dashboard</a>

      <div x-data="{ open: <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'true' : 'false' ?> }">
        <button @click="open = !open" class="w-full text-left px-4 py-2 rounded-lg <?= $is_in(['katalog_alat', 'katalog_bahan']) ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Data Barang</button>
        <div x-show="open" x-transition class="ml-4 mt-2 space-y-1">
          <a href="<?= site_url('admin/katalog_alat'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'katalog_alat' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Data Alat</a>
          <a href="<?= site_url('admin/katalog_bahan'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'katalog_bahan' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Data Bahan</a>
        </div>
      </div>

      <div x-data="{ open: <?= $is_in(['adminpeminjaman', 'pengembalian']) ? 'true' : 'false' ?> }">
        <button @click="open = !open" class="w-full text-left px-4 py-2 rounded-lg <?= $is_in(['adminpeminjaman', 'pengembalian', 'daftarRiwayat']) ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Peminjaman</button>
        <div x-show="open" x-transition class="ml-4 mt-2 space-y-1">
          <a href="<?= site_url('admin/adminpeminjaman'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'adminpeminjaman' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Verifikasi Peminjaman</a>
          <a href="<?= site_url('admin/pengembalian'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'pengembalian' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Pengembalian</a>
          <a href="<?= site_url('admin/daftarRiwayat'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'daftarRiwayat' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Daftar Riwayat Peminjaman</a>
        </div>
      </div>

      <div x-data="{ open: <?= $is_in(['user', 'user_approval']) ? 'true' : 'false' ?> }">
        <button @click="open = !open" class="w-full text-left px-4 py-2 rounded-lg <?= $is_in(['user', 'user_approval']) ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Manajemen User</button>
        <div x-show="open" x-transition class="ml-4 mt-2 space-y-1">
          <a href="<?= site_url('admin/user'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'user' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Data User</a>
          <a href="<?= site_url('admin/user_approval'); ?>" class="block px-3 py-2 rounded-lg <?= $current === 'user_approval' ? 'bg-white/90 text-teal-700' : 'hover:bg-white/40' ?>">Persetujuan Admin</a>
        </div>
      </div>

      <a href="<?= site_url('profile_setting'); ?>" class="block px-4 py-2 rounded-lg <?= $current === 'profile_setting' ? 'bg-white/90 text-teal-700 font-semibold' : 'hover:bg-white/40' ?>">Setting</a>
      <a href="<?= site_url('auth/logout'); ?>" class="block px-4 py-2 mt-4 rounded-lg bg-red/60 hover:bg-red-300 text-red-600 font-semibold">Log Out</a>
    <?php endif; ?>
  </nav>
</div>

<!-- Overlay -->
<div id="mobileSidebarOverlay" class="fixed inset-0 bg-black bg-opacity-50 hidden z-40"></div>
<!-- Topbar -->
<header class="fixed top-0 left-0 w-full h-16 bg-[#B9E5E8] dark:bg-gray-600 dark:text-gray-300 flex justify-between items-center px-6 z-30">
  <div class="flex items-center space-x-3">
    <!-- Tombol hamburger -->
    <button onclick="toggleSidebar()" class="md:hidden p-2 text-black rounded">
      ☰
    </button>

    <!-- logo Brand -->
    <div class="flex items-center">
      <span class="text-xl font-bold md:ml-64 text-white shadow-2xl dark:text-gray-400"><?php echo isset($title) ? $title : 'Halaman'; ?></span>
    </div>
  </div>

  <!-- Dark Mode Toggle + user info -->
  <div class="flex items-center space-x-4">
    <!-- Tombol Dark Mode
        <button id="darkModeToggle"
            class="p-2 rounded-full w-40 h-10 bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200 transition-colors">
            <i class="fa-solid fa-moon hidden dark:inline"></i>
            <i class="fa-solid fa-sun dark:hidden"></i>
        </button> -->

    <!-- user info -->
    <span class="text-gray-700 dark:text-gray-200 font-bold"><?= isset($user_name) ? $user_name : 'User'; ?></span>

    <!-- ganti  dengan profil yang bisa diklik dan menuju ke profile  -->
    <div class="bg-gray-100 dark:bg-gray-700 rounded-full w-10 h-10 flex items-center justify-center text-gray-800 dark:text-gray-200">
      <?= isset($user_initial) ? $user_initial : 'U'; ?>
    </div>
  </div>
</header>

<!-- Main Content -->
<main class="flex-1 p-6 overflow-auto md:ml-64 mt-20">