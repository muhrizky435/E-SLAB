<!-- Page Header -->
<div class="mb-8 text-left px-6">
  <h2 class="text-3xl font-extrabold text-gray-800 mb-2 flex items-center justify-start gap-2">
    <i class="fas fa-question-circle text-teal-500"></i> Bantuan & Panduan E-SLAB
  </h2>
  <p class="text-gray-600 italic text-sm">“Temukan jawaban dan panduan praktis untuk memaksimalkan penggunaan sistem laboratorium digital.”</p>
</div>

<!-- Help Content -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 px-6">
  <!-- FAQ Section -->
  <div class="bg-white rounded-2xl shadow-md border border-gray-100 hover:shadow-lg transition duration-300">
    <div class="p-6 border-b">
      <h3 class="text-lg font-semibold text-gray-900 flex items-center gap-2">
        <i class="fas fa-lightbulb text-yellow-500"></i> Pertanyaan yang Sering Diajukan
      </h3>
    </div>
    <div class="p-6 space-y-6">
      <div class="border-b pb-4">
        <h4 class="font-semibold text-gray-900 mb-2 flex items-center gap-2">
          <i class="fas fa-tools text-blue-600"></i> Bagaimana cara meminjam alat laboratorium?
        </h4>
        <p class="text-gray-600 text-sm leading-relaxed">
          Akses halaman <strong>Katalog Alat</strong>, pilih alat yang tersedia, lalu isi form peminjaman dengan data yang lengkap. 
          Setelah disetujui admin, alat dapat diambil sesuai jadwal.
        </p>
      </div>

      <div class="border-b pb-4">
        <h4 class="font-semibold text-gray-900 mb-2 flex items-center gap-2">
          <i class="fas fa-hourglass-half text-teal-600"></i> Berapa lama durasi peminjaman maksimal?
        </h4>
        <p class="text-gray-600 text-sm leading-relaxed">
          Durasi standar adalah <strong>7 hari untuk alat</strong> dan <strong>3 hari untuk bahan kimia</strong>. 
          Perpanjangan bisa diajukan dengan persetujuan admin laboratorium.
        </p>
      </div>

      <div class="border-b pb-4">
        <h4 class="font-semibold text-gray-900 mb-2 flex items-center gap-2">
          <i class="fas fa-exclamation-triangle text-orange-500"></i> Bagaimana jika terlambat mengembalikan?
        </h4>
        <p class="text-gray-600 text-sm leading-relaxed">
          Keterlambatan akan mendapatkan peringatan otomatis. 
          Jika terjadi berulang, akun Anda bisa dibatasi sementara untuk peminjaman berikutnya.
        </p>
      </div>

      <div>
        <h4 class="font-semibold text-gray-900 mb-2 flex items-center gap-2">
          <i class="fas fa-bug text-red-500"></i> Bagaimana cara melaporkan kerusakan alat?
        </h4>
        <p class="text-gray-600 text-sm leading-relaxed">
          Gunakan fitur <strong>Lapor Kerusakan</strong> di sistem atau hubungi langsung admin laboratorium. 
          Sertakan foto atau deskripsi singkat kondisi alat.
        </p>
      </div>
    </div>
  </div>

  <!-- Contact Information -->
  <div class="bg-white rounded-2xl shadow-md border border-gray-100 hover:shadow-lg transition duration-300">
    <div class="p-6 border-b">
      <h3 class="text-lg font-semibold text-gray-900 flex items-center gap-2">
        <i class="fas fa-headset text-green-600"></i> Kontak & Dukungan
      </h3>
    </div>
    <div class="p-6 space-y-5">
      <div class="flex items-center space-x-3">
        <div class="w-12 h-12 bg-blue-100 rounded-xl flex items-center justify-center">
          <i class="fas fa-user-tie text-blue-600 text-lg"></i>
        </div>
        <div>
          <p class="font-semibold text-gray-900">Admin Laboratorium</p>
          <p class="text-gray-600 text-sm">Penanggung jawab utama sistem dan validasi peminjaman</p>
        </div>
      </div>

      <div class="flex items-center space-x-3">
        <div class="w-12 h-12 bg-green-100 rounded-xl flex items-center justify-center">
          <i class="fas fa-phone text-green-600 text-lg"></i>
        </div>
        <div>
          <p class="font-semibold text-gray-900">Telepon</p>
          <p class="text-gray-600 text-sm">+62 21 1234 5678</p>
        </div>
      </div>

      <div class="flex items-center space-x-3">
        <div class="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center">
          <i class="fas fa-envelope text-purple-600 text-lg"></i>
        </div>
        <div>
          <p class="font-semibold text-gray-900">Email</p>
          <p class="text-gray-600 text-sm">admin@laboratorium.ac.id</p>
        </div>
      </div>

      <div class="flex items-center space-x-3">
        <div class="w-12 h-12 bg-orange-100 rounded-xl flex items-center justify-center">
          <i class="fas fa-clock text-orange-600 text-lg"></i>
        </div>
        <div>
          <p class="font-semibold text-gray-900">Jam Operasional</p>
          <p class="text-gray-600 text-sm">Senin - Jumat: 08.00 - 16.00 WIB</p>
        </div>
      </div>

      <div class="bg-gradient-to-r from-blue-50 to-teal-50 border rounded-xl p-4 mt-4">
        <p class="text-gray-700 text-sm">
          <i class="fas fa-info-circle text-blue-500 mr-1"></i>
          Untuk bantuan darurat terkait alat atau bahan kimia, segera hubungi admin melalui telepon langsung.
        </p>
      </div>
    </div>
  </div>
