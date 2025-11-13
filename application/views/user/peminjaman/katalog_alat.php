<div class="p-4 sm:p-4 lg:p-4 min-h-screen">
  <!-- Header -->
  <div class="flex flex-col sm:flex-row justify-between items-center mb-6">
    <div class="flex flex-col items-start">
      <h3 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
        <i class="fa-solid fa-stethoscope text-teal-500"></i>
        <span><?= $title; ?></span>
      </h3>
      <p class="text-gray-500 italic text-sm mt-1">
        “Temukan Alat Kesehatan untuk Keperawatan dan Kebidanan untuk memudahkan kegiatan.”
      </p>
    </div>
  </div>

  <div class="relative mb-4 sm:mt-0 w-full">
    <i class="fa fa-search absolute left-3 top-3 text-gray-400"></i>
    <input id="searchInput"
      type="text"
      placeholder="Cari nama alat atau kode..."
      class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-xl shadow-sm focus:ring-2 focus:ring-teal-400 focus:outline-none transition text-sm" />
  </div>

  <!-- Table -->
  <div class="overflow-x-auto bg-white/80 backdrop-blur-sm border border-gray-100 shadow-lg rounded-2xl">
    <table class="min-w-full text-sm" id="alatTable">
      <thead class="bg-gradient-to-r from-teal-500 to-teal-400 text-white uppercase">
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
          <tr class="hover:bg-teal-50 transition duration-200">
            <td class="px-6 py-4 text-gray-700"><?= $no++; ?></td>
            <td class="px-6 py-4 text-gray-700"><?= $b->kode_barang; ?></td>
            <td class="px-6 py-4 font-semibold text-gray-900"><?= $b->nama_barang; ?></td>
            <td class="px-6 py-4 text-center">
              <span class="px-3 py-1 bg-green-100 text-green-700 rounded-full text-sm font-medium"><?= $b->stok; ?></span>
            </td>
            <td class="px-6 py-4 text-center text-gray-700"><?= $b->satuan; ?></td>
            <td class="px-6 py-4 text-center">
              <button
                class="bg-gradient-to-r from-teal-500 to-teal-600 hover:from-teal-600 hover:to-teal-700 text-white px-4 py-2 rounded-lg text-sm flex items-center justify-center gap-2 shadow-sm hover:shadow-md transition transform hover:scale-[1.03] mx-auto"
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
<div id="tambahModal" class="hidden fixed inset-0 bg-black/40 backdrop-blur-sm flex justify-center items-center z-50 p-4">
  <div class="bg-white rounded-2xl shadow-2xl w-full max-w-2xl p-8 relative animate-scale-in overflow-y-auto max-h-[90vh]">
    <div class="flex items-center justify-between border-b pb-3 mb-4">
      <h3 class="text-2xl font-bold text-gray-800 flex items-center gap-2">
        <i class="fa-solid fa-cart-plus text-teal-500"></i> Tambah ke Keranjang
      </h3>
      <button onclick="closeTambahModal()" class="text-gray-400 hover:text-gray-600 transition">
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
          class="w-full border border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-teal-400 focus:outline-none text-base">
        <small class="text-gray-500 text-sm">Stok tersedia: <span id="modalStok"></span></small>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-2">Catatan</label>
        <textarea name="catatan" rows="3" placeholder="Tambahkan catatan..."
          class="w-full border border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-teal-400 focus:outline-none text-base"></textarea>
      </div>

      <div class="flex justify-end gap-3 pt-4 border-t">
        <button type="button" onclick="closeTambahModal()"
          class="px-5 py-2.5 rounded-lg bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm font-medium transition">Batal</button>
        <button type="submit"
          class="px-5 py-2.5 rounded-lg bg-gradient-to-r from-teal-500 to-teal-600 hover:from-teal-600 hover:to-teal-700 text-white text-sm font-medium transition">Tambah</button>
      </div>
    </form>
  </div>
</div>

<!-- Animasi -->
<style>
  @keyframes scaleIn {
    from {
      opacity: 0;
      transform: scale(0.95);
    }

    to {
      opacity: 1;
      transform: scale(1);
    }
  }

  .animate-scale-in {
    animation: scaleIn 0.25s ease-out;
  }
</style>

<!-- Script -->
<script>
  // Variables
  const searchInput = document.getElementById('searchInput');
  const table = document.getElementById('alatTable') || document.getElementById('bahanTable');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const rowsPerPage = 15;
  let currentPage = 1;
  let filteredRows = rows;

  // Search and filter function
  function filterTable() {
    const filter = searchInput.value.toLowerCase();
    
    // Filter rows based on search
    filteredRows = rows.filter(row => {
      const nama = row.cells[2].textContent.toLowerCase();
      const kode = row.cells[1].textContent.toLowerCase();
      return nama.includes(filter) || kode.includes(filter);
    });

    // Reset to first page when searching
    currentPage = 1;
    updatePagination();
    showCurrentPage();
  }

  // Show current page
  function showCurrentPage() {
    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    // Hide all rows first
    rows.forEach(row => row.style.display = 'none');
    
    // Show only filtered rows for current page
    filteredRows.slice(start, end).forEach(row => {
      row.style.display = '';
      // Update row numbers
      const rowNum = start + filteredRows.indexOf(row) + 1;
      row.cells[0].textContent = rowNum;
    });

    updatePagination();
  }

  // Update pagination info and buttons
  function updatePagination() {
    const totalPages = Math.max(1, Math.ceil(filteredRows.length / rowsPerPage));
    
    // Update page info text
    document.getElementById('pageInfo').textContent = 
      `Halaman ${currentPage} dari ${totalPages} (${filteredRows.length} item)`;
    
    // Update button states
    const prevBtn = document.getElementById('prevPage');
    const nextBtn = document.getElementById('nextPage');
    
    prevBtn.disabled = currentPage === 1;
    nextBtn.disabled = currentPage >= totalPages;

    // Visual feedback for disabled state
    if (prevBtn.disabled) {
      prevBtn.classList.add('opacity-50', 'cursor-not-allowed');
    } else {
      prevBtn.classList.remove('opacity-50', 'cursor-not-allowed');
    }
    
    if (nextBtn.disabled) {
      nextBtn.classList.add('opacity-50', 'cursor-not-allowed');
    } else {
      nextBtn.classList.remove('opacity-50', 'cursor-not-allowed');
    }
  }

  // Event Listeners
  searchInput.addEventListener('input', debounce(function() {
    filterTable();
  }, 300));

  document.getElementById('prevPage').addEventListener('click', () => {
    if (currentPage > 1) {
      currentPage--;
      showCurrentPage();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  });

  document.getElementById('nextPage').addEventListener('click', () => {
    const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
    if (currentPage < totalPages) {
      currentPage++;
      showCurrentPage();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  });

  // Debounce helper function
  function debounce(fn, delay) {
    let timeoutId;
    return function (...args) {
      clearTimeout(timeoutId);
      timeoutId = setTimeout(() => fn.apply(this, args), delay);
    };
  }

  // Modal functions
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

  // Initialize pagination on page load
  filterTable();
</script>