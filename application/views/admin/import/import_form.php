<div class="p-4 w-full">
  <div class="p-4 bg-white rounded-2xl shadow-lg border border-gray-100">

    <!-- Header -->
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
      <h2 class="text-3xl font-bold text-gray-800 flex items-center gap-3">
        <i class="fas fa-file-import text-blue-500"></i>
        Import Data Barang
      </h2>

      <div class="flex gap-2">
        <a href="<?= site_url('admin/katalog_alat/tambah'); ?>"
          class="px-4 py-2 bg-gradient-to-r from-teal-600 to-teal-400 text-white rounded-xl shadow hover:scale-105 transition flex items-center gap-2">
          <i class="fas fa-plus"></i> Tambah Manual
        </a>
      </div>
    </div>

    <!-- Form Upload -->
    <form action="<?= site_url('admin/import/upload_csv'); ?>" method="post" enctype="multipart/form-data"
      class="flex flex-col gap-6 bg-gray-50 border border-teal-300 p-6 rounded-2xl shadow-xl mb-8">

      <!-- Pilih Kategori -->
      <div class="w-full">
        <label class="block text-sm font-semibold text-gray-700 mb-2">Pilih Kategori</label>

        <div class="relative" id="dropdownWrapper">
          <!-- Tombol utama dropdown -->
          <button
            type="button"
            id="dropdownButton"
            class="w-full flex justify-between items-center border border-teal-400 text-gray-800 font-medium rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-teal-500 hover:shadow-md transition-all duration-300">
            <span id="dropdownLabel"><i class="fa-solid fa-boxes-stacked mr-2 text-teal-600"></i>-- Pilih Kategori --</span>
            <i class="fa-solid fa-chevron-down text-teal-600 transition-transform duration-300"></i>
          </button>

          <!-- Daftar opsi -->
          <div
            id="dropdownMenu"
            class="absolute z-10 hidden w-full mt-2 bg-white border border-teal-300 rounded-xl shadow-lg overflow-hidden animate-fadeIn">
            <div class="cursor-pointer px-4 py-2.5 hover:bg-teal-50 flex items-center gap-2 text-gray-700" data-value="alat">
              <i class="fa-solid fa-stethoscope text-teal-600"></i> Alat
            </div>
            <div class="cursor-pointer px-4 py-2.5 hover:bg-teal-50 flex items-center gap-2 text-gray-700" data-value="bahan_keperawatan">
              <i class="fa-solid fa-user-nurse text-teal-600"></i> Bahan Keperawatan
            </div>
            <div class="cursor-pointer px-4 py-2.5 hover:bg-teal-50 flex items-center gap-2 text-gray-700" data-value="bahan_kebidanan">
              <i class="fa-solid fa-person-breastfeeding text-teal-600"></i> Bahan Kebidanan
            </div>
          </div>

          <!-- Input tersembunyi agar tetap bisa dikirim di form -->
          <input type="hidden" name="kategori" id="kategoriInput" />
        </div>
      </div>

      <script>
        const dropdownButton = document.getElementById("dropdownButton");
        const dropdownMenu = document.getElementById("dropdownMenu");
        const dropdownLabel = document.getElementById("dropdownLabel");
        const kategoriInput = document.getElementById("kategoriInput");

        dropdownButton.addEventListener("click", () => {
          dropdownMenu.classList.toggle("hidden");
          dropdownButton.querySelector("i.fa-chevron-down").classList.toggle("rotate-180");
        });

        dropdownMenu.querySelectorAll("div[data-value]").forEach((item) => {
          item.addEventListener("click", () => {
            const icon = item.querySelector("i").outerHTML;
            const text = item.textContent.trim();
            dropdownLabel.innerHTML = `${icon} ${text}`;
            kategoriInput.value = item.getAttribute("data-value");
            dropdownMenu.classList.add("hidden");
            dropdownButton.querySelector("i.fa-chevron-down").classList.remove("rotate-180");
          });
        });

        // Klik di luar dropdown → tutup
        document.addEventListener("click", (e) => {
          if (!document.getElementById("dropdownWrapper").contains(e.target)) {
            dropdownMenu.classList.add("hidden");
            dropdownButton.querySelector("i.fa-chevron-down").classList.remove("rotate-180");
          }
        });
      </script>

      <!-- Upload File -->
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2">Upload File (CSV)</label>
        <input type="file" name="file_csv" accept=".csv"
          class="w-full border border-teal-400 rounded-lg p-2 bg-white focus:ring-2 focus:ring-indigo-400 focus:border-indigo-400">
        <p class="text-xs text-red-500 mt-2">Hanya file .CSV (gunakan template yang sesuai format)</p>
      </div>

      <!-- Tombol Konversi -->
      <div class="flex justify-start">
        <a href="https://convertio.co/xls-csv/" target="_blank"
          class="inline-flex items-center gap-2 text-teal-600 hover:text-teal-800 text-md font-medium transition">
          <i class="fas fa-external-link-alt"></i>
          Belum CSV? Konversi di sini
        </a>
      </div>

      <!-- Tombol Import & Kembali (sejajar, tidak fixed) -->
      <div class="flex justify-between items-center w-full">
        <!-- Tombol Kembali (kiri) -->
        <button
          type="button"
          onclick="history.back()"
          aria-label="Kembali"
          class="inline-flex items-center gap-2 px-4 py-2 bg-gray-200 border border-gray-300 text-gray-800 rounded-lg shadow hover:bg-gray-50 transition">
          <i class="fas fa-arrow-left"></i>
          Kembali
        </button>

        <!-- Tombol Import (kanan) -->
        <div>
          <button type="submit"
            class="px-10 py-2 bg-gradient-to-r from-blue-600 to-blue-400 text-white rounded-xl hover:scale-105 shadow-lg transition-all duration-200 flex items-center gap-2 text-lg font-semibold">
            <i class="fas fa-upload"></i> Import
          </button>
        </div>
      </div>
    </form>

    <!-- Search -->
    <!-- <div class="relative w-full md:w-80 mb-4">
      <input
        type="text"
        id="searchInput"
        placeholder="🔍 Ketik nama atau kode barang..."
        class="w-full border border-gray-300 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
      <div id="loadingSpinner" class="hidden absolute right-3 top-2.5">
        <svg class="animate-spin h-5 w-5 text-blue-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
          <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
          <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v4l3-3-3-3v4a8 8 0 00-8 8z"></path>
        </svg>
      </div>
    </div> -->

    <!-- Data Table -->
    <!-- <div class="overflow-x-auto">
      <table class="min-w-full text-sm text-left border border-gray-200 rounded-lg overflow-hidden">
        <thead class="bg-gradient-to-r from-teal-500 to-teal-400 text-white uppercase text-xs">
          <tr>
            <th class="px-4 py-3">No</th>
            <th class="px-4 py-3">Kode</th>
            <th class="px-4 py-3">Nama Barang</th>
            <th class="px-4 py-3 text-center">Stok</th>
            <th class="px-4 py-3 text-center">Kategori</th>
          </tr>
        </thead>
        <tbody id="barangTableBody" class="divide-y divide-gray-100">
          <?php if (!empty($barang)): $no = 1 + ($this->input->get('per_page') ?? 0); ?>
            <?php foreach ($barang as $b): ?>
              <tr class="hover:bg-gray-50 transition">
                <td class="px-4 py-2"><?= $no++ ?></td>
                <td class="px-4 py-2 font-semibold text-gray-800"><?= $b->kode_barang ?></td>
                <td class="px-4 py-2 text-gray-700"><?= $b->nama_barang ?></td>
                <td class="px-4 py-2 text-center"><?= $b->stok ?></td>
                <td class="px-4 py-2 text-center">
                  <?= ['Alat', 'Bahan', 'Bahan Keperawatan', 'Bahan Kebidanan'][$b->id_sub_kategori - 1] ?? 'Lainnya'; ?>
                </td>
              </tr>
            <?php endforeach; ?>
          <?php else: ?>
            <tr>
              <td colspan="5" class="p-4 text-center text-gray-500">Tidak ada data ditemukan.</td>
            </tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div> -->

    <!-- <div class="mt-6">
      <?= $pagination; ?>
    </div> -->
  </div>
