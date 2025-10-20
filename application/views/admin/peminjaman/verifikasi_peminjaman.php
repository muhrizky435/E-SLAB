<div class="p-2 md:p-3 min-h-screen">
  <!-- Header -->
  <div class="mb-8">
    <h3 class="text-3xl font-extrabold text-gray-800 flex items-center gap-3">
      <i class="fa-solid fa-check-double text-teal-600"></i> Verifikasi Peminjaman
    </h3>
    <p class="text-gray-500 italic mt-1 text-sm md:text-base">
      “Pastikan setiap peminjaman diverifikasi dengan tepat dan cepat.”
    </p>
  </div>

  <!-- Flash Messages -->
  <?php if ($this->session->flashdata('success')): ?>
    <div class="flex items-center gap-2 bg-teal-100 text-teal-800 p-3 rounded-lg mb-6 shadow-sm">
      <i class="fas fa-check-circle"></i>
      <span><?= $this->session->flashdata('success'); ?></span>
    </div>
  <?php elseif ($this->session->flashdata('error')): ?>
    <div class="flex items-center gap-2 bg-red-100 text-red-800 p-3 rounded-lg mb-6 shadow-sm">
      <i class="fas fa-exclamation-circle"></i>
      <span><?= $this->session->flashdata('error'); ?></span>
    </div>
  <?php endif; ?>

  <!-- Table -->
  <div class="overflow-x-auto bg-white shadow-2xl rounded-2xl border border-gray-100">
    <table class="min-w-full divide-y divide-gray-200 text-sm">
      <thead class="bg-gradient-to-r from-teal-600 to-teal-400 text-white">
        <tr>
          <th class="px-6 py-3 text-left font-semibold uppercase tracking-wide">Nama Peminjam</th>
          <th class="px-6 py-3 text-left font-semibold uppercase tracking-wide">Tanggal Pinjam</th>
          <th class="px-6 py-3 text-center font-semibold uppercase tracking-wide">Status</th>
          <th class="px-6 py-3 text-center font-semibold uppercase tracking-wide">Aksi</th>
        </tr>
      </thead>

      <tbody class="divide-y divide-gray-100">
        <?php if (!empty($peminjaman)): ?>
          <?php foreach ($peminjaman as $p): ?>
            <tr class="hover:bg-teal-50 transition-all duration-200">
              <td class="px-6 py-4 font-medium text-gray-800"><?= htmlspecialchars($p->nama_peminjam) ?></td>
              <td class="px-6 py-4 text-gray-600"><?= date('d M Y', strtotime($p->tanggal_pinjam)) ?></td>
              <td class="px-6 py-4 text-center">
                <span class="inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-semibold 
                  <?= $p->status == 'pending' ? 'bg-yellow-100 text-yellow-700' :
                      ($p->status == 'disetujui' ? 'bg-green-100 text-green-700' :
                      ($p->status == 'ditolak' ? 'bg-red-100 text-red-700' : 'bg-gray-100 text-gray-700')) ?>">
                  <i class="fas <?= $p->status == 'pending' ? 'fa-hourglass-half' :
                      ($p->status == 'disetujui' ? 'fa-check-circle' :
                      ($p->status == 'ditolak' ? 'fa-times-circle' : 'fa-info-circle')) ?>"></i>
                  <?= ucfirst($p->status) ?>
                </span>
              </td>

              <!-- Tombol Aksi -->
              <td class="px-6 py-4 text-center relative">
                <div class="inline-block text-left">
                  <button onclick="toggleDropdown('dropdown<?= $p->id_peminjaman ?>')" 
                          class="p-2 rounded-full hover:bg-teal-400 transition">
                    <i class="fas fa-ellipsis-v text-gray-600"></i>
                  </button>

                  <!-- Dropdown Menu -->
                  <div id="dropdown<?= $p->id_peminjaman ?>"
                       class="hidden absolute top-1 right-5 mb-6 mr-2 w-44 bg-white rounded-xl shadow-xl border border-teal-200 z-50 animate-fade-in"t">
                    <a href="<?= site_url('admin/adminpeminjaman/detail/' . $p->id_peminjaman) ?>" 
                       class="block px-4 py-2 text-sm text-gray-700 hover:bg-blue-200 rounded-xl flex items-center gap-2">
                      <i class="fas fa-info-circle text-blue-500"></i> Detail
                    </a>

                    <?php if ($p->status == 'pending'): ?>
                      <button onclick="openModalLocal('modalSetuju<?= $p->id_peminjaman ?>')" 
                              class="w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-green-200 rounded-xl flex items-center gap-2">
                        <i class="fas fa-check text-green-500"></i> Setujui
                      </button>
                      <button onclick="openModalLocal('modalTolak<?= $p->id_peminjaman ?>')" 
                              class="w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-red-200 rounded-xl flex items-center gap-2">
                        <i class="fas fa-times text-red-500"></i> Tolak
                      </button>
                    <?php endif; ?>

                    <button onclick="openModalLocal('modalHapus<?= $p->id_peminjaman ?>')" 
                            class="w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-red-200 rounded-xl flex items-center gap-2">
                      <i class="fas fa-trash text-red-500"></i> Hapus
                    </button>
                  </div>
                </div>
              </td>
            </tr>
          <?php endforeach; ?>
        <?php else: ?>
          <tr>
            <td colspan="4" class="text-center py-6 text-gray-500 italic">
              Tidak ada peminjaman yang perlu diverifikasi.
            </td>
          </tr>
        <?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<!-- Modal Template (sama seperti sebelumnya) -->
