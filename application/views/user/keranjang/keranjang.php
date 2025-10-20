<div class="max-w-6xl mx-4 p-4 bg-white shadow-2xl rounded-2xl border border-gray-100">
  <!-- Header -->
  <div class="flex flex-col sm:flex-row justify-between items-center border-b border-gray-200 pb-4 mb-6">
    <div class="flex flex-col items-start">
      <h2 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
        <i class="fa-solid fa-cart-shopping text-teal-500"></i>
        <span>Keranjang Saya</span>
      </h2>
      <p class="text-gray-500 italic text-sm mt-1">
        “Kumpulkan alat dan bahan yang Anda butuhkan sebelum melakukan peminjaman.”
      </p>
    </div>

    <span class="mt-4 sm:mt-0 bg-gradient-to-r from-blue-100 to-blue-200 text-blue-800 text-sm font-semibold px-5 py-1.5 rounded-full shadow-sm flex items-center gap-2">
      <i class="fa-solid fa-box"></i> <?= count($keranjang ?? []); ?> Item
    </span>
  </div>

  <?php if (empty($keranjang)): ?>
    <div class="text-center py-16 text-gray-500">
      <i class="fa-solid fa-box-open text-6xl text-teal-500 mb-4"></i>
      <p class="text-xl font-semibold mb-3">Keranjang Anda Masih Kosong</p>
      <p class="text-sm mb-5 text-gray-400">Mulailah memilih alat dan bahan yang ingin Anda pinjam.</p>
      <a href="<?= site_url('peminjaman/alat'); ?>"
        class="inline-flex items-center gap-2 px-6 py-2.5 bg-gradient-to-r from-teal-600 to-teal-400 hover:bg-blue-700 text-white rounded-xl shadow-md transition-all duration-300 hover:scale-[1.02]">
        <i class="fa fa-arrow-left"></i> Pilih Alat & Bahan
      </a>
    </div>

  <?php else: ?>
    <form id="keranjangForm" method="post" action="<?= site_url('keranjang/aksi_massal'); ?>">
      <!-- Tombol Aksi Massal -->
      <div id="aksiGroup" class="hidden flex flex-wrap justify-between items-center mb-4 gap-3">
        <div class="flex flex-wrap gap-2">
          <button type="button" id="hapusBtn"
            class="hidden px-4 py-2 bg-gradient-to-r from-red-600 to-red-400 hover:scale-105 text-white rounded-lg text-sm font-medium transition-all duration-300 flex items-center gap-2 shadow-sm"
            onclick="openDeleteSelectedModal()">
            <i class="fa-solid fa-trash"></i> Hapus Terpilih
          </button>

          <button type="submit" id="pinjamBtn"
            class="hidden px-4 py-2 bg-gradient-to-r from-teal-600 to-teal-400 hover:scale-105 text-white rounded-lg text-sm font-medium transition-all duration-300 flex items-center gap-2 shadow-sm">
            <i class="fa-solid fa-credit-card"></i> Pinjam Terpilih
          </button>
        </div>
      </div>

      <!-- Tabel -->
      <div class="overflow-x-auto rounded-xl border border-gray-200 shadow-sm">
        <table class="min-w-full border-collapse text-sm sm:text-base">
          <thead>
            <tr class="bg-gradient-to-r from-teal-600 to-teal-400 text-white uppercase text-xs sm:text-sm font-semibold tracking-wide">
              <th class="px-4 py-3 text-center w-10">
                <input type="checkbox" id="selectAll" class="w-4 h-4 accent-blue-500 cursor-pointer">
              </th>
              <th class="px-4 py-3 text-left">Nama Barang</th>
              <th class="px-4 py-3 text-center">Jumlah</th>
              <th class="px-4 py-3 text-left">Catatan</th>
              <th class="px-4 py-3 text-center">Aksi</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-100">
            <?php foreach ($keranjang as $k): ?>
              <tr class="hover:bg-blue-50 transition-all duration-200">
                <td class="px-4 py-4 text-center">
                  <input type="checkbox" name="selected[]" value="<?= $k->id_keranjang; ?>"
                    class="itemCheckbox w-4 h-4 accent-blue-500 cursor-pointer">
                </td>
                <td class="px-4 py-4">
                  <p class="font-semibold text-gray-900"><?= $k->nama_barang; ?></p>
                  <p class="text-xs text-gray-500">Kode: <?= $k->id_keranjang; ?></p>
                </td>
                <td class="px-4 py-4 text-center">
                  <span class="bg-blue-50 text-blue-700 px-3 py-1 rounded-md text-sm font-medium inline-block">
                    <?= $k->qty; ?> <?= $k->satuan; ?>
                  </span>
                </td>
                <td class="px-4 py-4 text-gray-700">
                  <?= $k->catatan ?: '<span class="italic text-gray-400">Tidak ada</span>'; ?>
                </td>
                <td class="px-4 py-4 text-center">
                  <button type="button"
                    class="flex items-center justify-center gap-2 mx-auto px-3 py-1.5 text-sm border border-red-400 text-red-600 hover:bg-red-50 hover:border-red-500 rounded-lg transition-all duration-200"
                    onclick="openDeleteModal('<?= site_url('keranjang/remove/' . $k->id_keranjang); ?>')">
                    <i class="fa-solid fa-trash"></i> Hapus
                  </button>
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </form>

    <!-- Navigasi -->
    <div class="flex flex-col sm:flex-row justify-between items-center gap-3 mt-8">
      <a href="<?= site_url('peminjaman/alat'); ?>"
        class="w-full sm:w-auto px-5 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition-all duration-300 inline-flex items-center justify-center gap-2">
        <i class="fa-solid fa-arrow-left"></i> Lanjut Pilih Alat & Bahan
      </a>

      <a href="<?= site_url('keranjang/pinjam_semua'); ?>"
        class="w-full sm:w-auto px-6 py-2 bg-gradient-to-r from-teal-600 to-teal-500 hover:from-teal-700 hover:to-teal-600 text-white rounded-lg transition-all duration-300 shadow-md inline-flex items-center justify-center gap-2 hover:scale-[1.02]">
        <i class="fa-solid fa-credit-card"></i> Pinjam Semua
      </a>
    </div>
  <?php endif; ?>
