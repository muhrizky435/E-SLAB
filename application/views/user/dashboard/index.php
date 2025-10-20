<!-- Dashboard Statistik -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
  <!-- Card Sedang Dipinjam -->
  <div class="bg-gradient-to-r from-teal-200 to-white shadow-md rounded-2xl p-6 border border-teal-100 hover:shadow-lg transition duration-300">
    <div class="flex items-center justify-between">
      <div>
        <h2 class="text-gray-600 font-semibold flex items-center gap-2">
          <i class="fas fa-book-open text-teal-500"></i> Sedang Dipinjam
        </h2>
        <p class="text-4xl font-extrabold text-gray-800 mt-2"><?= $sedang_dipinjam; ?></p>
      </div>
      <div class="bg-teal-100 text-teal-600 p-3 rounded-full">
        <i class="fas fa-hand-holding text-2xl"></i>
      </div>
    </div>
  </div>

  <!-- Card Jatuh Tempo -->
  <div class="bg-gradient-to-r from-orange-200 to-white shadow-md rounded-2xl p-6 border border-orange-100 hover:shadow-lg transition duration-300">
    <div class="flex items-center justify-between">
      <div>
        <h2 class="text-gray-600 font-semibold flex items-center gap-2">
          <i class="fas fa-exclamation-triangle text-orange-500"></i> Jatuh Tempo
        </h2>
        <p class="text-4xl font-extrabold text-gray-800 mt-2"><?= $jatuh_tempo; ?></p>
      </div>
      <div class="bg-orange-100 text-orange-600 p-3 rounded-full">
        <i class="fas fa-clock text-2xl"></i>
      </div>
    </div>
  </div>

  <!-- Card Tersedia -->
  <div class="bg-gradient-to-r from-green-200 to-white shadow-md rounded-2xl p-6 border border-green-100 hover:shadow-lg transition duration-300">
    <div class="flex items-center justify-between">
      <div>
        <h2 class="text-gray-600 font-semibold flex items-center gap-2">
          <i class="fas fa-check-circle text-teal-500"></i> Tersedia
        </h2>
        <p class="text-4xl font-extrabold text-gray-800 mt-2"><?= $tersedia; ?></p>
      </div>
      <div class="bg-green-100 text-teal-600 p-3 rounded-full">
        <i class="fas fa-box-open text-2xl"></i>
      </div>
    </div>
  </div>
</div>

