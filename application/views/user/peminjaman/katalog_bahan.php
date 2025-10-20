<div class="p-4 sm:p-4 lg:p-4 min-h-screen">
  <!-- Header -->
  <div class="flex flex-col sm:flex-row justify-between items-center mb-6">
    <div class="flex flex-col items-start">
      <h3 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
        <i class="fa-solid fa-flask-vial text-teal-500"></i>
        <span><?= $title; ?></span>
      </h3>
      <p class="text-gray-500 italic text-sm mt-1">
        “Temukan Bahan Kesehatan untuk Keperawatan dan Kebidanan untuk memudahkan kegiatan.”
      </p>
    </div>
  </div>

  <div class="relative mb-4 sm:mt-0 w-full">
    <i class="fa fa-search absolute left-3 top-3 text-gray-400"></i>
    <input id="searchInput"
      type="text"
      placeholder="Cari nama bahan atau kode..."
      class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-xl shadow-sm focus:ring-2 focus:ring-teal-400 focus:outline-none transition text-sm" />
  </div>

  <!-- Table -->
  <div class="overflow-x-auto bg-white shadow-md rounded-xl">
    <table class="min-w-full divide-y divide-gray-200 text-sm" id="bahanTable">
      <thead class="bg-teal-400 text-white">
        <tr>
          <th class="px-6 py-3 text-left font-semibold">No</th>
          <th class="px-6 py-3 text-left font-semibold">Kode</th>
          <th class="px-6 py-3 text-left font-semibold">Nama Barang</th>
          <th class="px-6 py-3 text-center font-semibold">Stok</th>
          <th class="px-6 py-3 text-center font-semibold">Satuan</th>
          <th class="px-6 py-3 text-center font-semibold">Aksi</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-gray-100">
        <?php $no = 1;
        foreach ($barang as $b): ?>
          <tr class="hover:bg-gray-50 transition">
            <td class="px-6 py-4 text-gray-700"><?= $no++; ?></td>
            <td class="px-6 py-4 text-gray-700"><?= $b->kode_barang; ?></td>
            <td class="px-6 py-4 text-gray-900 font-medium"><?= $b->nama_barang; ?></td>
            <td class="px-6 py-4 text-center">
              <span class="px-2 py-1 bg-green-100 text-green-700 rounded-lg font-medium"><?= $b->stok; ?></span>
            </td>
            <td class="px-6 py-4 text-center"><?= $b->satuan; ?></td>
            <td class="px-6 py-4 text-center">
              <button
                class="bg-gradient-to-r from-teal-500 to-teal-600 hover:from-teal-600 hover:to-teal-700 text-white px-4 py-2 rounded-lg text-sm flex items-center gap-2 transition transform hover:scale-105 mx-auto"
                onclick="openTambahModal('<?= $b->id_barang; ?>', '<?= $b->nama_barang; ?>', <?= $b->stok; ?>)">
                <i class="fas fa-cart-plus"></i> Tambah
              </button>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>

  <!-- Pagination -->
  <div class="flex justify-center items-center mt-5 space-x-2 text-sm">
    <button id="prevPage" class="px-3 py-1 bg-gray-200 hover:bg-blue-300 rounded-lg text-gray-700">Prev</button>
    <span id="pageInfo" class="text-gray-700"></span>
    <button id="nextPage" class="px-3 py-1 bg-gray-200 hover:bg-blue-300 rounded-lg text-gray-700">Next</button>
  </div>
</div>