</div>

<!-- Modal Konfirmasi (Umum) -->
<div id="deleteModal" class="hidden fixed inset-0 bg-black bg-opacity-40 flex justify-center items-center z-50 transition-opacity">
  <div class="bg-white w-full max-w-md p-6 rounded-xl shadow-2xl transform scale-95 transition-all duration-300 relative">
    <h3 class="text-lg font-bold text-gray-800 mb-3 flex items-center gap-2">
      <i class="fa-solid fa-triangle-exclamation text-red-500"></i> Konfirmasi Hapus
    </h3>
    <p class="text-gray-600 mb-6">Apakah Anda yakin ingin menghapus item ini dari keranjang?</p>
    <div class="flex justify-end gap-3">
      <button onclick="closeDeleteModal()" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition-all">Batal</button>
      <a id="confirmDeleteBtn" href="#" class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition-all">Hapus</a>
    </div>
    <button onclick="closeDeleteModal()" class="absolute top-3 right-3 text-gray-400 hover:text-gray-600">
      <i class="fa-solid fa-xmark text-lg"></i>
    </button>
  </div>
</div>

<!-- Modal Hapus Terpilih -->
<div id="deleteSelectedModal" class="hidden fixed inset-0 bg-black bg-opacity-40 flex justify-center items-center z-50 transition-opacity">
  <div class="bg-white w-full max-w-md p-6 rounded-xl shadow-2xl transform scale-95 transition-all duration-300 relative">
    <h3 class="text-lg font-bold text-gray-800 mb-3 flex items-center gap-2">
      <i class="fa-solid fa-triangle-exclamation text-red-500"></i> Konfirmasi Hapus
    </h3>
    <p class="text-gray-600 mb-6">Apakah Anda yakin ingin menghapus semua item yang dipilih?</p>
    <div class="flex justify-end gap-3">
      <button onclick="closeDeleteSelectedModal()" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition-all">Batal</button>
      <button type="submit" form="keranjangForm" formaction="<?= site_url('keranjang/hapus_terpilih'); ?>"
        class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition-all">Hapus</button>
    </div>
    <button onclick="closeDeleteSelectedModal()" class="absolute top-3 right-3 text-gray-400 hover:text-gray-600">
      <i class="fa-solid fa-xmark text-lg"></i>
    </button>
  </div>
</div>

<script>
  const selectAllBox = document.getElementById('selectAll');
  const checkboxes = document.querySelectorAll('.itemCheckbox');
  const aksiGroup = document.getElementById('aksiGroup');
  const hapusBtn = document.getElementById('hapusBtn');
  const pinjamBtn = document.getElementById('pinjamBtn');

  selectAllBox?.addEventListener('change', function() {
    checkboxes.forEach(chk => chk.checked = this.checked);
    toggleActionButtons();
  });

  checkboxes.forEach(chk => chk.addEventListener('change', toggleActionButtons));

  function toggleActionButtons() {
    const anyChecked = document.querySelectorAll('.itemCheckbox:checked').length > 0;
    aksiGroup.classList.toggle('hidden', !anyChecked);
    hapusBtn.classList.toggle('hidden', !anyChecked);
    pinjamBtn.classList.toggle('hidden', !anyChecked);
  }

  function openDeleteModal(url) {
    const modal = document.getElementById('deleteModal');
    document.getElementById('confirmDeleteBtn').href = url;
    modal.classList.remove('hidden');
  }

  function closeDeleteModal() {
    document.getElementById('deleteModal').classList.add('hidden');
  }

  function openDeleteSelectedModal() {
    document.getElementById('deleteSelectedModal').classList.remove('hidden');
  }

  function closeDeleteSelectedModal() {
    document.getElementById('deleteSelectedModal').classList.add('hidden');
  }
</script>
