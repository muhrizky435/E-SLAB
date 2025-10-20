<div class="max-w-6xl px-4">
  <!-- Header -->
  <div class="text-left mb-8">
    <h2 class="text-3xl font-bold text-gray-800 flex items-center gap-3">
      <i class="fa-solid fa-user-gear text-teal-500"></i>
      Detail Pengguna
    </h2>
    <p class="text-gray-500 text-md italic mt-2">
      “Informasi lengkap akun pengguna terdaftar”
    </p>
  </div>

  <!-- Card Detail -->
  <div class="bg-white shadow-xl rounded-2xl overflow-hidden border border-gray-100 transition-transform hover:scale-[1.01] duration-300">
    <div class="p-6 space-y-5">
      <!-- Header Card -->
      <div class="flex items-center justify-between border-b pb-3">
        <h3 class="text-lg font-semibold text-gray-700 flex items-center gap-2">
          <i class="fa-solid fa-id-card text-teal-500"></i>
          Data Akun
        </h3>
        <span class="text-sm text-gray-400">
          <i class="fa-solid fa-hashtag"></i> ID: <?= htmlspecialchars($user->id_user) ?>
        </span>
      </div>

      <!-- Info Grid -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-gray-700">
        <p class="flex items-center gap-2"><i class="fa-solid fa-user text-teal-500"></i> 
          <strong>Nama:</strong> <?= htmlspecialchars($user->nama) ?>
        </p>
        <p class="flex items-center gap-2"><i class="fa-solid fa-user-tag text-teal-500"></i>
          <strong>Username:</strong> <?= htmlspecialchars($user->username) ?>
        </p>
        <p class="flex items-center gap-2"><i class="fa-solid fa-envelope text-teal-500"></i>
          <strong>Email:</strong> <?= htmlspecialchars($user->email) ?>
        </p>
        <p class="flex items-center gap-2"><i class="fa-solid fa-user-shield text-teal-500"></i>
          <strong>Role:</strong> 
          <span class="ml-1 px-2 py-1 rounded-full text-sm <?= $user->role === 'admin' ? 'bg-teal-100 text-teal-700' : 'bg-gray-100 text-gray-700' ?>">
            <?= ucfirst(htmlspecialchars($user->role)) ?>
          </span>
        </p>
        <p class="flex items-center gap-2"><i class="fa-solid fa-toggle-on text-teal-500"></i>
          <strong>Status:</strong>
          <span class="ml-1 px-2 py-1 rounded-full text-sm <?= $user->is_active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' ?>">
            <?= $user->is_active ? 'Aktif' : 'Nonaktif' ?>
          </span>
        </p>
        <p class="flex items-center gap-2"><i class="fa-solid fa-calendar-plus text-teal-500"></i>
          <strong>Dibuat Pada:</strong> <?= htmlspecialchars($user->created_at) ?>
        </p>
        <p class="flex items-center gap-2"><i class="fa-solid fa-calendar-check text-teal-500"></i>
          <strong>Diperbarui:</strong> <?= $user->updated_at ? htmlspecialchars($user->updated_at) : '-' ?>
        </p>
      </div>
    </div>

    <!-- Tombol Aksi -->
    <div class="flex flex-wrap justify-end gap-3 bg-gray-50 px-6 py-4 border-t">
      <a href="<?= site_url('admin/user') ?>" 
         class="flex items-center gap-2 bg-gray-300 hover:bg-gray-400 hover:scale-105 text-gray-700 font-semibold px-4 py-2 rounded-lg transition-all duration-200">
        <i class="fa-solid fa-arrow-left"></i> Kembali
      </a>
      <a href="<?= site_url('admin/user_edit/'.$user->id_user) ?>" 
         class="flex items-center gap-2 bg-gradient-to-r from-teal-600 to-teal-400 hover:scale-105 text-white font-semibold px-4 py-2 rounded-lg transition-all duration-200">
        <i class="fa-solid fa-pen-to-square"></i> Edit
      </a>
      <button onclick="openDeleteModal()" 
         class="flex items-center gap-2 bg-gradient-to-r from-red-600 to-red-400 hover:scale-105 text-white font-semibold px-4 py-2 rounded-lg transition-all duration-200">
        <i class="fa-solid fa-trash"></i> Hapus
      </button>
    </div>
  </div>
</div>

<!-- Modal Konfirmasi Hapus -->
<div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden z-50">
  <div class="bg-white rounded-xl shadow-2xl max-w-md w-full p-6 text-center animate__animated animate__fadeInUp">
    <i class="fa-solid fa-triangle-exclamation text-red-500 text-5xl mb-3"></i>
    <h3 class="text-xl font-semibold text-gray-800 mb-2">Konfirmasi Hapus</h3>
    <p class="text-gray-600 mb-6">Apakah Anda yakin ingin menghapus pengguna ini? Tindakan ini tidak dapat dibatalkan.</p>
    <div class="flex justify-center gap-3">
      <button onclick="closeDeleteModal()" 
              class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-700 rounded-lg font-semibold flex items-center gap-2 transition">
        <i class="fa-solid fa-xmark"></i> Batal
      </button>
      <a href="<?= site_url('admin/user_delete/'.$user->id_user) ?>" 
         class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg font-semibold flex items-center gap-2 transition">
        <i class="fa-solid fa-trash"></i> Hapus
      </a>
    </div>
  </div>
</div>

<!-- Script Modal -->
<script>
function openDeleteModal() {
  document.getElementById('deleteModal').classList.remove('hidden');
}
function closeDeleteModal() {
  document.getElementById('deleteModal').classList.add('hidden');
}
</script>

