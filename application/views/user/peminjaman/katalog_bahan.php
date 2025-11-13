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

  <!-- Search + Filter (responsive: row on md+, stacked on mobile) -->
  <div class="w-full mb-4">
    <div class="flex flex-col md:flex-row md:items-center md:space-x-4 gap-2">
      <div class="relative flex-1">
        <i class="fa fa-search absolute left-3 top-3 text-gray-400"></i>
        <input id="searchInput"
          type="text"
          placeholder="Cari nama bahan atau kode..."
          class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-xl shadow-sm focus:ring-2 focus:ring-teal-400 focus:outline-none transition text-sm" />
      </div>

      <div class="w-full md:w-60">
        <div class="relative" id="customDropdown">
          <button
            id="dropdownButton"
            type="button"
            class="w-full flex justify-between items-center border border-teal-400 text-gray-800 font-medium rounded-xl px-4 py-1.5 focus:outline-none focus:ring-2 focus:ring-teal-500 transition-all duration-300 hover:shadow-md bg-white">
            <span id="selectedOption">🌍 Semua Kategori</span>
            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-teal-600 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
          </button>

          <div
            id="dropdownMenu"
            class="hidden absolute mt-2 w-full bg-white border border-teal-300 rounded-xl shadow-lg overflow-hidden z-10 transition-all duration-200">
            <div class="option-item px-4 py-3 hover:bg-teal-100 cursor-pointer flex items-center gap-2" data-value="">
              <span>🌍 Semua Kategori</span>
            </div>
            <div class="option-item px-4 py-3 hover:bg-teal-100 cursor-pointer flex items-center gap-2" data-value="3">
              <i class="fa-solid fa-user-nurse text-teal-600 mr-2"></i>Bahan Keperawatan
            </div>
            <div class="option-item px-4 py-3 hover:bg-teal-100 cursor-pointer flex items-center gap-2" data-value="4">
              <i class="fa-solid fa-person-breastfeeding text-teal-600 mr-2"></i>Bahan Kebidanan
            </div>
          </div>
          <input type="hidden" id="filterKategori" value="">
        </div>
      </div>
    </div>
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
          <tr class="hover:bg-gray-50 transition" data-sub="<?= $b->id_sub_kategori; ?>">
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
                onclick="openTambahModal('<?= $b->id_barang; ?>', '<?= htmlspecialchars($b->nama_barang, ENT_QUOTES); ?>', <?= (int)$b->stok; ?>)">
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
  // Elements
  const searchInput = document.getElementById('searchInput');
  const filterInput = document.getElementById('filterKategori');
  const dropdownButton = document.getElementById('dropdownButton');
  const dropdownMenu = document.getElementById('dropdownMenu');
  const selectedOptionEl = document.getElementById('selectedOption');

  const table = document.getElementById('bahanTable');
  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const rowsPerPage = 15;
  let currentPage = 1;
  let filteredRows = rows.slice();

  // Dropdown behavior
  dropdownButton.addEventListener('click', (e) => {
    e.stopPropagation();
    dropdownMenu.classList.toggle('hidden');
  });

  dropdownMenu.querySelectorAll('.option-item').forEach(item => {
    item.addEventListener('click', function () {
      const val = this.getAttribute('data-value') || '';
      filterInput.value = val;
      // update label
      selectedOptionEl.textContent = this.textContent.trim();
      dropdownMenu.classList.add('hidden');
      currentPage = 1;
      filterTable();
    });
  });

  // close dropdown when click outside
  document.addEventListener('click', () => dropdownMenu.classList.add('hidden'));

  // Core filter function (category + search)
  function filterTable() {
    const q = (searchInput.value || '').toLowerCase().trim();
    const cat = (filterInput.value || '').trim(); // '' or '3' or '4'

    filteredRows = rows.filter(row => {
      const kode = (row.cells[1]?.textContent || '').toLowerCase();
      const nama = (row.cells[2]?.textContent || '').toLowerCase();
      const sub = row.getAttribute('data-sub') || '';

      // category check
      if (cat !== '' && sub !== cat) return false;
      // default: show only sub 3 or 4 (in case other jenis present)
      if (cat === '' && !(sub === '3' || sub === '4')) return false;

      // search check
      if (!q) return true;
      return kode.includes(q) || nama.includes(q);
    });

    // reset page and render
    currentPage = 1;
    showCurrentPage();
  }

  // Render current page
  function showCurrentPage() {
    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    // hide all rows
    rows.forEach(r => r.style.display = 'none');

    // slice and show
    const pageRows = filteredRows.slice(start, end);
    pageRows.forEach((r, idx) => {
      r.style.display = '';
      r.cells[0].textContent = start + idx + 1;
    });

    updatePagination();
  }

  function updatePagination() {
    const total = filteredRows.length;
    const totalPages = Math.max(1, Math.ceil(total / rowsPerPage));
    document.getElementById('pageInfo').textContent = `Halaman ${currentPage} dari ${totalPages} (${total} item)`;

    const prevBtn = document.getElementById('prevPage');
    const nextBtn = document.getElementById('nextPage');

    prevBtn.disabled = currentPage === 1;
    nextBtn.disabled = currentPage >= totalPages;

    [prevBtn, nextBtn].forEach(btn => {
      if (btn.disabled) {
        btn.classList.add('opacity-50', 'cursor-not-allowed');
      } else {
        btn.classList.remove('opacity-50', 'cursor-not-allowed');
      }
    });
  }

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

  // debounce helper
  function debounce(fn, delay = 250) {
    let t;
    return function(...args) {
      clearTimeout(t);
      t = setTimeout(() => fn.apply(this, args), delay);
    };
  }

  searchInput.addEventListener('input', debounce(() => {
    filterTable();
  }, 300));

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

  // init
  // ensure default: show only sub 3 & 4 if present
  filterTable();
</script>
