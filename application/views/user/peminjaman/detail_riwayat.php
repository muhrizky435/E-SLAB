<div class="max-w-6xl mx-auto px-4">
  <!-- Header -->
  <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-8 gap-4">
    <div>
      <h2 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
        <i class="fa-solid fa-clock-rotate-left text-teal-500"></i>
        Detail Riwayat Peminjaman
      </h2>
      <p class="text-gray-500 text-md mt-1">“Pantau seluruh aktivitas peminjaman Anda di sini“</p>
    </div>

    <a href="<?= site_url('dashboard'); ?>"
       class="bg-gradient-to-r from-gray-100 to-gray-200 hover:from-blue-100 hover:to-blue-200 text-blue-700 font-medium px-4 py-2 rounded-xl flex items-center gap-2 shadow-sm hover:shadow transition">
      <i class="fa-solid fa-arrow-left"></i> Kembali
    </a>
  </div>

  <!-- Card Informasi Utama -->
  <div class="bg-white shadow-xl rounded-2xl border border-gray-100 p-6 mb-8">
    <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
      <i class="fas fa-info-circle text-teal-500"></i> Informasi Peminjaman
    </h3>

    <div class="grid md:grid-cols-2 gap-6">
      <div class="space-y-2">
        <p class="text-sm text-gray-500">Kode Peminjaman</p>
        <p class="font-semibold text-gray-900 text-base"><?= $peminjaman->kode_peminjaman; ?></p>
      </div>

      <div class="space-y-2">
        <p class="text-sm text-gray-500">Tanggal Pinjam</p>
        <p class="font-semibold text-gray-900 text-base">
          <i class="fas fa-calendar-alt text-teal-500 mr-1"></i>
          <?= date('d M Y', strtotime($peminjaman->tanggal_pinjam)); ?>
        </p>
      </div>

      <div class="space-y-2">
        <p class="text-sm text-gray-500">Status</p>
        <?php
          $status = $peminjaman->status;
          $statusClass = [
            'pending' => 'bg-yellow-100 text-yellow-800',
            'disetujui' => 'bg-blue-100 text-blue-800',
            'ditolak' => 'bg-red-100 text-red-800',
            'dikembalikan' => 'bg-green-100 text-green-800',
          ][$status] ?? 'bg-gray-200 text-gray-600';
          $statusLabel = ucfirst($status);
        ?>
        <p class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-sm font-semibold <?= $statusClass; ?>">
          <?php if ($status == 'pending'): ?>
            <i class="fas fa-clock"></i>
          <?php elseif ($status == 'dipinjam'): ?>
            <i class="fas fa-book-reader"></i>
          <?php else: ?>
            <i class="fas fa-check-circle"></i>
          <?php endif; ?>
          <?= $statusLabel; ?>
        </p>
      </div>

      <div class="space-y-2">
        <p class="text-sm text-gray-500">Tanggal Kembali</p>
        <p class="font-semibold text-gray-800">
          <?= !empty($peminjaman->tanggal_kembali) ? date('d M Y', strtotime($peminjaman->tanggal_kembali)) : '-'; ?>
        </p>
      </div>

      <div class="space-y-2">
        <p class="text-sm text-gray-500">Nama Peminjam</p>
        <p class="font-semibold text-gray-800 flex items-center gap-2">
          <i class="fas fa-user text-teal-500"></i> <?= $peminjaman->nama_peminjam ?? 'Tidak diketahui'; ?>
        </p>
      </div>

      <div class="space-y-2">
        <p class="text-sm text-gray-500">Jurusan</p>
        <p class="font-semibold text-gray-800 flex items-center gap-2">
          <i class="fas fa-graduation-cap text-teal-500"></i> <?= $peminjaman->jurusan ?? '-'; ?>
        </p>
      </div>

      <div class="space-y-2">
        <p class="text-sm text-gray-500">Kelas</p>
        <p class="font-semibold text-gray-800 flex items-center gap-2">
          <i class="fas fa-users text-teal-500"></i> <?= $peminjaman->kelas ?? '-'; ?>
        </p>
      </div>

      <div class="space-y-2">
        <p class="text-sm text-gray-500">No. HP</p>
        <p class="font-semibold text-gray-800 flex items-center gap-2">
          <i class="fas fa-phone text-teal-500"></i> <?= $peminjaman->no_hp ?? '-'; ?>
        </p>
      </div>

      <div class="space-y-2 md:col-span-2">
        <p class="text-sm text-gray-500">Catatan</p>
        <p class="font-semibold text-gray-800"><?= $peminjaman->keterangan ?: '-'; ?></p>
      </div>
    </div>
  </div>

  <!-- Daftar Barang -->
  <div class="bg-white shadow-lg rounded-2xl border border-gray-100 p-6">
    <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
      <i class="fas fa-box-open text-teal-500"></i> Daftar Barang Dipinjam
    </h3>

    <div class="overflow-x-auto">
      <table class="min-w-full text-sm border border-gray-200 rounded-xl overflow-hidden">
        <thead class="bg-gradient-to-r from-teal-50 to-teal-100 text-gray-700">
          <tr>
            <th class="px-5 py-3 text-left font-semibold">Nama Barang</th>
            <th class="px-5 py-3 text-center font-semibold">Jumlah</th>
            <th class="px-5 py-3 text-left font-semibold">Satuan</th>
            <th class="px-5 py-3 text-left font-semibold">Kondisi</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100">
          <?php foreach ($detail as $d): ?>
          <tr class="hover:bg-blue-50 transition">
            <td class="px-5 py-3 font-medium text-gray-900"><?= $d->nama_barang; ?></td>
            <td class="px-5 py-3 text-center"><?= $d->qty; ?></td>
            <td class="px-5 py-3"><?= $d->satuan; ?></td>
            <td class="px-5 py-3"><?= $d->kondisi ?? 'Baik'; ?></td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Informasi Tambahan -->
  <div class="grid md:grid-cols-2 gap-6 mt-8">
    <div class="bg-blue-100 border border-blue-300 rounded-2xl p-5">
      <h4 class="font-semibold text-blue-700 mb-2 flex items-center gap-2">
        <i class="fas fa-info-circle"></i> Informasi Tambahan
      </h4>
      <p class="text-gray-600 text-sm leading-relaxed">
        Harap memastikan semua barang yang dipinjam dikembalikan dalam kondisi baik.
        Jika terdapat kerusakan, segera laporkan ke petugas laboratorium.
      </p>
    </div>

    <div class="bg-green-100 border border-green-300 rounded-2xl p-5">
      <h4 class="font-semibold text-green-700 mb-2 flex items-center gap-2">
        <i class="fas fa-lightbulb"></i> Tips
      </h4>
      <ul class="list-disc list-inside text-gray-600 text-sm space-y-1">
        <li>Periksa barang sebelum dan sesudah peminjaman.</li>
        <li>Gunakan alat sesuai dengan petunjuk keselamatan laboratorium.</li>
        <li>Hubungi admin jika ingin memperpanjang waktu peminjaman.</li>
      </ul>
    </div>
  </div>
</div>
