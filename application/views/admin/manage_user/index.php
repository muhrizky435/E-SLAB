<div class="container px-4">
  <!-- Header -->
  <div class="mb-8">
    <h1 class="text-3xl font-bold text-gray-800 flex items-center justify-start gap-3">
      <i class="fa-solid fa-users-gear text-teal-500"></i>
      Manage User
    </h1>
    <p class="text-gray-500 mt-2 text-md italic">
      “Kelola data pengguna dengan mudah, cepat, dan aman.”
    </p>
  </div>

  <!-- Notifikasi -->
  <?php if ($this->session->flashdata('success')): ?>
    <div class="bg-green-50 border border-green-400 text-green-700 px-4 py-3 rounded-lg mb-6 shadow-sm flex items-center justify-between">
      <span><?= $this->session->flashdata('success'); ?></span>
      <i class="fa-solid fa-circle-check text-green-500"></i>
    </div>
  <?php endif; ?>

  <!-- Table Container -->
  <div class="overflow-x-auto bg-white rounded-2xl shadow-lg border border-gray-100">
    <table class="min-w-full text-sm text-gray-700">
      <thead class="bg-gradient-to-r from-teal-600 to-teal-400 text-white uppercase text-xs">
        <tr>
          <th class="py-3 px-4 text-left">No</th>
          <th class="py-3 px-4 text-left">Nama</th>
          <th class="py-3 px-4 text-left">Username</th>
          <th class="py-3 px-4 text-left">Email</th>
          <th class="py-3 px-4 text-center">Aksi</th>
        </tr>
      </thead>
      <tbody>
        <?php $no = 1; foreach ($users as $user): ?>
          <tr class="border-b border-gray-100 hover:bg-blue-50 transition duration-300">
            <td class="py-3 px-4 font-medium"><?= $no++; ?></td>
            <td class="py-3 px-4"><?= htmlspecialchars($user->nama); ?></td>
            <td class="py-3 px-4"><?= htmlspecialchars($user->username); ?></td>
            <td class="py-3 px-4"><?= htmlspecialchars($user->email); ?></td>
            <td class="py-3 px-4 text-center">
              <div class="flex justify-center space-x-4">
                <a href="<?= site_url('admin/user_detail/' . $user->id_user); ?>" 
                   class="text-blue-500 hover:text-blue-700 transition-transform transform hover:scale-110" 
                   title="Detail">
                  <i class="fa-solid fa-circle-info text-lg"></i>
                </a>
                <a href="<?= site_url('admin/user_edit/' . $user->id_user); ?>" 
                   class="text-teal-500 hover:text-teal-600 transition-transform transform hover:scale-110" 
                   title="Edit">
                  <i class="fa-solid fa-pen-to-square text-lg"></i>
                </a>
                <button onclick="openDeleteModal('<?= $user->id_user ?>', '<?= htmlspecialchars($user->nama) ?>')" 
                        class="text-red-500 hover:text-red-700 transition-transform transform hover:scale-110" 
                        title="Hapus">
                  <i class="fa-solid fa-trash text-lg"></i>
                </button>
              </div>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<!-- Modal Konfirmasi Hapus -->
<div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden z-50">
  <div class="bg-white rounded-xl shadow-2xl max-w-md w-full p-6 text-center animate__animated animate__fadeInUp">
    <i class="fa-solid fa-triangle-exclamation text-red-500 text-5xl mb-3"></i>
    <h3 class="text-xl font-semibold text-gray-800 mb-2">Konfirmasi Hapus</h3>
    <p class="text-gray-600 mb-6">
      Apakah Anda yakin ingin menghapus <strong id="deleteUserName"></strong>?<br>
      Tindakan ini tidak dapat dibatalkan.
    </p>
    <div class="flex justify-center gap-3">
      <button onclick="closeDeleteModal()" 
              class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-700 rounded-lg font-semibold flex items-center gap-2 transition">
        <i class="fa-solid fa-xmark"></i> Batal
      </button>
      <a id="confirmDeleteBtn" href="#" 
         class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg font-semibold flex items-center gap-2 transition">
        <i class="fa-solid fa-trash"></i> Hapus
      </a>
    </div>
  </div>
</div>

<!-- Script Modal -->
<script>
function openDeleteModal(userId, userName) {
  document.getElementById('deleteModal').classList.remove('hidden');
  document.getElementById('deleteUserName').textContent = userName;
  document.getElementById('confirmDeleteBtn').href = "<?= site_url('admin/user_delete/') ?>" + userId;
}

function closeDeleteModal() {
  document.getElementById('deleteModal').classList.add('hidden');
}
</script>
