<div class="max-w-6xl mx-auto px-4">
  <!-- Header -->
  <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-8 gap-4">
    <div>
      <h2 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
        <i class="fa-solid fa-clock-rotate-left text-teal-500"></i>
        Riwayat Peminjaman
      </h2>
      <p class="text-gray-500 text-md mt-1">“Pantau seluruh aktivitas peminjaman Anda di sini“</p>
    </div>

    <a href="<?= site_url('dashboard'); ?>"
       class="bg-gradient-to-r from-gray-100 to-gray-200 hover:from-blue-100 hover:to-blue-200 text-blue-700 font-medium px-4 py-2 rounded-xl flex items-center gap-2 shadow-sm hover:shadow transition">
      <i class="fa-solid fa-arrow-left"></i> Kembali
    </a>
  </div>

  <!-- Jika kosong -->
  <?php if (empty($peminjaman)): ?>
    <div class="bg-yellow-50 border-l-4 border-yellow-400 p-5 rounded-xl text-yellow-800 text-center shadow-sm">
      <i class="fas fa-info-circle text-yellow-500 text-lg mr-1"></i> Belum ada riwayat peminjaman.
    </div>
  <?php else: ?>

  <!-- Tabel Desktop -->
  <div class="hidden md:block bg-white shadow-lg rounded-2xl border border-gray-100 overflow-hidden">
    <table class="min-w-full text-sm">
      <thead class="bg-gradient-to-r from-teal-600 to-teal-400 text-white">
        <tr>
          <th class="px-6 py-3 text-left font-semibold">Kode</th>
          <th class="px-6 py-3 text-left font-semibold">Tanggal Pinjam</th>
          <th class="px-6 py-3 text-left font-semibold">Status</th>
          <th class="px-6 py-3 text-center font-semibold">Aksi</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-gray-100 text-gray-700">
        <?php foreach ($peminjaman as $p): ?>
        <tr class="hover:bg-gray-50 transition duration-200">
          <td class="px-6 py-3 font-medium text-gray-900"><?= $p->kode_peminjaman; ?></td>
          <td class="px-6 py-3"><?= date('d M Y', strtotime($p->tanggal_pinjam)); ?></td>
          <td class="px-6 py-3">
            <?php if ($p->status == 'pending'): ?>
              <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-yellow-100 text-yellow-700 text-xs font-medium">
                <i class="fas fa-clock"></i> Pending
              </span>
            <?php elseif ($p->status == 'disetujui'): ?>
              <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-blue-100 text-blue-700 text-xs font-medium">
                <i class="fas fa-check-circle"></i> Dipinjam
              </span>
            <?php elseif ($p->status == 'ditolak'): ?>
              <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-red-100 text-red-700 text-xs font-medium">
                <i class="fas fa-times-circle"></i> Ditolak
              </span>
            <?php elseif ($p->status == 'dikembalikan'): ?>
              <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-green-100 text-green-700 text-xs font-medium">
                <i class="fas fa-undo-alt"></i> Dikembalikan
              </span>
            <?php else: ?>
              <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-gray-100 text-gray-600 text-xs font-medium">
                <i class="fas fa-question-circle"></i> Tidak Diketahui
              </span>
            <?php endif; ?>
          </td>
          <td class="px-6 py-3 text-center">
            <div class="flex justify-center gap-2">
              <a href="<?= site_url('riwayat/detail/' . $p->id_peminjaman); ?>"
                 class="inline-flex items-center gap-1 px-3 py-1.5 text-xs bg-blue-600 hover:bg-blue-700 text-white rounded-lg shadow-sm transition">
                <i class="fas fa-eye"></i> Detail
              </a>
              <button type="button"
                      onclick="openDeleteModal(<?= $p->id_peminjaman; ?>, '<?= $p->kode_peminjaman; ?>')"
                      class="inline-flex items-center gap-1 px-3 py-1.5 text-xs bg-red-500 hover:bg-red-600 text-white rounded-lg shadow-sm transition">
                <i class="fas fa-trash-alt"></i> Hapus
              </button>
            </div>
          </td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>

  <!-- Kartu Mobile -->
  <div class="md:hidden space-y-4 mt-4">
    <?php foreach ($peminjaman as $p): ?>
    <div class="bg-white rounded-xl shadow-md border border-gray-100 p-4 hover:shadow-lg transition duration-300">
      <div class="flex justify-between items-center mb-2">
        <h3 class="font-semibold text-gray-800"><?= $p->kode_peminjaman; ?></h3>
        <?php if ($p->status == 'pending'): ?>
          <span class="text-xs px-2 py-1 bg-yellow-100 text-yellow-700 rounded-full">Pending</span>
        <?php elseif ($p->status == 'dipinjam'): ?>
          <span class="text-xs px-2 py-1 bg-blue-100 text-blue-700 rounded-full">Dipinjam</span>
        <?php else: ?>
          <span class="text-xs px-2 py-1 bg-green-100 text-green-700 rounded-full">Selesai</span>
        <?php endif; ?>
      </div>
      <p class="text-gray-600 text-sm mb-3">
        <i class="fas fa-calendar-alt mr-1 text-teal-500"></i>
        <?= date('d M Y', strtotime($p->tanggal_pinjam)); ?>
      </p>
      <div class="flex justify-between gap-2">
        <a href="<?= site_url('riwayat/detail/' . $p->id_peminjaman); ?>"
           class="flex-1 text-center bg-blue-600 hover:bg-blue-700 text-white text-sm py-2 rounded-lg transition shadow-sm">
          <i class="fas fa-eye mr-1"></i> Detail
        </a>
        <button onclick="openDeleteModal(<?= $p->id_peminjaman; ?>, '<?= $p->kode_peminjaman; ?>')"
                class="flex-1 text-center bg-red-500 hover:bg-red-600 text-white text-sm py-2 rounded-lg transition shadow-sm">
          <i class="fas fa-trash-alt mr-1"></i> Hapus
        </button>
      </div>
    </div>
    <?php endforeach; ?>
  </div>
  <?php endif; ?>
</div>

<!-- Modal Hapus -->
<div id="deleteModal" class="hidden fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50 transition-opacity">
  <div class="bg-white rounded-2xl shadow-2xl p-6 w-11/12 sm:w-96 transform scale-95 transition-all duration-300">
    <h3 class="text-lg font-semibold text-gray-800 mb-3 flex items-center gap-2">
      <i class="fas fa-exclamation-triangle text-red-500"></i> Konfirmasi Hapus
    </h3>
    <p class="text-gray-600 mb-5 text-sm">
      Apakah Anda yakin ingin menghapus peminjaman
      <span id="deleteKode" class="font-semibold text-red-600"></span>?
    </p>
    <div class="flex justify-end gap-3">
      <button onclick="closeDeleteModal()" class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-lg transition">
        Batal
      </button>
      <a id="deleteLink" href="#" class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg shadow transition">
        Hapus
      </a>
    </div>
  </div>
</div>

<script>
  function openDeleteModal(id, kode) {
    const modal = document.getElementById('deleteModal');
    document.getElementById('deleteLink').href = '<?= site_url('riwayat/hapus/'); ?>' + id;
    document.getElementById('deleteKode').textContent = kode;
    modal.classList.remove('hidden');
    setTimeout(() => modal.classList.add('opacity-100'), 10);
  }

  function closeDeleteModal() {
    const modal = document.getElementById('deleteModal');
    modal.classList.remove('opacity-100');
    setTimeout(() => modal.classList.add('hidden'), 200);
  }
</script>
