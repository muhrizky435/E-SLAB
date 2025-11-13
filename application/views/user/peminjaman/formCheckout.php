<div class="max-w-4xl mx-auto bg-white shadow-2xl rounded-2xl p-6 border border-gray-100">
  <!-- Judul -->
  <div class="text-center mb-10">
    <h2 class="text-3xl font-extrabold text-gray-800 flex items-center justify-center gap-3">
      <i class="fas fa-file-signature text-teal-500"></i>
      Formulir Peminjaman Alat & Bahan
    </h2>
    <p class="text-gray-500 text-sm mt-2">Silakan lengkapi data berikut dengan benar untuk pengajuan peminjaman</p>
  </div>

  <!-- Form -->
  <form action="<?= site_url('checkout/proses') ?>" method="post" class="space-y-8">
    
    <!-- Data Peminjam -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
          <i class="fas fa-user text-teal-500"></i> Nama Peminjam
        </label>
        <input 
          type="text" 
          name="nama_peminjam" 
          required 
          value="<?= isset($user->nama) ? $user->nama : '' ?>"
          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition"
          placeholder="Masukkan nama lengkap Anda">
      </div>

      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
          <i class="fas fa-phone text-teal-500"></i> Nomor HP
        </label>
        <input 
          type="text" 
          name="no_hp" 
          required 
          value="<?= isset($user->no_hp) ? $user->no_hp : '' ?>"
          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition"
          placeholder="Masukkan nomor HP aktif">
      </div>
    </div>

    <!-- Jurusan dan Kelas -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
          <i class="fas fa-school text-teal-500"></i> Jurusan
        </label>
        <input 
          type="text" 
          name="jurusan"
          required 
          value="<?= isset($user->jurusan) ? $user->jurusan : '' ?>"
          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition"
          placeholder="Contoh: D3 Keperawatan">
      </div>

      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
          <i class="fas fa-users text-teal-500"></i> Kelas
        </label>
        <input 
          type="text" 
          name="kelas" 
          required 
          value="<?= isset($user->kelas) ? $user->kelas : '' ?>"
          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition"
          placeholder="Contoh: KP-3A">
      </div>
    </div>

    <!-- Tujuan -->
    <div>
      <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
        <i class="fas fa-bullseye text-teal-500"></i> Tujuan Peminjaman
      </label>
      <input 
        type="text" 
        name="tujuan" 
        required 
        class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition"
        placeholder="Contoh: Penelitian data pasien">
    </div>

    <!-- Tanggal Pinjam dan Kembali -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
          <i class="fas fa-calendar-alt text-teal-500"></i> Tanggal Pinjam
        </label>
        <input 
          type="date" 
          name="tanggal_pinjam" 
          value="<?= date('Y-m-d') ?>" 
          required 
          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition">
      </div>

      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
          <i class="fas fa-calendar-check text-teal-500"></i> Tanggal Kembali
        </label>
        <input 
          type="date" 
          name="tanggal_kembali" 
          required 
          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition">
      </div>
    </div>

    <!-- Keterangan -->
    <div>
      <label class="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
        <i class="fas fa-sticky-note text-teal-500"></i> Keterangan
      </label>
      <textarea 
        name="keterangan" 
        rows="4"
        class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-400 focus:outline-none transition"
        placeholder="Tambahkan catatan jika ada..."></textarea>
    </div>

    <!-- Tombol Submit -->
    <div class="flex justify-end">
      <button 
        type="submit" 
        class="px-6 py-3 bg-teal-600 hover:bg-teal-700 text-white font-semibold rounded-xl shadow-md transition flex items-center gap-2">
        <i class="fas fa-paper-plane"></i> Ajukan Peminjaman
      </button>
    </div>
  </form>
</div>