</div>

<!-- Modal Success/error -->
<?php if ($this->session->flashdata('success') || $this->session->flashdata('error')): ?>
  <div id="notifModal" class="fixed inset-0 bg-black/50 flex items-center justify-center z-50 animate-fadeIn">
    <div class="bg-white rounded-2xl shadow-2xl p-6 text-center max-w-md w-full mx-4 animate-scaleIn">
      <?php if ($this->session->flashdata('success')): ?>
        <div class="text-green-500 text-5xl mb-3">
          <i class="fas fa-check-circle"></i>
        </div>
        <h3 class="text-xl font-semibold text-gray-800 mb-2">Berhasil!</h3>
        <p class="text-gray-600 mb-4"><?= $this->session->flashdata('success'); ?></p>
      <?php else: ?>
        <div class="text-red-500 text-5xl mb-3">
          <i class="fas fa-times-circle"></i>
        </div>
        <h3 class="text-xl font-semibold text-gray-800 mb-2">Gagal!</h3>
        <p class="text-gray-600 mb-4"><?= $this->session->flashdata('error'); ?></p>
      <?php endif; ?>

      <button onclick="closeNotif()" class="px-5 py-2 bg-gradient-to-r from-teal-600 to-teal-400 text-white rounded-lg hover:scale-105 transition">
        Tutup
      </button>
    </div>
  </div>

  <script>
    function closeNotif() {
      const modal = document.getElementById('notifModal');
      modal.classList.add('hidden');

      // ambil kategori terakhir diimport dari session (dikirim lewat flashdata)
      const kategori = "<?= $this->session->flashdata('kategori'); ?>";

      // arahkan ke halaman katalog sesuai kategori
      if (kategori === 'alat') {
        window.location.href = "<?= site_url('admin/katalog_alat'); ?>";
      } else if (kategori === 'bahan') {
        window.location.href = "<?= site_url('admin/katalog_bahan'); ?>";
      } else if (kategori === 'bahan_keperawatan') {
        window.location.href = "<?= site_url('admin/katalog_bahan'); ?>";
      } else if (kategori === 'bahan_kebidanan') {
        window.location.href = "<?= site_url('admin/katalog_bahan'); ?>";
      } else {
        // fallback ke halaman utama import jika tidak ada kategori
        window.location.href = "<?= site_url('admin/import'); ?>";
      }
    }
  </script>
<?php endif; ?>