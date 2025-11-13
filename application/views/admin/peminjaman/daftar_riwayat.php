<div class="min-h-screen p-6">
    <div class="max-w-7xl mx-auto space-y-6">
        <!-- Header Card -->
        <div class="bg-white/90 backdrop-blur-md rounded-2xl shadow-lg p-6 md:p-8 border border-gray-100">
            <div class="flex flex-col md:flex-row md:items-start md:justify-between gap-8">

                <!-- Left Section (Title + Description) -->
                <div class="flex items-start gap-4">
                    <div class="bg-cyan-100 text-cyan-600 p-3 rounded-xl flex items-center justify-center text-3xl shadow-sm">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                    <div>
                        <h1 class="text-2xl font-extrabold text-gray-900 tracking-tight">
                            Daftar Riwayat Peminjaman
                        </h1>
                        <p class="text-gray-600 mt-2 text-sm md:text-base leading-relaxed">
                            <i class="fas fa-filter text-cyan-500 mr-1"></i>
                            Filter berdasarkan <span class="font-semibold text-cyan-600">bulan & tahun</span> untuk menampilkan riwayat peminjaman alat dan bahan laboratorium.
                        </p>
                    </div>
                </div>

                <!-- Right Section (Filter + Export Buttons) -->
                <div class="flex flex-col items-start md:items-end gap-3 w-full md:w-auto">

                    <!-- Filter Form -->
                    <form id="filterForm" method="get"
                        class="flex flex-wrap md:flex-nowrap items-center gap-3 bg-gray-50 p-3 rounded-xl border border-gray-200 shadow-sm w-full md:w-auto justify-start md:justify-end">

                        <!-- Dropdown bulan -->
                        <select name="month"
                            class="border border-gray-300 rounded-lg px-3 py-2 bg-white focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 text-sm w-full md:w-auto">
                            <?php for ($m = 1; $m <= 12; $m++): $sel = ($m == $filter_month) ? 'selected' : ''; ?>
                                <option value="<?= str_pad($m, 2, '0', STR_PAD_LEFT) ?>" <?= $sel ?>>
                                    <?= date('F', mktime(0, 0, 0, $m, 1)) ?>
                                </option>
                            <?php endfor; ?>
                        </select>

                        <!-- Dropdown tahun -->
                        <select name="year"
                            class="border border-gray-300 rounded-lg px-3 py-2 bg-white focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 text-sm w-full md:w-auto">
                            <?php $start = date('Y') - 2;
                            $end = date('Y') + 1;
                            for ($y = $start; $y <= $end; $y++): $sy = ($y == $filter_year) ? 'selected' : ''; ?>
                                <option value="<?= $y ?>" <?= $sy ?>><?= $y ?></option>
                            <?php endfor; ?>
                        </select>

                        <!-- Tombol Terapkan -->
                        <button type="submit"
                            class="inline-flex items-center gap-2 bg-gradient-to-r from-yellow-400 to-yellow-500 hover:scale-105 text-white px-4 py-2 rounded-lg text-sm font-semibold shadow transition-all duration-200 w-full md:w-auto justify-center">
                            <i class="fas fa-check-circle"></i> Terapkan
                        </button>
                    </form>

                    <!-- Tombol Export di bawah -->
                    <a href="<?= site_url('admin/daftarRiwayat/export') . '?month=' . sprintf('%02d', $filter_month) . '&year=' . $filter_year ?>"
                        class="inline-flex items-center gap-2 bg-gradient-to-r from-teal-400 to-cyan-500 hover:scale-105 text-white px-4 py-2 rounded-lg text-sm font-semibold shadow transition-all duration-200 w-full md:w-auto justify-center">
                        <i class="fas fa-file-excel"></i> Export Excel
                    </a>
                </div>
            </div>
        </div>


        <!-- Table Card -->
        <div class="bg-white rounded-2xl shadow-lg border border-gray-100 overflow-hidden">
            <div class="overflow-x-auto">
                <table class="min-w-full table-auto text-sm text-left">
                    <thead class="bg-gradient-to-r from-cyan-100 to-blue-100 text-gray-700 text-xs uppercase font-semibold border-b border-gray-200 sticky top-0">
                        <tr>
                            <th class="px-4 py-3">No</th>
                            <th class="px-4 py-3">Tanggal</th>
                            <th class="px-4 py-3">Kode</th>
                            <th class="px-4 py-3">Peminjam</th>
                            <th class="px-4 py-3">Items (qty)</th>
                            <th class="px-4 py-3">Sisa Stok</th>
                            <th class="px-4 py-3">Status</th>
                            <th class="px-4 py-3">Aksi</th>
                        </tr>
                    </thead>

                    <tbody class="divide-y divide-gray-100 text-gray-700">
                        <?php if (empty($peminjaman_list)): ?>
                            <tr>
                                <td colspan="8" class="px-4 py-6 text-center text-gray-500">
                                    Tidak ada data pada bulan ini.
                                </td>
                            </tr>
                            <?php else: $i = 1;
                            foreach ($peminjaman_list as $row): ?>
                                <tr class="hover:bg-cyan-50/60 transition-colors duration-200">
                                    <td class="px-4 py-3"><?= $i++ ?></td>
                                    <td class="px-4 py-3"><?= htmlspecialchars($row->tanggal_pinjam) ?></td>
                                    <td class="px-4 py-3 font-semibold text-gray-800"><?= htmlspecialchars($row->kode_peminjaman) ?></td>
                                    <td class="px-4 py-3"><?= htmlspecialchars($row->nama_peminjam) ?></td>

                                    <!-- Items -->
                                    <td class="px-4 py-3">
                                        <?php
                                        $items = [];
                                        if (!empty($row->items)) {
                                            $parts = explode(';;', $row->items);
                                            foreach ($parts as $p) {
                                                list($name, $qty, $satuan, $id) = explode('|', $p);
                                                $items[] = "<div class='mb-2'><div class='font-medium text-gray-800'>" . htmlspecialchars($name) . "</div><div class='text-sm text-gray-500'>{$qty} {$satuan}</div></div>";
                                            }
                                        }
                                        echo implode('', $items);
                                        ?>
                                    </td>

                                    <!-- Stok -->
                                    <td class="px-4 py-3">
                                        <?php
                                        $stocks = [];
                                        if (!empty($row->items)) {
                                            foreach ($parts as $p) {
                                                list($name, $qty, $satuan, $id) = explode('|', $p);
                                                $stok = isset($stock_map[$id]) ? (int)$stock_map[$id] : '-';
                                                $stocks[] = "<div class='text-sm text-gray-700 mb-1'>{$stok}</div>";
                                            }
                                        }
                                        echo implode('', $stocks);
                                        ?>
                                    </td>

                                    <!-- Status -->
                                    <td class="px-4 py-3">
                                        <?php
                                        $status = strtolower($row->status);
                                        $badge = [
                                            'pending' => 'bg-yellow-100 text-yellow-800',
                                            'disetujui' => 'bg-blue-100 text-blue-800',
                                            'dikembalikan' => 'bg-green-100 text-green-800',
                                            'ditolak' => 'bg-red-100 text-red-800'
                                        ];
                                        $cls = isset($badge[$status]) ? $badge[$status] : 'bg-gray-100 text-gray-800';
                                        ?>
                                        <span class="inline-block px-3 py-1 rounded-full text-xs font-semibold <?= $cls ?>">
                                            <?= ucfirst($status) ?>
                                        </span>
                                    </td>

                                    <td class="px-4 py-3">
                                        <a href="<?= site_url('adminpeminjaman/detail/' . $row->id_peminjaman) ?>"
                                            class="text-cyan-600 hover:text-cyan-700 hover:underline font-medium transition">
                                            Detail
                                        </a>
                                    </td>
                                </tr>
                        <?php endforeach;
                        endif; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Footer Info -->
        <div class="text-sm text-gray-500 text-center pt-4">
            Menampilkan data bulan
            <strong class="text-gray-800"><?= date('F', mktime(0, 0, 0, $filter_month, 1)) ?> <?= $filter_year ?></strong>
        </div>
    </div>
</div>