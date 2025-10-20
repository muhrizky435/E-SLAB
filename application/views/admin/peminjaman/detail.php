<div class="p-4 md:p-8 min-h-screen">
  <!-- Header -->
  <div class="flex flex-col md:flex-row items-start md:items-center justify-between mb-8 gap-3">
     <div>
      <h3 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
        <i class="fa-solid fa-clipboard-list text-teal-500"></i>
        Detail Peminjaman
      </h3>
      <p class="text-gray-500 mt-1 text-sm">“Informasi lengkap mengenai peminjaman dan pengembalian alat dan bahan kesehatan.”</p>
    </div>
    <div class="flex items-center gap-3">
      <a href="<?= site_url('dashboard'); ?>"
        class="bg-gradient-to-r from-gray-100 to-gray-200 hover:from-blue-100 hover:to-blue-200 text-blue-700 font-medium px-4 py-2 rounded-xl flex items-center gap-2 shadow-sm hover:shadow transition">
        <i class="fa-solid fa-arrow-left"></i> Kembali
      </a>
      <?php if ($peminjaman->status == 'disetujui'): ?>
        <a href="<?= site_url('adminpengembalian/form/' . $peminjaman->id_peminjaman) ?>"
          class="bg-teal-500 hover:bg-teal-600 text-white font-semibold px-4 py-2 rounded-lg flex items-center gap-2 transition">
          <i class="fa-solid fa-rotate-left"></i> Kembalikan
        </a>
      <?php endif; ?>
    </div>
  </div>

  <!-- Card Info -->
  <div class="bg-white rounded-2xl shadow-lg p-6 mb-8 border border-gray-100">
    <h4 class="font-bold text-lg text-gray-800 mb-4 flex items-center gap-2">
      <i class="fa-solid fa-user text-teal-500"></i> Informasi Peminjaman
    </h4>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div class="space-y-2">
        <div><span class="font-semibold text-gray-700">Kode Peminjaman:</span> <?= htmlspecialchars($peminjaman->kode_peminjaman ?? '-') ?></div>
        <div><span class="font-semibold text-gray-700">Nama Peminjam:</span> <?= htmlspecialchars($peminjaman->nama_peminjam ?? '-') ?></div>
        <div><span class="font-semibold text-gray-700">Jurusan:</span> <?= htmlspecialchars($peminjaman->jurusan ?? '-') ?></div>
        <div><span class="font-semibold text-gray-700">Kelas:</span> <?= htmlspecialchars($peminjaman->kelas ?? '-') ?></div>
        <div><span class="font-semibold text-gray-700">No. HP:</span> <?= htmlspecialchars($peminjaman->no_hp ?? '-') ?></div>
      </div>

      <div class="space-y-2">
        <div><span class="font-semibold text-gray-700">Tujuan:</span> <?= htmlspecialchars($peminjaman->tujuan ?? '-') ?></div>
        <div><span class="font-semibold text-gray-700">Tanggal Pinjam:</span> <?= htmlspecialchars($peminjaman->tanggal_pinjam ?? '-') ?></div>
        <div><span class="font-semibold text-gray-700">Tanggal Kembali:</span> <?= htmlspecialchars($peminjaman->tanggal_kembali ?? '-') ?></div>
        <div>
          <span class="font-semibold text-gray-700">Status:</span>
          <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium
            <?php
            if ($peminjaman->status == 'pending') echo 'bg-yellow-100 text-yellow-700';
            elseif ($peminjaman->status == 'disetujui') echo 'bg-green-100 text-green-700';
            elseif ($peminjaman->status == 'ditolak') echo 'bg-red-100 text-red-700';
            elseif ($peminjaman->status == 'dikembalikan') echo 'bg-blue-100 text-blue-700';
            else echo 'bg-gray-100 text-gray-700';
            ?>">
            <i class="fa-solid fa-circle-info mr-1"></i><?= ucfirst($peminjaman->status) ?>
          </span>
        </div>
        <div><span class="font-semibold text-gray-700">Catatan User:</span> <?= htmlspecialchars($peminjaman->keterangan ?? '-') ?></div>
      </div>
    </div>
  </div>

  <!-- Daftar Barang -->
  <div class="bg-white rounded-2xl shadow-md border border-gray-100 mb-8">
    <div class="p-4 border-b bg-gradient-to-r from-teal-600 to-teal-400 text-white rounded-t-2xl flex items-center gap-2">
      <i class="fa-solid fa-boxes-stacked"></i>
      <h4 class="font-semibold text-lg">Daftar Barang / Bahan</h4>
    </div>
    <div class="overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr class="text-gray-600 text-sm uppercase tracking-wide">
            <th class="px-6 py-3 text-left font-semibold">Nama Barang</th>
            <th class="px-6 py-3 text-center font-semibold">Jumlah</th>
            <th class="px-6 py-3 text-center font-semibold">Satuan</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100">
          <?php foreach ($detail as $item): ?>
            <tr class="hover:bg-teal-50 transition">
              <td class="px-6 py-3"><?= htmlspecialchars($item->nama_barang) ?></td>
              <td class="px-6 py-3 text-center"><?= htmlspecialchars($item->qty) ?></td>
              <td class="px-6 py-3 text-center"><?= htmlspecialchars($item->satuan ?? '-') ?></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Form Verifikasi -->
  <?php if ($peminjaman->status == 'pending'): ?>
    <div class="bg-white p-6 rounded-2xl shadow-md border border-gray-100 mb-8">
      <h4 class="font-semibold mb-4 flex items-center gap-2 text-gray-700 text-lg">
        <i class="fa-solid fa-user-shield text-teal-600"></i> Verifikasi Admin
      </h4>
      <div class="flex flex-col md:flex-row gap-4">
        <form action="<?= site_url('adminpeminjaman/setujui/' . $peminjaman->id_peminjaman) ?>" method="post" class="flex-1 flex gap-2">
          <input type="text" name="catatan" placeholder="Catatan admin (opsional)"
            class="border border-gray-300 rounded-lg px-3 py-2 w-full focus:ring-2 focus:ring-teal-400 focus:border-teal-400">
          <button type="submit"
            class="bg-gradient-to-r from-teal-600 to-teal-400 hover:scale-105 text-white px-4 py-2 rounded-lg font-semibold flex items-center gap-2 transition">
            <i class="fa-solid fa-check"></i> Setujui
          </button>
        </form>
        <form action="<?= site_url('adminpeminjaman/tolak/' . $peminjaman->id_peminjaman) ?>" method="post" class="flex-1 flex gap-2">
          <input type="text" name="catatan" placeholder="Catatan admin (opsional)"
            class="border border-gray-300 rounded-lg px-3 py-2 w-full focus:ring-2 focus:ring-red-400 focus:border-red-400">
          <button type="submit"
            class="bg-gradient-to-r from-red-600 to-red-400 hover:scale-105 text-white px-4 py-2 rounded-lg font-semibold flex items-center gap-2 transition">
            <i class="fa-solid fa-xmark"></i> Tolak
          </button>
        </form>
      </div>
    </div>
  <?php endif; ?>

  <!-- Log Verifikasi -->
  <?php if (!empty($log)): ?>
    <div class="bg-white rounded-2xl shadow-md border border-gray-100">
      <div class="p-4 border-b bg-gradient-to-r from-gray-200 to-gray-100 rounded-t-2xl flex items-center gap-2">
        <i class="fa-solid fa-clock-rotate-left text-gray-600"></i>
        <h4 class="font-semibold text-gray-700">Log Verifikasi</h4>
      </div>
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr class="text-gray-600 text-sm uppercase tracking-wide">
              <th class="px-6 py-3 text-left font-semibold">Tanggal</th>
              <th class="px-6 py-3 text-left font-semibold">Admin</th>
              <th class="px-6 py-3 text-left font-semibold">Aksi</th>
              <th class="px-6 py-3 text-left font-semibold">Catatan</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-100">
            <?php foreach ($log as $l): ?>
              <tr class="hover:bg-gray-50 transition">
                <td class="px-6 py-3"><?= htmlspecialchars($l->created_at) ?></td>
                <td class="px-6 py-3"><?= htmlspecialchars($l->id_admin) ?></td>
                <td class="px-6 py-3"><?= htmlspecialchars(ucfirst($l->aksi)) ?></td>
                <td class="px-6 py-3"><?= htmlspecialchars($l->catatan ?? '-') ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
  <?php endif; ?>
</div>