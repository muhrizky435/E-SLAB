<div class="container px-6">
  <!-- Header -->
  <div class="flex flex-col sm:flex-row justify-between items-center border-b border-gray-200 pb-5 mb-8">
    <div class="flex items-center gap-3">
      <div class="bg-yellow-100 p-3 rounded-xl shadow-sm">
        <i class="fas fa-bell text-yellow-500 text-xl"></i>
      </div>
      <div>
        <h2 class="text-3xl font-extrabold text-gray-800">Notifikasi</h2>
        <p class="text-sm text-gray-500 mt-1">“Pantau semua pemberitahuan terbaru Anda di sini“</p>
      </div>
    </div>

    <span class="mt-4 sm:mt-0 bg-yellow-100 text-yellow-800 text-sm font-semibold px-4 py-1.5 rounded-full shadow-sm">
      <i class="fa-solid fa-list mr-1"></i> <?= count($notifikasi ?? []); ?> Notifikasi
    </span>
  </div>

  <?php if (empty($notifikasi)): ?>
    <div class="bg-white rounded-2xl shadow-md p-8 text-center border border-gray-100">
      <i class="fas fa-inbox text-5xl mb-3 text-gray-400"></i>
      <h3 class="text-lg font-semibold text-gray-700">Tidak ada notifikasi</h3>
      <p class="text-gray-500 text-sm mt-1">Semua aktivitas sudah dibaca atau belum ada pemberitahuan baru.</p>
    </div>

  <?php else: ?>
    <form id="notifForm" method="post" class="space-y-4">

      <!-- Tombol Aksi Massal -->
      <div id="aksiGroup"
        class="hidden flex flex-col sm:flex-row justify-between items-start sm:items-center bg-gray-50 border border-gray-200 p-4 rounded-xl mb-4 shadow-sm gap-3">
        <div class="flex flex-wrap gap-2">
          <button type="submit" formaction="<?= site_url('notifikasi/mark_selected_as_read'); ?>"
            id="tandaiBtn"
            class="hidden px-4 py-2 bg-gradient-to-r from-teal-600 to-teal-400 hover:scale-105 text-white rounded-lg text-sm shadow transition flex items-center gap-2">
            <i class="fas fa-check-circle"></i> Tandai Dibaca
          </button>

          <button type="button" id="hapusBtn"
            class="hidden px-4 py-2 bg-gradient-to-r from-red-600 to-red-400 hover:scale-105 text-white rounded-lg text-sm shadow transition flex items-center gap-2"
            onclick="openDeleteSelectedModal()">
            <i class="fas fa-trash"></i> Hapus Terpilih
          </button>
        </div>

        <label class="flex items-center text-sm text-gray-700 cursor-pointer">
          <input type="checkbox" id="selectAll" class="w-4 h-4 accent-yellow-500 mr-2"> Pilih Semua
        </label>
      </div>

      <!-- Daftar Notifikasi -->
      <div class="space-y-3">
        <?php foreach ($notifikasi as $n): ?>
          <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center p-5 rounded-xl shadow-sm border transition transform hover:-translate-y-1 hover:shadow-md duration-200
            <?= $n->status === 'belum_dibaca' ? 'bg-yellow-50 border-yellow-300' : 'bg-white border-gray-200'; ?>">

            <div class="flex items-start gap-4 w-full sm:w-auto">
              <input type="checkbox" name="selected[]" value="<?= $n->id_notifikasi; ?>"
                class="itemCheckbox mt-1 w-4 h-4 accent-yellow-500 cursor-pointer flex-shrink-0">

              <div class="flex-1">
                <p class="text-gray-800 text-[15px] leading-relaxed">
                  <?= $n->pesan; ?>
                </p>
                <small class="text-gray-500 text-sm flex items-center gap-1 mt-1">
                  <i class="far fa-clock"></i> <?= date('d M Y, H:i', strtotime($n->created_at)); ?>
                </small>
              </div>
            </div>

            <div class="mt-3 sm:mt-0">
              <?php if ($n->status === 'belum_dibaca'): ?>
                <a href="<?= site_url('notifikasi/mark_as_read/' . $n->id_notifikasi); ?>"
                  class="text-sm bg-yellow-500 hover:bg-yellow-600 text-white py-1.5 px-3 rounded-lg shadow-sm transition inline-flex items-center gap-1">
                  <i class="fas fa-check"></i> Tandai Dibaca
                </a>
              <?php else: ?>
                <span class="text-xs bg-green-100 text-green-700 font-semibold px-3 py-1 rounded-full inline-flex items-center gap-1">
                  <i class="fa-solid fa-check-double text-green-500"></i> Dibaca
                </span>
              <?php endif; ?>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </form>

    <!-- Modal Konfirmasi Hapus Terpilih -->
    <div id="deleteSelectedModal" class="hidden fixed inset-0 bg-black bg-opacity-40 flex justify-center items-center z-50 transition-opacity">
      <div class="bg-white w-full max-w-md p-6 rounded-2xl shadow-2xl relative animate-fadeIn">
        <h3 class="text-lg font-bold text-gray-800 mb-3 flex items-center gap-2">
          <i class="fa-solid fa-triangle-exclamation text-red-500"></i> Konfirmasi Hapus
        </h3>
        <p class="text-gray-600 mb-6">Apakah Anda yakin ingin menghapus semua notifikasi yang dipilih?</p>
        <div class="flex justify-end gap-3">
          <button type="button" onclick="closeDeleteSelectedModal()"
            class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-lg transition">
            Batal
          </button>

          <button type="submit" form="notifForm" formaction="<?= site_url('notifikasi/delete_selected'); ?>"
            class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg shadow transition">
            Hapus
          </button>
        </div>
        <button onclick="closeDeleteSelectedModal()" class="absolute top-3 right-3 text-gray-400 hover:text-gray-600">
          <i class="fa-solid fa-xmark text-lg"></i>
        </button>
      </div>
    </div>
  <?php endif; ?>
</div>

<script>
  const selectAllBox = document.getElementById('selectAll');
  const checkboxes = document.querySelectorAll('.itemCheckbox');
  const aksiGroup = document.getElementById('aksiGroup');
  const hapusBtn = document.getElementById('hapusBtn');
  const tandaiBtn = document.getElementById('tandaiBtn');

  selectAllBox?.addEventListener('change', function() {
    checkboxes.forEach(chk => chk.checked = this.checked);
    toggleActionButtons();
  });

  checkboxes.forEach(chk => chk.addEventListener('change', toggleActionButtons));

  function toggleActionButtons() {
    const anyChecked = document.querySelectorAll('.itemCheckbox:checked').length > 0;
    aksiGroup.classList.toggle('hidden', !anyChecked);
    hapusBtn.classList.toggle('hidden', !anyChecked);
    tandaiBtn.classList.toggle('hidden', !anyChecked);
  }

  function openDeleteSelectedModal() {
    const modal = document.getElementById('deleteSelectedModal');
    modal.classList.remove('hidden');
    modal.classList.add('opacity-100');
  }

  function closeDeleteSelectedModal() {
    const modal = document.getElementById('deleteSelectedModal');
    modal.classList.remove('opacity-100');
    setTimeout(() => modal.classList.add('hidden'), 200);
  }
</script>

<style>
  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: scale(0.95);
    }

    to {
      opacity: 1;
      transform: scale(1);
    }
  }

  .animate-fadeIn {
    animation: fadeIn 0.25s ease-out;
  }
</style>