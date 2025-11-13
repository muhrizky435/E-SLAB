<div class="p-4 flex justify-center items-center min-h-screen">
  <div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-6xl transition-all duration-300 hover:shadow-2xl">
    <h2 class="text-3xl font-bold mb-2 text-center text-teal-700 flex items-center justify-center gap-2">
      <i class="fa-solid fa-flask-vial"></i> Tambah Bahan Baru
    </h2>
    <p class="text-gray-500 text-center mb-6 italic">Menambah inventaris bahan kesehatan untuk Keperawatan dan Kebidanan dengan efisien dan akurat</p>

    <form action="<?= site_url('admin/katalog_bahan/simpan'); ?>" method="post" class="space-y-5">
      <!-- Nama bahan -->
      <div>
        <label class="block text-gray-700 font-semibold mb-1">
          <i class="fa-solid fa-toolbox mr-1 text-teal-500"></i> Nama Bahan
        </label>
        <input type="text" name="nama_barang"
          class="w-full border border-teal-300 rounded-xl p-3 focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition duration-200"
          placeholder="Masukkan nama bahan" required>
      </div>

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
            <div class="cursor-pointer px-4 py-2.5 hover:bg-teal-50 flex items-center gap-2 text-gray-700" data-value="3">
              <i class="fa-solid fa-user-nurse text-teal-600"></i> Bahan Keperawatan
            </div>
            <div class="cursor-pointer px-4 py-2.5 hover:bg-teal-50 flex items-center gap-2 text-gray-700" data-value="4">
              <i class="fa-solid fa-person-breastfeeding text-teal-600"></i> Bahan Kebidanan
            </div>
          </div>

          <!-- Input tersembunyi agar tetap bisa dikirim di form -->
          <input type="hidden" name="id_sub_kategori" id="kategoriInput" />
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

      <!-- Deskripsi -->
      <div>
        <label class="block text-gray-700 font-semibold mb-1">
          <i class="fa-solid fa-file-lines mr-1 text-teal-500"></i> Deskripsi
        </label>
        <textarea name="deskripsi"
          class="w-full border border-teal-300 rounded-xl p-3 focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition duration-200"
          rows="3" placeholder="Tulis deskripsi bahan (opsional)"></textarea>
      </div>

      <!-- Satuan -->
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="block text-gray-700 font-semibold mb-1">
            <i class="fa-solid fa-box mr-1 text-teal-500"></i> Satuan
          </label>
          <input type="text" name="satuan" value="pcs" disabled
            class="w-full border border-teal-300 rounded-xl p-3 focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition duration-200"
            required>
        </div>

        <!-- Stok -->
        <div>
          <label class="block text-gray-700 font-semibold mb-1">
            <i class="fa-solid fa-cubes-stacked mr-1 text-teal-500"></i> Stok
          </label>
          <input type="number" name="stok"
            class="w-full border border-teal-300 rounded-xl p-3 focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition duration-200"
            placeholder="Jumlah stok" required>
        </div>
      </div>

      <!-- Stok Minimum -->
      <div>
        <label class="block text-gray-700 font-semibold mb-1">
          <i class="fa-solid fa-triangle-exclamation mr-1 text-teal-500"></i> Stok Minimum
        </label>
        <input type="number" name="stok_minimum" value="0"
          class="w-full border border-teal-300 rounded-xl p-3 focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition duration-200"
          placeholder="Minimal stok sebelum peringatan">
      </div>

      <!-- Tombol Kembali dan Simpan -->
      <div class="flex justify-between items-center pt-4">
        <!-- Tombol Kembali (kiri) -->
        <button 
          type="button"
          onclick="history.back()"
          class="inline-flex items-center gap-2 px-4 py-2 bg-gray-200 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 hover-scale-105 transition-all shadow-sm">
          <i class="fas fa-arrow-left"></i>
          Kembali
        </button>

        <!-- Tombol Simpan (kanan) -->
        <button 
          type="submit"
          class="inline-flex items-center gap-2 px-6 py-2.5 bg-gradient-to-r from-teal-500 to-teal-400 text-white rounded-xl hover:scale-105 transition-all shadow-lg">
          <i class="fas fa-plus"></i>
          Tambah Alat
        </button>
      </div>
    </form>
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
        <button onclick="closeModal('<?= site_url('admin/katalog_bahan'); ?>')"
          class="bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700 transition">
          Tutup
        </button>
      </div>
    </div>
  <?php endif; ?>
</div>