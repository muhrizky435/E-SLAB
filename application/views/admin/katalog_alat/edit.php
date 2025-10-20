<div class="max-w-5xl mx-6 p-6 bg-white rounded-2xl shadow-xl border border-gray-100">
  <!-- Header -->
  <div class="text-center mb-8">
    <h1 class="text-3xl font-extrabold text-gray-800 flex justify-center items-center gap-3">
      <i class="fa-solid fa-stethoscope text-teal-500"></i>
      Edit Data Alat
    </h1>
    <p class="text-gray-500 text-sm italic mt-2">
      “Perbarui informasi alat dengan cepat dan akurat.”
    </p>
  </div>

  <!-- Flash Message Modal -->
  <?php if ($this->session->flashdata('error') || $this->session->flashdata('success')): ?>
  <div id="flashModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-40 z-50">
    <div class="bg-white rounded-2xl shadow-2xl p-8 max-w-sm w-full text-center animate-fadeIn">
      <?php if ($this->session->flashdata('success')): ?>
        <div class="text-teal-500 mb-3">
          <i class="fa-solid fa-circle-check text-5xl mb-2"></i>
          <h2 class="text-xl font-semibold mb-1">Berhasil!</h2>
          <p class="text-gray-600 mt-2 mb-1"><?= $this->session->flashdata('success'); ?></p>
        </div>
      <?php elseif ($this->session->flashdata('error')): ?>
        <div class="text-red-500 mb-3">
          <i class="fa-solid fa-circle-xmark text-5xl mb-2"></i>
          <h2 class="text-xl font-semibold mb-1">Gagal!</h2>
          <p class="text-gray-600 mt-2 mb-1"><?= $this->session->flashdata('error'); ?></p>
        </div>
      <?php endif; ?>
      <button onclick="closeModal('<?= site_url('admin/katalog_alat'); ?>')"
        class="mt-4 px-6 py-2 bg-gradient-to-r from-teal-600 to-teal-500 text-white rounded-lg shadow hover:scale-105 transition-all duration-200">
        <i class="fa-solid fa-xmark mr-1"></i> Tutup
      </button>
    </div>
  </div>
  <?php endif; ?>

  <!-- Form Edit -->
  <form method="post" action="<?= site_url('admin/katalog_alat/update'); ?>" class="space-y-6">
    <input type="hidden" name="id_barang" value="<?= htmlspecialchars($barang->id_barang); ?>">

    <!-- Kode Barang -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-barcode text-teal-500"></i> Kode Barang
      </label>
      <input type="text"
        name="kode_barang"
        value="<?= htmlspecialchars($barang->kode_barang); ?>"
        class="w-full border border-gray-300 rounded-xl px-4 py-2 focus:ring-2 focus:ring-teal-400 focus:border-teal-400 outline-none transition"
        required>
    </div>

    <!-- Nama Barang -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-box-open text-teal-500"></i> Nama Barang
      </label>
      <input type="text"
        name="nama_barang"
        value="<?= htmlspecialchars($barang->nama_barang); ?>"
        class="w-full border border-gray-300 rounded-xl px-4 py-2 focus:ring-2 focus:ring-teal-400 focus:border-teal-400 outline-none transition"
        required>
    </div>

    <!-- Stok -->
    <div>
      <label class="block text-gray-700 font-semibold mb-2 flex items-center gap-2">
        <i class="fa-solid fa-cubes-stacked text-teal-500"></i> Stok
      </label>
      <input type="number"
        name="stok"
        value="<?= htmlspecialchars($barang->stok); ?>"
        min="0"
        class="w-full border border-gray-300 rounded-xl px-4 py-2 focus:ring-2 focus:ring-teal-400 focus:border-teal-400 outline-none transition"
        required>
    </div>

    <!-- Tombol Aksi -->
    <div class="flex flex-col md:flex-row justify-center gap-4 pt-6">
      <a href="<?= site_url('admin/katalog_alat'); ?>"
        class="flex items-center justify-center gap-2 bg-gray-200 text-gray-700 px-6 py-2 rounded-xl hover:bg-gray-300 shadow-sm transition w-full md:w-auto">
        <i class="fa-solid fa-arrow-left"></i> Kembali
      </a>
      <button type="submit"
        class="flex items-center justify-center gap-2 bg-gradient-to-r from-teal-600 to-teal-500 text-white px-6 py-2 rounded-xl shadow hover:scale-105 transition-all w-full md:w-auto">
        <i class="fa-solid fa-floppy-disk"></i> Simpan Perubahan
      </button>
    </div>
  </form>
</div>

<!-- Animasi -->
<style>
  @keyframes fadeIn {
    from { opacity: 0; transform: scale(0.95); }
    to { opacity: 1; transform: scale(1); }
  }
  .animate-fadeIn {
    animation: fadeIn 0.3s ease-out;
  }
</style>

<script>
  function closeModal(redirectUrl) {
    const modal = document.getElementById('flashModal');
    modal.classList.add('hidden');
    setTimeout(() => {
      window.location.href = redirectUrl;
    }, 200);
  }
</script>