<!-- Konten Utama -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
  <!-- Peminjaman Terbaru -->
  <div class="md:col-span-2 bg-white shadow-md rounded-2xl p-6 border border-gray-100 overflow-x-auto">
    <h3 class="font-bold text-lg mb-4 flex items-center gap-2 text-gray-800">
      <i class="fas fa-clipboard-list text-teal-500"></i> Peminjaman Terbaru
    </h3>

    <table class="w-full text-left text-sm border-collapse">
      <thead>
        <tr class="bg-teal-50 text-gray-700 border-b">
          <th class="py-3 px-4 font-semibold">Kode</th>
          <th class="py-3 px-4 font-semibold">Status</th>
          <th class="py-3 px-4 font-semibold">Tanggal Pinjam</th>
          <th class="py-3 px-4 font-semibold">Tanggal Kembali</th>
        </tr>
      </thead>
      <tbody>
        <?php if (!empty($recent_borrowings)): ?>
          <?php foreach ($recent_borrowings as $row): ?>
            <tr class="border-b hover:bg-gray-50 transition duration-200">
              <td class="py-3 px-4 font-medium text-gray-700"><?= $row->kode_peminjaman; ?></td>
              <td class="py-3 px-4">
                <?php if ($row->status == 'pending'): ?>
                  <span class="px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-700">
                    <i class="fas fa-hourglass-half mr-1"></i> Menunggu
                  </span>
                <?php elseif ($row->status == 'disetujui'): ?>
                  <span class="px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-700">
                    <i class="fas fa-book mr-1"></i> Dipinjam
                  </span>
                <?php elseif ($row->status == 'ditolak'): ?>
                  <span class="px-3 py-1 rounded-full text-xs font-semibold bg-red-100 text-red-700">
                    <i class="fas fa-times mr-1"></i> Ditolak
                  </span>
                <?php elseif ($row->status == 'dikembalikan'): ?>
                  <span class="px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">
                    <i class="fas fa-check mr-1"></i> Dikembalikan
                  </span>
                <?php else: ?>
                  <span class="px-3 py-1 rounded-full text-xs font-semibold bg-gray-100 text-gray-700">Tidak Diketahui</span>
                <?php endif; ?>
              </td>
              <td class="py-3 px-4 text-gray-600"><?= date('d M Y', strtotime($row->tanggal_pinjam)); ?></td>
              <td class="py-3 px-4">
                <?php
                $today = date('Y-m-d');
                if ($row->status == 'dikembalikan' && !empty($row->tanggal_dikembalikan)): ?>
                  <div class="flex flex-col text-green-700">
                    <span class="font-semibold"><?= date('d M Y', strtotime($row->tanggal_dikembalikan)); ?></span>
                    <span class="text-xs italic">Sudah dikembalikan</span>
                  </div>
                <?php elseif ($row->status == 'disetujui' && !empty($row->tanggal_kembali)): ?>
                  <?php if ($today < $row->tanggal_kembali): ?>
                    <div class="flex flex-col text-blue-700">
                      <span class="font-semibold"><?= date('d M Y', strtotime($row->tanggal_kembali)); ?></span>
                      <span class="text-xs italic">Masih dipinjam</span>
                    </div>
                  <?php else: ?>
                    <div class="flex flex-col text-orange-700">
                      <span class="font-semibold"><?= date('d M Y', strtotime($row->tanggal_kembali)); ?></span>
                      <span class="text-xs italic">Jatuh tempo</span>
                    </div>
                  <?php endif; ?>
                <?php elseif ($row->status == 'pending'): ?>
                  <span class="text-gray-500 italic">Menunggu persetujuan</span>
                <?php elseif ($row->status == 'ditolak'): ?>
                  <span class="text-red-500 italic">Tidak berlaku</span>
                <?php else: ?>
                  <span class="text-gray-500 italic">-</span>
                <?php endif; ?>
              </td>
            </tr>
          <?php endforeach; ?>
        <?php else: ?>
          <tr>
            <td colspan="4" class="py-3 px-4 text-center text-gray-500 italic">Belum ada peminjaman</td>
          </tr>
        <?php endif; ?>
      </tbody>
    </table>
  </div>

  <!-- Notifikasi -->
  <div class="bg-white shadow-md rounded-2xl p-6 border border-gray-100">
    <h3 class="font-bold text-lg mb-4 flex items-center gap-2 text-gray-800">
      <i class="fas fa-bell text-teal-500"></i> Notifikasi
    </h3>

    <?php if (!empty($notifications)): ?>
      <ul class="text-sm space-y-3">
        <?php foreach ($notifications as $notif): ?>
          <li class="flex items-start gap-2 <?= $notif->status == 'belum_dibaca' ? 'font-semibold' : 'text-gray-600'; ?>">
            <i class="fas fa-circle text-xs mt-1 <?= $notif->status == 'belum_dibaca' ? 'text-teal-500' : 'text-gray-400'; ?>"></i>
            <span><?= $notif->pesan; ?></span>
          </li>
        <?php endforeach; ?>
      </ul>

      <a href="<?= site_url('notifikasi'); ?>" class="block mt-5 text-teal-600 text-sm hover:scale-105 hover:underline text-center md:text-left">
        <i class="fas fa-arrow-right mr-1"></i> Lihat semua notifikasi
      </a>
    <?php else: ?>
      <p class="text-sm text-gray-500 italic">Belum ada notifikasi.</p>
    <?php endif; ?>
  </div>
</div>
