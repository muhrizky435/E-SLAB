<div class="p-2 space-y-6">
  <!-- Header -->
  <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-3">
    <div class="flex flex-col mb-4">
      <h1 class="text-3xl font-bold text-gray-800"><i class="fa-solid fa-stethoscope mr-2 text-teal-500"></i>Katalog Alat</h1>
      <p class="text-gray-500 text-sm mt-1 italic">“Temukan dan kelola alat kesehatan Keperawatan dan Kebidanan dengan mudah dan cepat.”</p>
    </div>
  </div>

  <div class="w-full flex flex-wrap md:flex-nowrap gap-3 md:gap-4">
    <a href="<?= site_url('admin/import'); ?>" class="flex items-center gap-2 px-4 py-3 bg-gradient-to-r from-blue-600 to-blue-400 text-white text-sm rounded-lg hover:scale-105">
      <i class="fas fa-file-import"></i><span>Import</span>
    </a>
    <a href="<?= site_url('admin/katalog_alat/tambah'); ?>" class="flex items-center gap-2 px-4 py-3 bg-gradient-to-r from-teal-600 to-teal-400 text-white text-sm rounded-lg hover:scale-105">
      <i class="fas fa-plus"></i><span>Tambah Manual</span>
    </a>

    <!-- Input Pencarian -->
    <div class="relative w-full sm:w-[65%] md:w-100 justify-center md:justify-start">
      <input
        type="text"
        id="searchInput"
        placeholder="🔍 Cari nama atau kode bahan..."
        class="w-full border border-teal-400 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-teal-500 hover:shadow-md transition">
      <div id="loadingSpinner" class="hidden absolute right-3 top-2.5">
        <svg class="animate-spin h-5 w-5 text-blue-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
          <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
          <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v4l3-3-3-3v4a8 8 0 00-8 8z"></path>
        </svg>
      </div>
    </div>

  </div>
  <!-- Table -->
  <div class="overflow-x-auto bg-white rounded-2xl shadow-lg border border-gray-100">
    <table class="min-w-full text-sm text-gray-700">
      <thead class="bg-gradient-to-r from-teal-500 to-teal-400 text-white text-sm uppercase">
        <tr>
          <th class="py-3 px-4 text-left">No</th>
          <th class="py-3 px-4 text-left">Kode Barang</th>
          <th class="py-3 px-4 text-left">Nama Barang</th>
          <th class="py-3 px-4 text-center">Stok</th>
          <th class="py-3 px-4 text-center">Aksi</th>
        </tr>
      </thead>
      <tbody id="tableBody">
        <?= $this->load->view('admin/katalog_alat/_rows', ['barang' => $barang, 'offset' => ($this->input->get('per_page') ?? 0)], true); ?>
      </tbody>
    </table>
  </div>

  <!-- Pagination (sama seperti file katalog_alat.php) -->
  <div class="flex justify-center items-center mt-5 space-x-2 text-sm">
    <button id="prevPage" class="px-3 py-1 bg-gray-200 hover:bg-blue-300 rounded-lg text-gray-700">Prev</button>
    <span id="pageInfo" class="text-gray-700"></span>
    <button id="nextPage" class="px-3 py-1 bg-gray-200 hover:bg-blue-300 rounded-lg text-gray-700">Next</button>
  </div>

  <!-- Modal Konfirmasi Hapus -->
  <div id="confirmDeleteModal" class="fixed inset-0 bg-black bg-opacity-40 hidden items-center justify-center z-50">
    <div class="bg-white rounded-2xl shadow-lg p-6 w-full max-w-sm text-center animate-fade-in">
      <svg xmlns="http://www.w3.org/2000/svg" class="w-12 h-12 mx-auto text-red-500 mb-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
      </svg>
      <h2 class="text-lg font-semibold text-gray-800 mb-2">Yakin ingin menghapus alat ini?</h2>
      <p class="text-gray-500 mb-4 text-sm">Data yang dihapus tidak dapat dikembalikan.</p>
      <div class="flex justify-center gap-3">
        <button id="cancelDelete" class="bg-gray-300 px-4 py-2 rounded-lg hover:bg-gray-400 transition">Batal</button>
        <a id="confirmDeleteBtn" href="#" class="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition">Hapus</a>
      </div>
    </div>
  </div>

  <?php if ($this->session->flashdata('modal_message')): ?>
    <div id="resultModal" class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50">
      <div class="bg-white rounded-2xl shadow-lg p-6 w-full max-w-sm text-center animate-fade-in">
        <?php if ($this->session->flashdata('modal_type') === 'success'): ?>
          <svg xmlns="http://www.w3.org/2000/svg" class="w-12 h-12 mx-auto text-green-500 mb-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
          </svg>
          <h2 class="text-lg font-semibold text-gray-800 mb-2">Berhasil!</h2>
        <?php else: ?>
          <svg xmlns="http://www.w3.org/2000/svg" class="w-12 h-12 mx-auto text-red-500 mb-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
          <h2 class="text-lg font-semibold text-gray-800 mb-2">Gagal!</h2>
        <?php endif; ?>
        <p class="text-gray-600"><?= $this->session->flashdata('modal_message'); ?></p>
        <button onclick="closeModal('<?= site_url('admin/katalog_alat'); ?>')"
          class="bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700 transition">
          Tutup
        </button>
      </div>
    </div>

  <?php endif; ?>

