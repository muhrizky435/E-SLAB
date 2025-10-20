<div class="px-4 md:px-6 max-w-6xl mx-auto space-y-6 animate-fadeIn">
  <!-- Header -->
  <div class="flex flex-col sm:flex-row items-center justify-between gap-4 border-b border-gray-200 pb-4">
    <h2 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
      <i class="fa-solid fa-user-circle text-teal-500 text-3xl"></i> Profil Saya
    </h2>
    <a href="<?= site_url('dashboard'); ?>"
       class="bg-gradient-to-r from-gray-100 to-gray-200 hover:from-blue-100 hover:to-blue-200 text-blue-700 font-medium px-4 py-2 rounded-xl flex items-center gap-2 shadow-sm hover:shadow transition">
      <i class="fa-solid fa-arrow-left"></i> Kembali
    </a>
  </div>

  <!-- Grid Profil dan Ubah Password -->
  <div class="grid md:grid-cols-2 gap-8">
    <!-- Card Profil -->
    <div class="bg-white shadow-xl rounded-2xl p-6 border border-gray-100 hover:shadow-2xl transition">
      <div class="flex items-center gap-4 mb-6">
        <div class="bg-teal-100 text-teal-600 w-16 h-16 flex items-center justify-center text-2xl font-bold rounded-full shadow-inner">
          <?= strtoupper(substr($user->nama, 0, 1)); ?>
        </div>
        <div>
          <h3 class="text-xl font-bold text-gray-800"><?= htmlspecialchars($user->nama); ?></h3>
          <p class="text-gray-500 text-sm flex items-center gap-1">
            <i class="fa-solid fa-id-badge text-teal-500"></i> <?= htmlspecialchars($user->role); ?>
          </p>
        </div>
      </div>

      <div class="space-y-3 text-gray-700">
        <p class="flex items-center gap-2">
          <i class="fa-solid fa-user text-teal-500"></i>
          <span><strong>Username:</strong> <?= htmlspecialchars($user->username); ?></span>
        </p>
        <p class="flex items-center gap-2">
          <i class="fa-solid fa-envelope text-teal-500"></i>
          <span><strong>Email:</strong> <?= htmlspecialchars($user->email); ?></span>
        </p>
        <p class="flex items-center gap-2">
          <i class="fa-solid fa-user-tag text-teal-500"></i>
          <span><strong>Role:</strong> <?= htmlspecialchars($user->role); ?></span>
        </p>
      </div>
    </div>

    <!-- Card Ubah Password -->
    <div class="bg-white shadow-xl rounded-2xl p-6 border border-gray-100 hover:shadow-2xl transition">
      <h3 class="text-xl font-bold text-gray-800 mb-5 flex items-center gap-2">
        <i class="fa-solid fa-lock text-teal-500"></i> Ubah Password
      </h3>

      <form action="<?= site_url('user/update_password'); ?>" method="post" class="space-y-4">
        <div>
          <label class="block text-sm font-semibold text-gray-700 mb-1">Password Lama</label>
          <input type="password" name="current_password" required
            class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-teal-400 focus:outline-none transition">
        </div>
        <div>
          <label class="block text-sm font-semibold text-gray-700 mb-1">Password Baru</label>
          <input type="password" name="new_password" required
            class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-teal-400 focus:outline-none transition">
        </div>
        <div>
          <label class="block text-sm font-semibold text-gray-700 mb-1">Konfirmasi Password Baru</label>
          <input type="password" name="confirm_password" required
            class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-teal-400 focus:outline-none transition">
        </div>
        <button type="submit"
          class="w-full bg-gradient-to-r from-teal-600 to-teal-400 text-white py-2.5 rounded-lg font-semibold hover:opacity-90 transition-all duration-300 flex items-center justify-center gap-2">
          <i class="fa-solid fa-save"></i> Simpan Perubahan
        </button>
      </form>
    </div>
  </div>

  <!-- Tentang E-SLAB -->
  <div class="mt-10 bg-gradient-to-r from-teal-50 to-blue-50 shadow-xl rounded-2xl p-8 border border-gray-100 hover:shadow-2xl transition">
    <div class="flex items-center gap-5 mb-5">
      <div class="bg-teal-600 text-white w-16 h-16 flex items-center justify-center rounded-full shadow-md">
        <i class="fas fa-flask text-2xl"></i>
      </div>
      <div>
        <h3 class="text-2xl font-extrabold text-gray-800">Tentang <span class="text-teal-600">E-SLAB</span></h3>
        <p class="italic text-gray-600 text-sm">“Sistem Laboratorium Digital yang cerdas, cepat, dan terintegrasi.”</p>
      </div>
    </div>
    <p class="text-gray-700 leading-relaxed text-[15px]">
      <strong>E-SLAB</strong> adalah platform manajemen laboratorium digital yang dirancang untuk mengelola alat, peminjaman, dan verifikasi data secara efisien. 
      Dengan antarmuka modern dan sistem keamanan tinggi, E-SLAB memastikan setiap proses berjalan cepat, akurat, dan transparan.
    </p>

    <div class="mt-6 flex flex-wrap gap-3 justify-center md:justify-start">
      <a href="<?= site_url('dashboard'); ?>"
        class="bg-teal-600 hover:scale-105 text-white px-5 py-2 rounded-lg shadow-md transition flex items-center gap-2 text-sm">
        <i class="fas fa-home"></i> Dashboard
      </a>
      <a href="bantuan"
        class="bg-white border border-teal-600 text-teal-700 hover:scale-105 px-5 py-2 rounded-lg shadow-sm transition flex items-center gap-2 text-sm">
        <i class="fas fa-book-open"></i> Panduan Penggunaan
      </a>
    </div>
  </div>

  <!-- Quick Info -->
  <div class="mt-8 grid md:grid-cols-2 gap-6">
    <div class="bg-white shadow-md rounded-2xl p-6 border border-gray-100 flex items-start gap-4 hover:shadow-xl transition">
      <div class="bg-teal-100 text-teal-600 p-3 rounded-full">
        <i class="fas fa-shield-alt text-lg"></i>
      </div>
      <div>
        <h4 class="font-semibold text-gray-800">Keamanan Data</h4>
        <p class="text-gray-600 text-sm leading-relaxed">E-SLAB melindungi data Anda dengan sistem enkripsi, autentikasi berlapis, dan log keamanan real-time.</p>
      </div>
    </div>

    <div class="bg-white shadow-md rounded-2xl p-6 border border-gray-100 flex items-start gap-4 hover:shadow-xl transition">
      <div class="bg-yellow-100 text-yellow-600 p-3 rounded-full">
        <i class="fas fa-lightbulb text-lg"></i>
      </div>
      <div>
        <h4 class="font-semibold text-gray-800">Tips Penggunaan</h4>
        <p class="text-gray-600 text-sm leading-relaxed">Gunakan fitur pencarian alat untuk mempercepat proses peminjaman dan menghindari data ganda.</p>
      </div>
    </div>
  </div>
