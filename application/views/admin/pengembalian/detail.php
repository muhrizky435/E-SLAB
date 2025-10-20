<div class="p-6 md:p-10 shadow-2xl rounded-3xl max-w-6xl mx-auto border border-gray-200 bg-gradient-to-br from-white to-teal-50">
  <!-- Header -->
  <div class="flex flex-col md:flex-row items-start md:items-center justify-between mb-8 gap-3">
    <div>
      <h2 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
        <i class="fa-solid fa-clipboard-check text-teal-600"></i>
        Detail Pengembalian
      </h2>
      <p class="text-gray-500 text-sm mt-1 italic">
        “Informasi lengkap mengenai peminjaman dan pengembalian alat dan bahan kesehatan.”
      </p>
    </div>

    <span class="px-4 py-2 rounded-full text-sm font-semibold shadow-sm
      <?= $peminjaman->status === 'dikembalikan' ? 'bg-blue-100 text-blue-700' : 'bg-yellow-100 text-yellow-700'; ?>">
      <i class="fa-solid fa-circle mr-1 text-xs"></i><?= ucfirst($peminjaman->status); ?>
    </span>
  </div>

  <!-- Informasi Umum -->
  <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-5 text-gray-700 bg-white rounded-2xl shadow-inner p-6">
    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-barcode text-teal-500"></i> Kode Peminjaman</p>
      <p class="text-lg font-medium"><?= htmlspecialchars($peminjaman->kode_peminjaman); ?></p>
    </div>

    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-user text-teal-500"></i> Nama Peminjam</p>
      <p class="text-lg font-medium"><?= htmlspecialchars($peminjaman->nama_peminjam); ?></p>
    </div>

    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-graduation-cap text-teal-500"></i> Jurusan</p>
      <p class="text-lg font-medium"><?= htmlspecialchars($peminjaman->jurusan); ?></p>
    </div>

    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-users text-teal-500"></i> Kelas</p>
      <p class="text-lg font-medium"><?= htmlspecialchars($peminjaman->kelas); ?></p>
    </div>

    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-phone text-teal-500"></i> No. HP</p>
      <p class="text-lg font-medium"><?= htmlspecialchars($peminjaman->no_hp); ?></p>
    </div>

    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-calendar-day text-teal-500"></i> Tanggal Pinjam</p>
      <p class="text-lg"><?= date('d M Y', strtotime($peminjaman->tanggal_pinjam)); ?></p>
    </div>

    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-calendar-check text-teal-500"></i> Tanggal Kembali</p>
      <p class="text-lg"><?= date('d M Y', strtotime($peminjaman->tanggal_kembali)); ?></p>
    </div>

    <?php if (!empty($peminjaman->tanggal_dikembalikan)): ?>
    <div class="space-y-1">
      <p class="font-semibold text-gray-600 flex items-center gap-2"><i class="fa-solid fa-calendar-check text-teal-500"></i> Tanggal Dikembalikan</p>
      <p class="text-lg text-teal-700 font-semibold"><?= date('d M Y', strtotime($peminjaman->tanggal_dikembalikan)); ?></p>
    </div>
    <?php endif; ?>
  </div>

  <!-- Daftar Barang -->
  <div class="mt-10">
    <h3 class="text-2xl font-bold text-gray-800 mb-4 flex items-center gap-2">
      <i class="fa-solid fa-boxes-stacked text-teal-600"></i> Daftar Barang yang Dipinjam
    </h3>

    <div class="overflow-x-auto bg-white rounded-2xl shadow-md">
      <table class="min-w-full text-sm text-gray-700 border border-gray-200 rounded-lg overflow-hidden">
        <thead class="bg-gradient-to-r from-teal-600 to-teal-500 text-white">
          <tr>
            <th class="px-5 py-3 text-left font-semibold">Nama Barang</th>
            <th class="px-5 py-3 text-left font-semibold">Jenis</th>
            <th class="px-5 py-3 text-center font-semibold">Jumlah</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($items as $i): ?>
          <tr class="border-t hover:bg-teal-50 transition">
            <td class="px-5 py-3"><?= htmlspecialchars($i->nama_barang); ?></td>
            <td class="px-5 py-3"><?= htmlspecialchars($i->jenis); ?></td>
            <td class="px-5 py-3 text-center font-semibold"><?= htmlspecialchars($i->jumlah); ?></td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Catatan -->
  <div class="mt-6 bg-white p-5 rounded-xl shadow-inner text-gray-600 text-sm flex items-start gap-3 border border-gray-100">
    <i class="fa-solid fa-circle-info text-teal-600 text-lg mt-0.5"></i>
    <p>Pastikan semua barang dikembalikan dalam kondisi baik dan sesuai dengan jumlah yang tercatat di sistem.</p>
  </div>

  <!-- Tombol Aksi -->
  <div class="flex flex-wrap justify-start gap-4 mt-10">
    <a href="<?= site_url('admin/pengembalian'); ?>" 
       class="inline-flex items-center gap-2 bg-gradient-to-r from-gray-400 to-gray-500 text-white px-6 py-2.5 rounded-full hover:scale-105 transform transition font-medium shadow-md">
       <i class="fa-solid fa-arrow-left"></i> Kembali ke Daftar
    </a>

    <?php if ($peminjaman->status !== 'dikembalikan'): ?>
      <button type="button"
              onclick="openModalBack()"
              class="inline-flex items-center gap-2 bg-gradient-to-r from-teal-600 to-teal-400 text-white px-6 py-2.5 rounded-full hover:scale-105 transform transition font-medium shadow-md">
        <i class="fa-solid fa-rotate-left"></i> Tandai Dikembalikan
      </button>
    <?php endif; ?>
  </div>
</div>

<!-- Modal Konfirmasi -->
<div id="modalKonfirmasi" class="fixed inset-0 bg-black bg-opacity-50 hidden justify-center items-center z-50">
  <div class="bg-white rounded-2xl shadow-2xl p-8 max-w-md w-full mx-4 text-center relative animate-fadeIn">
    <i class="fa-solid fa-circle-exclamation text-5xl text-teal-600 mb-4"></i>
    <h3 class="text-2xl font-bold text-gray-800 mb-2">Konfirmasi Pengembalian</h3>
    <p class="text-gray-600 mb-6">Apakah Anda yakin ingin menandai peminjaman ini sebagai <strong>dikembalikan</strong>?</p>

    <div class="flex justify-center gap-4">
      <button onclick="closeModalBack()" class="px-5 py-2 rounded-full bg-gray-300 text-gray-700 hover:bg-gray-400 hover:scale-105 transition font-medium">
        <i class="fa-solid fa-xmark mr-2"></i> Batal
      </button>
      <form action="<?= site_url('admin/pengembalian/kembalikan/' . $peminjaman->id_peminjaman); ?>" method="post">
        <button type="submit" class="px-5 py-2 rounded-full bg-gradient-to-r from-teal-600 to-teal-400 text-white hover:scale-105 transition font-medium">
          <i class="fa-solid fa-check mr-2"></i> Ya, Kembalikan
        </button>
      </form>
    </div>
  </div>
</div>

<!-- Animasi & Script -->
<style>
  .animate-fadeIn {
    animation: fadeIn 0.3s ease-in-out;
  }
  @keyframes fadeIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
  }
</style>

<script>
  function openModalBack() {
    document.getElementById('modalKonfirmasi').classList.remove('hidden');
    document.getElementById('modalKonfirmasi').classList.add('flex');
  }
  function closeModalBack() {
    document.getElementById('modalKonfirmasi').classList.add('hidden');
  }
</script>