<?php foreach ($peminjaman as $p): ?>
  <!-- Modal Setuju -->
  <div id="modalSetuju<?= $p->id_peminjaman ?>" class="fixed inset-0 hidden bg-gray-800 bg-opacity-60 flex items-center justify-center z-50">
    <div class="bg-white rounded-xl p-6 w-11/12 max-w-md shadow-2xl animate-fade-in">
      <h3 class="text-xl font-bold mb-3 text-gray-700 flex items-center gap-2">
        <i class="fas fa-check text-green-600"></i> Konfirmasi Persetujuan
      </h3>
      <p class="text-sm text-gray-600 mb-5">Apakah Anda yakin ingin menyetujui peminjaman ini?</p>
      <div class="flex justify-end gap-3">
        <button onclick="closeModalLocal('modalSetuju<?= $p->id_peminjaman ?>')" 
                class="px-3 py-1.5 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition">
          Batal
        </button>
        <form method="post" action="<?= site_url('admin/adminpeminjaman/setujui/' . $p->id_peminjaman) ?>">
          <button type="submit" class="px-3 py-1.5 bg-gradient-to-r from-teal-600 to-teal-400 text-white rounded-lg hover:bg-green-600 transition">
            Setujui
          </button>
        </form>
      </div>
    </div>
  </div>

  <!-- Modal Tolak -->
  <div id="modalTolak<?= $p->id_peminjaman ?>" class="fixed inset-0 hidden bg-gray-800 bg-opacity-60 flex items-center justify-center z-50">
    <div class="bg-white rounded-xl p-6 w-11/12 max-w-md shadow-2xl animate-fade-in">
      <h3 class="text-xl font-bold mb-3 text-gray-700 flex items-center gap-2">
        <i class="fas fa-times text-red-600"></i> Konfirmasi Penolakan
      </h3>
      <p class="text-sm text-gray-600 mb-5">Apakah Anda yakin ingin menolak peminjaman ini?</p>
      <div class="flex justify-end gap-3">
        <button onclick="closeModalLocal('modalTolak<?= $p->id_peminjaman ?>')" 
                class="px-3 py-1.5 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition">
          Batal
        </button>
        <form method="post" action="<?= site_url('admin/adminpeminjaman/tolak/' . $p->id_peminjaman) ?>">
          <button type="submit" class="px-3 py-1.5 bg-gradient-to-r from-red-600 to-red-400 text-white rounded-lg hover:bg-red-600 transition">
            Tolak
          </button>
        </form>
      </div>
    </div>
  </div>

  <!-- Modal Hapus -->
  <div id="modalHapus<?= $p->id_peminjaman ?>" class="fixed inset-0 hidden bg-gray-800 bg-opacity-60 flex items-center justify-center z-50">
    <div class="bg-white rounded-xl p-6 w-11/12 max-w-md shadow-2xl animate-fade-in">
      <h3 class="text-xl font-bold mb-3 text-gray-700 flex items-center gap-2">
        <i class="fas fa-trash text-gray-600"></i> Hapus Peminjaman
      </h3>
      <p class="text-sm text-gray-600 mb-5">Apakah Anda yakin ingin menghapus peminjaman ini?</p>
      <div class="flex justify-end gap-3">
        <button onclick="closeModalLocal('modalHapus<?= $p->id_peminjaman ?>')" 
                class="px-3 py-1.5 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition">
          Batal
        </button>
        <form method="post" action="<?= site_url('admin/adminpeminjaman/hapus/' . $p->id_peminjaman) ?>">
          <button type="submit" class="px-3 py-1.5 bg-gradient-to-r from-red-600 to-red-400 text-white rounded-lg hover:bg-red-600 transition">
            Hapus
          </button>
        </form>
      </div>
    </div>
  </div>
<?php endforeach; ?>

<!-- JS untuk Dropdown dan Modal -->
<script>
  function toggleDropdown(id) {
    document.querySelectorAll('[id^="dropdown"]').forEach(el => {
      if (el.id !== id) el.classList.add('hidden');
    });
    const dropdown = document.getElementById(id);
    dropdown.classList.toggle('hidden');
  }

  function openModalLocal(id) {
    document.getElementById(id)?.classList.remove('hidden');
  }

  function closeModalLocal(id) {
    document.getElementById(id)?.classList.add('hidden');
  }

  // Tutup dropdown kalau klik di luar
  document.addEventListener('click', (e) => {
    if (!e.target.closest('[id^="dropdown"]') && !e.target.closest('button')) {
      document.querySelectorAll('[id^="dropdown"]').forEach(el => el.classList.add('hidden'));
    }
  });
</script>
