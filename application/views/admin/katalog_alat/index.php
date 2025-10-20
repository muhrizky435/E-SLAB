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
    <div class="relative w-full sm:w-[48%] md:w-80 justify-center md:justify-start">
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

    <!-- Filter kategori -->
    <div class="relative w-full sm:w-[48%] md:w-60 justify-center md:justify-start" id="customDropdown">
      <!-- Tombol utama -->
      <button
        id="dropdownButton"
        type="button"
        class="w-full flex justify-between items-center border border-teal-400 text-gray-800 font-medium rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-teal-500 transition-all duration-300 hover:shadow-md bg-white">
        <span id="selectedOption">🌍 Semua Kategori</span>
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-teal-600 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
        </svg>
      </button>

      <!-- Daftar opsi -->
      <div
        id="dropdownMenu"
        class="hidden absolute mt-2 w-full bg-white border border-teal-300 rounded-xl shadow-lg overflow-hidden z-10 transition-all duration-300">
        <div
          class="option-item px-4 py-3 hover:bg-teal-100 cursor-pointer transition-colors duration-200 flex items-center gap-2"
          data-value="">
          <span>🌍 Semua Kategori</span>
        </div>
        <div
          class="option-item px-4 py-3 hover:bg-teal-100 cursor-pointer transition-colors duration-200 flex items-center gap-2"
          data-value="1">
          <i class="fa-solid fa-user-nurse text-teal-600 mr-2"></i>Alat Keperawatan
        </div>
        <div
          class="option-item px-4 py-3 hover:bg-teal-100 cursor-pointer transition-colors duration-200 flex items-center gap-2"
          data-value="3">
          <i class="fa-solid fa-person-breastfeeding text-teal-600 mr-2"></i>Alat Kebidanan
        </div>
      </div>

      <!-- Hidden input (untuk JS agar tetap bisa ambil value) -->
      <input type="hidden" id="filterKategori" value="">
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

  <!-- Pagination container -->
  <div id="paginationContainer" class="mt-4">
    <?= $pagination; ?>
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
  const searchInput = document.getElementById('searchInput');
  const filterKategori = document.getElementById('filterKategori');
  const tableBody = document.getElementById('tableBody');
  const spinner = document.getElementById('loadingSpinner');
  const paginationContainer = document.getElementById('paginationContainer');
  let timeout = null;

  function updateTable(keyword, kategori = '', page = 0) {
    spinner.classList.remove('hidden');
    fetch(`<?= site_url('admin/katalog_alat/live_search'); ?>?keyword=${encodeURIComponent(keyword)}&kategori=${kategori}&page=${page}`)
      .then(r => r.json())
      .then(data => {
        tableBody.innerHTML = data.rows;
        paginationContainer.innerHTML = data.pagination;
        bindPaginationLinks();
      })
      .catch(err => console.error(err))
      .finally(() => spinner.classList.add('hidden'));
  }

  searchInput.addEventListener('input', function() {
    clearTimeout(timeout);
    const keyword = this.value.trim();
    const kategori = filterKategori.value;
    timeout = setTimeout(() => {
      updateTable(keyword, kategori, 0);
    }, 350);
  });

  filterKategori.addEventListener('change', function() {
    const keyword = searchInput.value.trim();
    updateTable(keyword, this.value, 0);
  });

  function bindPaginationLinks() {
    const links = paginationContainer.querySelectorAll('a');
    links.forEach(a => {
      a.addEventListener('click', function(e) {
        e.preventDefault();
        const url = new URL(a.href);
        const perPage = url.searchParams.get('per_page') || 0;
        const pageIndex = Math.floor(perPage / 15);
        const keyword = searchInput.value.trim();
        const kategori = filterKategori.value;
        updateTable(keyword, kategori, pageIndex);
      });
    });
  }

  bindPaginationLinks();

  // klik tombol hapus dengan modal konfirmasi
  document.addEventListener('click', function(e) {
    if (e.target.closest('.btn-delete')) {
      e.preventDefault();
      const href = e.target.closest('.btn-delete').getAttribute('href');
      const modal = document.getElementById('confirmDeleteModal');
      const confirmBtn = document.getElementById('confirmDeleteBtn');

      confirmBtn.setAttribute('href', href);
      modal.classList.remove('hidden');
      modal.classList.add('flex');
    }
  });

  document.getElementById('cancelDelete').addEventListener('click', function() {
    const modal = document.getElementById('confirmDeleteModal');
    modal.classList.add('animate-fade-out');
    setTimeout(() => {
      modal.classList.add('hidden');
      modal.classList.remove('flex', 'animate-fade-out');
    }, 300);
  });

  // Dropdown filter kategori
  const dropdownButton = document.getElementById("dropdownButton");
  const dropdownMenu = document.getElementById("dropdownMenu");
  const selectedOption = document.getElementById("selectedOption");
  const hiddenInput = document.getElementById("filterKategori");
  const dropdownIcon = dropdownButton.querySelector("svg");

  // Toggle dropdown
  dropdownButton.addEventListener("click", () => {
    dropdownMenu.classList.toggle("hidden");
    dropdownIcon.classList.toggle("rotate-180");
  });

  // Pilih opsi
  document.querySelectorAll(".option-item").forEach(item => {
    item.addEventListener("click", () => {
      const value = item.dataset.value;
      const label = item.textContent.trim();

      hiddenInput.value = value;
      selectedOption.textContent = label;

      dropdownMenu.classList.add("hidden");
      dropdownIcon.classList.remove("rotate-180");

      // Panggil fungsi pencarian/filter (sesuai JS kamu sebelumnya)
      const keyword = document.getElementById('searchInput')?.value.trim() || '';
      updateTable(keyword, value, 0);
    });
  });

  // Tutup dropdown jika klik di luar
  document.addEventListener("click", (e) => {
    if (!document.getElementById("customDropdown").contains(e.target)) {
      dropdownMenu.classList.add("hidden");
      dropdownIcon.classList.remove("rotate-180");
    }
  });
</script>