</div>

<!-- Modal Notifikasi -->
<div id="notifModal" class="hidden fixed inset-0 bg-gray-800 bg-opacity-50 items-center justify-center z-50">
  <div class="bg-white rounded-2xl shadow-2xl p-8 max-w-sm w-full text-center relative animate-fadeIn">
    <h3 id="notifTitle" class="text-xl font-semibold mb-2"></h3>
    <p id="notifMessage" class="text-gray-600 mb-4"></p>
    <button id="closeModalBtn"
      class="bg-teal-600 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-teal-700 transition">Tutup</button>
  </div>
</div>

<script>
  const modal = document.getElementById('notifModal');
  const closeBtn = document.getElementById('closeModalBtn');

  function showModal(title, message, type) {
    const titleEl = document.getElementById('notifTitle');
    const messageEl = document.getElementById('notifMessage');

    titleEl.textContent = title;
    messageEl.textContent = message;

    titleEl.className =
      type === 'success'
        ? 'text-xl font-semibold mb-2 text-green-600'
        : 'text-xl font-semibold mb-2 text-red-600';

    modal.classList.remove('hidden');
    modal.classList.add('flex');
  }

  function closeModal() {
    modal.classList.add('hidden');
    modal.classList.remove('flex');
  }

  modal.addEventListener('click', e => { if (e.target === modal) closeModal(); });
  closeBtn.addEventListener('click', closeModal);

  <?php if ($this->session->flashdata('success')): ?>
    showModal('Berhasil!', '<?= $this->session->flashdata('success'); ?>', 'success');
  <?php elseif ($this->session->flashdata('error')): ?>
    showModal('Gagal!', '<?= $this->session->flashdata('error'); ?>', 'error');
  <?php endif; ?>
</script>

<style>
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
  }
  .animate-fadeIn { animation: fadeIn 0.5s ease-in-out; }
</style>