<!-- Modal -->
<div id="tambahModal" class="hidden fixed inset-0 bg-black bg-opacity-40 flex justify-center items-center z-50 p-4">
  <div class="bg-white rounded-2xl shadow-2xl w-full max-w-3xl p-8 relative animate-fade-in overflow-y-auto max-h-[90vh]">
    <div class="flex items-center justify-between border-b pb-3 mb-4">
      <h3 class="text-2xl font-bold text-gray-700 flex items-center">
        <i class="fa-solid fa-cart-plus text-teal-500 mr-2"></i> Tambah ke Keranjang
      </h3>
      <button onclick="closeTambahModal()" class="text-gray-500 hover:text-gray-700 transition">
        <i class="fa-solid fa-xmark text-2xl"></i>
      </button>
    </div>

    <form action="<?= site_url('keranjang/tambah'); ?>" method="post" id="modalForm" class="space-y-6">
      <input type="hidden" name="id_barang" id="modalIdBarang">

      <div>
        <p class="text-gray-700 text-base font-medium mb-1">Nama Barang:</p>
        <p id="modalNamaBarang" class="font-semibold text-teal-600 text-lg"></p>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-2">Jumlah</label>
        <input type="number" name="qty" id="modalQty" min="1" value="1"
          class="w-full border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-teal-400 focus:outline-none text-base">
        <small class="text-gray-500 text-sm">Stok tersedia: <span id="modalStok"></span></small>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-2">Catatan</label>
        <textarea name="catatan" rows="3" placeholder="Tambahkan catatan..."
          class="w-full border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-teal-400 focus:outline-none text-base"></textarea>
      </div>

      <div class="flex justify-end gap-3 pt-4 border-t">
        <button type="button" onclick="closeTambahModal()"
          class="px-5 py-2.5 rounded-lg bg-gray-200 hover:bg-gray-300 text-gray-700 text-sm font-medium transition">Batal</button>
        <button type="submit"
          class="px-5 py-2.5 rounded-lg bg-teal-500 hover:bg-teal-600 text-white text-sm font-medium transition">Tambah</button>
      </div>
    </form>
  </div>
</div>

<!-- Animasi -->
<style>
  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(-10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
  .animate-fade-in {
    animation: fadeIn 0.3s ease-out;
  }
</style>

<!-- Script -->
<script>
  // === Search Filter ===
  document.getElementById('searchInput').addEventListener('keyup', function() {
    const filter = this.value.toLowerCase();
    const rows = document.querySelectorAll('#bahanTable tbody tr');
    rows.forEach(row => {
      const nama = row.cells[2].textContent.toLowerCase();
      row.style.display = nama.includes(filter) ? '' : 'none';
    });
  });

  // === Pagination ===
  const rowsPerPage = 7;
  let currentPage = 1;
  const table = document.getElementById('bahanTable');
  const rows = table.querySelectorAll('tbody tr');
  const totalPages = Math.ceil(rows.length / rowsPerPage);

  function showPage(page) {
    rows.forEach((row, index) => {
      row.style.display = (index >= (page - 1) * rowsPerPage && index < page * rowsPerPage) ? '' : 'none';
    });
    document.getElementById('pageInfo').textContent = `Halaman ${page} dari ${totalPages}`;
    document.getElementById('prevPage').disabled = page === 1;
    document.getElementById('nextPage').disabled = page === totalPages;
  }

  document.getElementById('prevPage').addEventListener('click', () => {
    if (currentPage > 1) {
      currentPage--;
      showPage(currentPage);
    }
  });

  document.getElementById('nextPage').addEventListener('click', () => {
    if (currentPage < totalPages) {
      currentPage++;
      showPage(currentPage);
    }
  });

  showPage(currentPage);

  // === Modal Tambah Barang ===
  function openTambahModal(id, nama, stok) {
    document.getElementById('modalIdBarang').value = id;
    document.getElementById('modalNamaBarang').textContent = nama;
    document.getElementById('modalStok').textContent = stok;
    document.getElementById('modalQty').max = stok;
    document.getElementById('tambahModal').classList.remove('hidden');
    document.body.classList.add('overflow-hidden');
  }

  function closeTambahModal() {
    document.getElementById('tambahModal').classList.add('hidden');
    document.body.classList.remove('overflow-hidden');
  }
</script>
