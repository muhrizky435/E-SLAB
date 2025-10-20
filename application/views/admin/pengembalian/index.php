<div class="p-4 min-h-screen">
    <!-- Judul Halaman -->
    <div class="text-center md:text-left mb-10">
        <h1 class="text-2xl md:text-3xl font-extrabold text-gray-800 flex items-center justify-center md:justify-start gap-3">
            <i class="fas fa-undo text-teal-600"></i> Daftar Pengembalian
        </h1>
        <p class="italic text-gray-600 mt-2 text-sm md:text-base">
            “Kelola dan verifikasi pengembalian alat dan bahan dengan mudah dan efisien.”
        </p>
    </div>

    <!-- Flash Message -->
    <?php if ($this->session->flashdata('success')): ?>
        <div id="successModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-40 z-50">
            <div class="bg-white p-6 rounded-2xl shadow-2xl text-center w-80 animate-fade-in">
                <h3 class="text-lg font-semibold text-green-600 mb-2">Berhasil!</h3>
                <p class="text-gray-700"><?= $this->session->flashdata('success'); ?></p>
                <button onclick="closeModalPengembalian('successModal')" class="mt-4 bg-gradient-to-r from-teal-600 to-teal-400 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">Tutup</button>
            </div>
        </div>
    <?php endif; ?>

    <?php if ($this->session->flashdata('error')): ?>
        <div id="errorModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-40 z-50">
            <div class="bg-white p-6 rounded-2xl shadow-2xl text-center w-80 animate-fade-in">
                <h3 class="text-lg font-semibold text-red-600 mb-2">Gagal!</h3>
                <p class="text-gray-700"><?= $this->session->flashdata('error'); ?></p>
                <button onclick="closeModalPengembalian('errorModal')" class="mt-4 bg-gradient-to-r from-red-600 to-red-400 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition">Tutup</button>
            </div>
        </div>
    <?php endif; ?>

    <!-- Tabel Data -->
    <div class="overflow-x-auto bg-white shadow-lg rounded-2xl border border-gray-200">
        <table class="min-w-full text-sm text-gray-700">
            <thead class="bg-gradient-to-r from-teal-600 to-teal-400 text-white">
                <tr>
                    <th class="px-5 py-3 text-left">No</th>
                    <th class="px-5 py-3 text-left">Kode Peminjaman</th>
                    <th class="px-5 py-3 text-left">Nama Peminjam</th>
                    <th class="px-5 py-3 text-left">Tanggal Pinjam</th>
                    <th class="px-5 py-3 text-left">Tanggal Kembali</th>
                    <th class="px-5 py-3 text-center">Status</th>
                    <th class="px-5 py-3 text-center">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <?php if (!empty($peminjaman)): ?>
                    <?php $no = 1;
                    foreach ($peminjaman as $item): ?>
                        <tr class="hover:bg-teal-50 transition">
                            <td class="px-5 py-3"><?= $no++; ?></td>
                            <td class="px-5 py-3 font-semibold"><?= htmlspecialchars($item->kode_peminjaman); ?></td>
                            <td class="px-5 py-3"><?= htmlspecialchars($item->nama_peminjam); ?></td>
                            <td class="px-5 py-3"><?= date('d-m-Y', strtotime($item->tanggal_pinjam)); ?></td>
                            <td class="px-5 py-3"><?= date('d-m-Y', strtotime($item->tanggal_kembali)); ?></td>
                            <td class="px-5 py-3 text-center">
                                <span class="px-3 py-1 rounded-full text-xs font-medium <?= $item->status === 'disetujui'
                                                                                            ? 'bg-green-100 text-green-700'
                                                                                            : ($item->status === 'dikembalikan'
                                                                                                ? 'bg-blue-100 text-blue-700'
                                                                                                : 'bg-gray-100 text-gray-700'); ?>">
                                    <?= ucfirst($item->status); ?>
                                </span>
                            </td>

                            <!-- Tombol Aksi -->
                            <td class="px-5 py-3 text-center relative">
                                <!-- Tombol titik tiga -->
                                <button onclick="toggleDropdown(event, 'dropdown-<?= $item->id_peminjaman; ?>')"
                                    class="p-2 rounded-full bg-gray-100 hover:bg-teal-400 transition relative z-10">
                                    <i class="fas fa-ellipsis-v text-gray-600"></i>
                                </button>

                                <!-- Dropdown Menu -->
                                <div id="dropdown-<?= $item->id_peminjaman; ?>"
                                    class="hidden absolute top-1 right-full mr-2 w-44 bg-white rounded-xl shadow-xl border border-teal-200 z-50 animate-fade-in">
                                    <a href="<?= site_url('admin/pengembalian/detail/' . $item->id_peminjaman); ?>"
                                        class="block px-4 py-2 text-left rounded-xl text-gray-700 hover:bg-blue-200">
                                        <i class="fas fa-info-circle text-blue-500 mr-2"></i> Detail
                                    </a>

                                    <?php if ($item->status === 'disetujui'): ?>
                                        <button onclick="openKembalikanModal('<?= $item->id_peminjaman; ?>')"
                                            class="block w-full text-left rounded-xl px-4 py-2 text-gray-700 hover:bg-green-200">
                                            <i class="fas fa-undo text-green-500 mr-2"></i> Kembalikan
                                        </button>
                                    <?php endif; ?>

                                    <a href="<?= site_url('admin/pengembalian/hapus/' . $item->id_peminjaman); ?>"
                                        onclick="return confirm('Yakin ingin menghapus data ini?')"
                                        class="block px-4 py-2 text-left rounded-xl text-gray-700 hover:bg-red-200">
                                        <i class="fas fa-trash-alt text-red-500 mr-2"></i> Hapus
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="7" class="text-center py-6 text-gray-500">Tidak ada data peminjaman yang disetujui.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <!-- Modal Konfirmasi Kembalikan -->
    <div id="modalKembalikan" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div class="bg-white rounded-2xl shadow-2xl p-6 w-96 text-center animate-fade-in">
            <i class="fas fa-undo text-4xl text-teal-600 mb-3"></i>
            <h2 class="text-lg font-bold mb-2 text-gray-800">Konfirmasi Pengembalian</h2>
            <p class="text-gray-600 mb-5">Apakah Anda yakin ingin menandai peminjaman ini sudah dikembalikan?</p>
            <div class="flex justify-center gap-4">
                <button onclick="closeModalPengembalian('modalKembalikan')"
                    class="px-4 py-2 rounded-lg bg-gray-300 text-gray-800 hover:bg-gray-400 transition">Batal</button>
                <a id="confirmKembalikanLink" href="#"
                    class="px-4 py-2 rounded-lg bg-green-600 text-white hover:bg-green-700 transition">Ya, Kembalikan</a>
            </div>
        </div>
    </div>

    <script>
        function toggleDropdown(event, id) {
            event.stopPropagation();
            const dropdown = document.getElementById(id);
            const isHidden = dropdown.classList.contains('hidden');

            // Tutup semua dropdown terlebih dahulu
            document.querySelectorAll('[id^="dropdown-"]').forEach(el => el.classList.add('hidden'));

            // Jika dropdown sebelumnya tertutup, buka
            if (isHidden) dropdown.classList.remove('hidden');
        }

        // Tutup dropdown otomatis ketika klik di luar
        document.addEventListener('click', function(e) {
            document.querySelectorAll('[id^="dropdown-"]').forEach(dropdown => {
                if (!dropdown.contains(e.target)) dropdown.classList.add('hidden');
            });
        });

        // Modal pengembalian
        function openKembalikanModal(id) {
            const modal = document.getElementById('modalKembalikan');
            const confirmBtn = document.getElementById('confirmKembalikanLink');
            confirmBtn.href = '<?= site_url("admin/pengembalian/kembalikan/"); ?>' + id;
            modal.classList.remove('hidden');
        }

        function closeModalPengembalian(id) {
            document.getElementById(id).classList.add('hidden');
        }

        // Animasi halus
        document.head.insertAdjacentHTML('beforeend', `
  <style>
    .animate-fade-in {
      animation: fadeIn 0.25s ease-out;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-4px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
`);
    </script>