</div>


<!-- Script Search -->
<script>
  // Elements
  const searchInput = document.getElementById('searchInput');
  const tableBody = document.getElementById('tableBody');
  const spinner = document.getElementById('loadingSpinner');
  const prevBtn = document.getElementById('prevPage');
  const nextBtn = document.getElementById('nextPage');
  const pageInfo = document.getElementById('pageInfo');

  // Live search + server fetch (ke server untuk mendapatkan filtered rows)
  let currentServerPage = 0; // server page index (used in AJAX)
  const serverPerPage = 15;

  function updateTable(keyword = '', page = 0) {
    spinner.classList.remove('hidden');
    fetch(`<?= site_url('admin/katalog_alat/live_search'); ?>?keyword=${encodeURIComponent(keyword)}&page=${page}`)
      .then(r => r.json())
      .then(data => {
        tableBody.innerHTML = data.rows;
        // initialize client-side pagination on the returned rows (same UX as katalog_alat)
        initClientPagination();
        currentServerPage = page;
      })
      .catch(err => console.error(err))
      .finally(() => spinner.classList.add('hidden'));
  }

  // Debounce helper
  function debounce(fn, delay = 300) {
    let t;
    return function(...args) {
      clearTimeout(t);
      t = setTimeout(() => fn.apply(this, args), delay);
    };
  }

  searchInput.addEventListener('input', debounce(function() {
    const keyword = this.value.trim();
    // fetch filtered rows from server (start from server page 0)
    updateTable(keyword, 0);
  }, 350));

  // Client-side pagination for the currently loaded rows (to match katalog_alat UI)
  const rowsPerPage = 15;
  let currentPage = 1;
  let currentRows = [];

  function collectRows() {
    const all = Array.from(tableBody.querySelectorAll('tr'));
    return all.filter(r => {
      const tds = r.querySelectorAll('td');
      return tds.length > 1; // data rows
    });
  }

  function initClientPagination() {
    currentRows = collectRows();
    currentPage = 1;
    renderPage();
  }

  function renderPage() {
    const total = currentRows.length;
    const totalPages = Math.max(1, Math.ceil(total / rowsPerPage));
    currentRows.forEach((row, idx) => {
      const pageIndex = Math.floor(idx / rowsPerPage) + 1;
      row.style.display = (pageIndex === currentPage) ? '' : 'none';
    });
    pageInfo.textContent = `Halaman ${currentPage} dari ${totalPages} (${total} item)`;
    prevBtn.disabled = currentPage === 1;
    nextBtn.disabled = currentPage === totalPages;
  }

  prevBtn.addEventListener('click', () => {
    if (currentPage > 1) {
      currentPage--;
      renderPage();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    } else {
      if (currentServerPage > 0) {
        const keyword = searchInput.value.trim();
        updateTable(keyword, currentServerPage - 1);
      }
    }
  });

  nextBtn.addEventListener('click', () => {
    const totalPages = Math.max(1, Math.ceil(currentRows.length / rowsPerPage));
    if (currentPage < totalPages) {
      currentPage++;
      renderPage();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    } else {
      // at last client page, request next server page
      const keyword = searchInput.value.trim();
      updateTable(keyword, currentServerPage + 1);
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  });

  // initialize pagination on first load (table rendered by server)
  document.addEventListener('DOMContentLoaded', function() {
    initClientPagination();
  });
</script>