</div>

<!-- Quick Actions -->
<div class="mt-8 mx-6 bg-white rounded-2xl shadow-md border border-gray-100 hover:shadow-lg transition duration-300">
  <div class="p-6 border-b flex items-center gap-2">
    <i class="fas fa-bolt text-yellow-500"></i>
    <h3 class="text-lg font-semibold text-gray-900">Aksi Cepat</h3>
  </div>
  <div class="p-6">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
      <a href="<?= site_url('peminjaman/alat'); ?>" class="flex items-center space-x-3 p-4 border rounded-xl hover:bg-blue-50 transition-all">
        <i class="fas fa-tools text-blue-600 text-lg"></i>
        <div>
          <p class="font-semibold text-gray-900">Lihat Katalog Alat</p>
          <p class="text-gray-600 text-sm">Temukan alat yang tersedia</p>
        </div>
      </a>

      <a href="<?= site_url('peminjaman/bahan'); ?>" class="flex items-center space-x-3 p-4 border rounded-xl hover:bg-green-50 transition-all">
        <i class="fas fa-vial text-green-600 text-lg"></i>
        <div>
          <p class="font-semibold text-gray-900">Lihat Katalog Bahan</p>
          <p class="text-gray-600 text-sm">Jelajahi bahan kimia laboratorium</p>
        </div>
      </a>

      <a href="<?= site_url('peminjaman/riwayat'); ?>" class="flex items-center space-x-3 p-4 border rounded-xl hover:bg-purple-50 transition-all">
        <i class="fas fa-history text-purple-600 text-lg"></i>
        <div>
          <p class="font-semibold text-gray-900">Lihat Riwayat</p>
          <p class="text-gray-600 text-sm">Pantau riwayat peminjaman Anda</p>
        </div>
      </a>
    </div>
  </div>
</div>

<!-- Quick Guide -->
<div class="mt-6 mx-6 bg-gradient-to-r from-teal-50 to-blue-50 rounded-2xl p-6 border border-teal-400 shadow-sm">
  <h3 class="text-lg font-semibold text-gray-800 mb-3 flex items-center gap-2">
    <i class="fas fa-book-open text-teal-600"></i> Panduan Cepat E-SLAB
  </h3>
  <ul class="list-disc pl-6 text-gray-700 text-sm space-y-2">
    <li>Gunakan fitur pencarian untuk menemukan alat dengan cepat.</li>
    <li>Pastikan data peminjaman diisi lengkap dan benar.</li>
    <li>Selalu periksa notifikasi untuk status persetujuan peminjaman.</li>
    <li>Laporkan segera jika ada alat rusak atau hilang.</li>
  </ul>
</div>
