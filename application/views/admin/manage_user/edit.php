<div class="max-w-6xl px-4">
  <!-- Header -->
  <div class="text-left mb-8">
    <h2 class="text-3xl font-bold text-gray-800 flex justify-start items-center gap-3">
      <i class="fa-solid fa-user-pen text-teal-500"></i> Edit Data Pengguna
    </h2>
    <p class="text-gray-500 text-md italic mt-2">
      “Perbarui informasi pengguna sesuai kebutuhan”
    </p>
  </div>

  <!-- Form Edit -->
  <form action="<?= site_url('admin/user_edit/'.$user->id_user) ?>" method="post"
        class="bg-white p-6 rounded-2xl shadow-xl border border-gray-100 space-y-5 transition-all duration-300 hover:shadow-2xl">

    <!-- Nama -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-user text-teal-600"></i> Nama Lengkap
      </label>
      <input type="text" name="nama"
             value="<?= htmlspecialchars($user->nama) ?>"
             class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:outline-none"
             placeholder="Masukkan nama pengguna" required>
    </div>

    <!-- Username -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-user-tag text-teal-600"></i> Username
      </label>
      <input type="text" name="username"
             value="<?= htmlspecialchars($user->username) ?>"
             class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:outline-none"
             placeholder="Masukkan username" required>
    </div>

    <!-- Email -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-envelope text-teal-600"></i> Email
      </label>
      <input type="email" name="email"
             value="<?= htmlspecialchars($user->email) ?>"
             class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:outline-none"
             placeholder="Masukkan email pengguna" required>
    </div>

    <!-- Password -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-lock text-teal-600"></i> Password Baru
      </label>
      <input type="password" name="password"
             class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:outline-none"
             placeholder="Kosongkan jika tidak ingin mengubah password">
      <p class="text-xs text-gray-500 mt-1 italic">
        <i class="fa-solid fa-circle-info text-gray-400"></i> Kosongkan jika tidak ingin mengubah password.
      </p>
    </div>

    <!-- Role -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-user-shield text-teal-600"></i> Role
      </label>
      <select name="role"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:outline-none">
        <option value="admin" <?= $user->role === 'admin' ? 'selected' : '' ?>>Admin</option>
        <option value="user" <?= $user->role === 'user' ? 'selected' : '' ?>>User</option>
      </select>
    </div>

    <!-- Status -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-toggle-on text-teal-600"></i> Status Akun
      </label>
      <select name="is_active"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:outline-none">
        <option value="1" <?= $user->is_active ? 'selected' : '' ?>>Aktif</option>
        <option value="0" <?= !$user->is_active ? 'selected' : '' ?>>Nonaktif</option>
      </select>
    </div>

    <!-- Tombol -->
    <div class="flex flex-wrap justify-end gap-3 pt-4 border-t mt-6">
      <a href="<?= site_url('admin/user') ?>"
         class="flex items-center gap-2 bg-gray-300 hover:scale-105 text-gray-700 font-semibold px-4 py-2 rounded-lg transition-all duration-200">
        <i class="fa-solid fa-arrow-left"></i> Batal
      </a>
      <button type="submit"
              class="flex items-center gap-2 bg-gradient-to-r from-teal-600 to-teal-400 hover:scale-105 text-white font-semibold px-5 py-2 rounded-lg transition-all duration-200">
        <i class="fa-solid fa-floppy-disk"></i> Simpan Perubahan
      </button>
    </div>
  </form>
</div>

<!-- Modal sukses / gagal -->
<?php if ($this->session->flashdata('success') || $this->session->flashdata('error')): ?>
  <div id="feedbackModal"
       class="fixed inset-0 bg-gray-800/60 flex items-center justify-center z-50 animate-fade-in">
    <div class="bg-white rounded-2xl shadow-2xl p-6 w-96 text-center space-y-3">
      <?php if ($this->session->flashdata('success')): ?>
        <i class="fa-solid fa-circle-check text-5xl text-green-500"></i>
        <h3 class="text-xl font-semibold text-gray-800">Berhasil!</h3>
        <p class="text-gray-600"><?= $this->session->flashdata('success'); ?></p>
      <?php else: ?>
        <i class="fa-solid fa-circle-xmark text-5xl text-red-500"></i>
        <h3 class="text-xl font-semibold text-gray-800">Gagal!</h3>
        <p class="text-gray-600"><?= $this->session->flashdata('error'); ?></p>
      <?php endif; ?>
      <button onclick="document.getElementById('feedbackModal').remove();"
              class="mt-4 bg-teal-500 text-white px-5 py-2 rounded-lg hover:bg-teal-700 transition-all">
        <i class="fa-solid fa-xmark"></i> Tutup
      </button>
    </div>
  </div>
<?php endif; ?>

<script>
  // Animasi modal masuk
  document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById('feedbackModal');
    if (modal) {
      setTimeout(() => modal.remove(), 4000);
    }
  });
</script>
