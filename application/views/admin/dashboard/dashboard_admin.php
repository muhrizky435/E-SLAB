<div class="p-4 min-h-screen">

    <!-- Header -->
    <div class="mb-6 text-left">
        <h1 class="text-4xl font-extrabold text-gray-800 flex justify-start items-center gap-3">
            <i class="fa-solid fa-chart-line text-teal-600"></i>
            <span>Dashboard Peminjaman</span>
        </h1>
        <p class="text-gray-500 italic mt-2">Pantau aktivitas peminjaman dengan data real-time dan tampilan interaktif.</p>
    </div>

    <!-- Statistik -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
        <div class="bg-gradient-to-br from-teal-500 to-teal-400 text-white p-6 rounded-2xl shadow-lg hover:shadow-2xl transition">
            <div class="flex justify-between items-center">
                <div>
                    <h2 class="text-lg font-semibold">Sedang Dipinjam</h2>
                    <p class="text-4xl font-extrabold mt-2"><?= $sedang_dipinjam; ?></p>
                </div>
                <i class="fa-solid fa-book-open-reader text-4xl opacity-60"></i>
            </div>
        </div>

        <div class="bg-gradient-to-br from-orange-500 to-yellow-400 text-white p-6 rounded-2xl shadow-lg hover:shadow-2xl transition">
            <div class="flex justify-between items-center">
                <div>
                    <h2 class="text-lg font-semibold">Jatuh Tempo</h2>
                    <p class="text-4xl font-extrabold mt-2"><?= $jatuh_tempo; ?></p>
                </div>
                <i class="fa-solid fa-hourglass-half text-4xl opacity-60"></i>
            </div>
        </div>

        <div class="bg-gradient-to-br from-emerald-500 to-green-400 text-white p-6 rounded-2xl shadow-lg hover:shadow-2xl transition">
            <div class="flex justify-between items-center">
                <div>
                    <h2 class="text-lg font-semibold">Stok Tersedia</h2>
                    <p class="text-4xl font-extrabold mt-2"><?= $tersedia; ?></p>
                </div>
                <i class="fa-solid fa-boxes-stacked text-4xl opacity-60"></i>
            </div>
        </div>
    </div>

    <!-- Grafik -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-10">
        <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition">
            <h3 class="font-bold text-gray-800 mb-4 flex items-center gap-2">
                <i class="fa-solid fa-chart-line text-teal-500"></i> Grafik Peminjaman per Bulan
            </h3>
            <canvas id="chartPeminjaman" height="200"></canvas>
        </div>

        <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition">
            <h3 class="font-bold text-gray-800 mb-4 flex items-center gap-2">
                <i class="fa-solid fa-user-group text-blue-500"></i> Grafik Jumlah Peminjam
            </h3>
            <canvas id="chartOrang" height="200"></canvas>
        </div>
    </div>

    <!-- Konten Utama -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <!-- Verifikasi Peminjaman -->
        <div class="md:col-span-2 bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition">
            <h3 class="font-bold text-gray-800 mb-4 flex items-center gap-2">
                <i class="fa-solid fa-clipboard-check text-teal-500"></i> Verifikasi Peminjaman
            </h3>

            <div class="overflow-x-auto">
                <table class="min-w-full text-sm text-gray-700">
                    <thead class="bg-teal-500 text-white">
                        <tr>
                            <th class="py-3 px-4 text-left">User</th>
                            <th class="py-3 px-4 text-left">Tanggal Pinjam</th>
                            <th class="py-3 px-4 text-center">Status</th>
                            <th class="py-3 px-4 text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <?php if (!empty($peminjaman)): ?>
                            <?php foreach ($peminjaman as $p): ?>
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="px-4 py-3 font-medium"><?= htmlspecialchars($p->peminjam_nama) ?></td>
                                    <td class="px-4 py-3"><?= htmlspecialchars($p->tanggal_pinjam) ?></td>
                                    <td class="px-4 py-3 text-center">
                                        <span class="inline-block px-3 py-1 rounded-full text-xs font-semibold 
                      <?php
                                if ($p->status == 'pending') echo 'bg-yellow-100 text-yellow-700';
                                elseif ($p->status == 'disetujui') echo 'bg-green-100 text-green-700';
                                elseif ($p->status == 'ditolak') echo 'bg-red-100 text-red-700';
                                elseif ($p->status == 'dikembalikan') echo 'bg-blue-100 text-blue-700';
                                else echo 'bg-gray-100 text-gray-700';
                        ?>">
                                            <?= ucfirst($p->status) ?>
                                        </span>
                                    </td>
                                    <td class="px-4 py-3 text-center">
                                        <a href="<?= site_url('adminpeminjaman/detail/' . $p->id_peminjaman) ?>"
                                            class="inline-flex items-center gap-1 bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-lg text-xs transition">
                                            <i class="fa-solid fa-circle-info"></i> Detail
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="4" class="text-center py-4 text-gray-500 italic">
                                    Tidak ada peminjaman yang perlu diverifikasi.
                                </td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Notifikasi -->
        <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition">
            <h3 class="font-bold text-gray-800 mb-4 flex items-center gap-2">
                <i class="fa-solid fa-bell text-yellow-500"></i> Notifikasi
            </h3>

            <?php if (!empty($notifications)): ?>
                <ul class="space-y-3 text-sm">
                    <?php foreach ($notifications as $notif): ?>
                        <li class="flex items-start gap-3 <?= $notif->status == 'belum_dibaca' ? 'font-semibold text-gray-800' : 'text-gray-600'; ?>">
                            <i class="fa-solid fa-circle text-xs mt-1 <?= $notif->status == 'belum_dibaca' ? 'text-blue-500' : 'text-gray-400'; ?>"></i>
                            <span><?= $notif->pesan; ?></span>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <!-- <a href="<?= site_url('notifikasi'); ?>" class="block mt-4 text-sm text-blue-600 hover:underline">
                    <i class="fa-solid fa-eye"></i> Lihat semua notifikasi
                </a> -->
            <?php else: ?>
                <p class="text-gray-500 text-sm italic">Belum ada notifikasi.</p>
            <?php endif; ?>
        </div>
    </div>
</div>


<!-- Chart.js Grafik -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx1 = document.getElementById('chartPeminjaman');
    const ctx2 = document.getElementById('chartOrang');

    new Chart(ctx1, {
        type: 'line',
        data: {
            labels: <?= json_encode($bulan); ?>,
            datasets: [{
                label: 'Jumlah Peminjaman',
                data: <?= json_encode($jumlah_peminjaman); ?>,
                borderColor: '#14B8A6',
                backgroundColor: 'rgba(20,184,166,0.2)',
                tension: 0.3,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1,
                        precision: 0,
                        callback: function(value) {
                            return Number.isInteger(value) ? value : null;
                        }
                    }
                }
            }
        }
    });

    new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: <?= json_encode($bulan); ?>,
            datasets: [{
                label: 'Jumlah Orang Meminjam',
                data: <?= json_encode($jumlah_orang); ?>,
                backgroundColor: '#387ddeff'
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1,
                        precision: 0,
                        callback: function(value) {
                            return Number.isInteger(value) ? value : null;
                        }
                    }
                }
            }
        }
    });
</script>