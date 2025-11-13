<div class="flex flex-col min-h-screen bg-gradient-to-b from-blue-50 via-cyan-50 to-white">
    <!-- Hero Section -->
    <section id="beranda" class="px-11 md:px-16 pt-24 pb-6 md:pt-32 md:pb-8 max-w-7xl mx-auto bg-gradient-to-b from-blue-50 via-cyan-50 to-white">
        <div class="grid md:grid-cols-2 gap-12 md:gap-27 items-start">

            <!-- Left Content -->
            <div class="flex flex-col justify-start space-y-6 text-center md:text-left">
                <!-- Tagline -->
                <div class="inline-block px-5 py-2 mt-4 bg-gradient-to-r from-cyan-100 to-blue-100 rounded-full text-sm font-semibold text-teal-700">
                    ✨ Solusi Manajemen Peminjaman Laboratorium Terpadu
                </div>

                <!-- Heading -->
                <h2 class="text-3xl md:text-5xl font-black text-gray-900 leading-relaxed md:leading-snug">
                    Peminjaman Alat & Bahan Laboratorium <br />
                    <span class="bg-gradient-to-r from-cyan-500 to-blue-600 bg-clip-text text-transparent">
                        Jadi Lebih Mudah
                    </span>
                </h2>

                <!-- Description -->
                <p class="text-base sm:text-lg text-gray-600 leading-relaxed max-w-md md:max-w-lg mx-auto md:mx-0">
                    Akses ribuan alat dan bahan belajar dengan sistem manajemen peminjaman yang efisien, transparan, dan terpercaya.
                </p>

                <!-- CTA Buttons -->
                <div class="flex flex-col sm:flex-row justify-center md:justify-start gap-4 pt-1">
                    <a href="<?= site_url('auth/login'); ?>"
                        class="px-8 py-4 bg-gradient-to-r from-cyan-500 to-blue-600 text-white rounded-xl font-bold hover:from-cyan-600 hover:to-blue-700 transition transform hover:scale-105 shadow-lg hover:shadow-xl">
                        <i class="fas fa-rocket mr-2"></i> Login Sekarang
                    </a>
                    <a href="#panduan"
                        class="px-8 py-4 border-2 border-teal-600 text-teal-700 rounded-xl font-bold hover:bg-teal-50 transition">
                        <i class="fas fa-play-circle mr-2"></i> Pelajari Lebih Lanjut
                    </a>
                </div>
            </div>

            <!-- Right Side (Image + Stats stacked vertically) -->
            <div class="flex flex-col items-center justify-start h-full">
                <!-- Image -->
                <div class="relative w-3/5 md:w-2/3 lg:w-3/4 max-w-[500px]">
                    <div class="absolute inset-0 bg-gradient-to-r from-cyan-200/10 to-blue-200/10 rounded-3xl blur-xl"></div>
                    <img src="<?= base_url('assets/img/lab-illustration-white.png'); ?>"
                        alt="Laboratory Illustration"
                        class="relative w-full h-auto rounded-2xl transform hover:scale-105 transition duration-500 object-contain">
                </div>

                <!-- Stats below image -->
                <div class="grid grid-cols-3 gap-4 w-full md:w-3/4 mt-12">
                    <div class="bg-gradient-to-br from-cyan-100 to-blue-100 p-4 rounded-xl border border-cyan-200 shadow-sm text-center">
                        <p class="text-2xl font-bold text-cyan-600">1000+</p>
                        <p class="text-sm text-gray-600">Alat & Bahan</p>
                    </div>
                    <div class="bg-gradient-to-br from-cyan-100 to-blue-100 p-4 rounded-xl border border-cyan-200 shadow-sm text-center">
                        <p class="text-2xl font-bold text-blue-600">500+</p>
                        <p class="text-sm text-gray-600">Pengguna Aktif</p>
                    </div>
                    <div class="bg-gradient-to-br from-cyan-100 to-blue-100 p-4 rounded-xl border border-cyan-200 shadow-sm text-center">
                        <p class="text-2xl font-bold text-teal-600">99.9%</p>
                        <p class="text-sm text-gray-600">Uptime</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Tentang Section -->
    <section id="tentang" class="relative px-6 md:px-2 pt-16 pb-16 md:pt-24 md:pb-36 max-w-7xl mx-auto bg-gradient-to-br from-blue-50 via-cyan-50 to-teal-200">
        <!-- Background decorative shapes (behind content) -->
        <div class="absolute top-0 left-0 w-72 h-72 bg-cyan-200 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-pulse -z-10"></div>
        <div class="absolute bottom-0 right-0 w-80 h-80 bg-teal-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-pulse delay-1000 -z-10"></div>

        <div class="relative z-10 max-w-7xl mx-auto px-6 md:px-12 lg:px-20 flex flex-col md:flex-row items-center gap-14">
            <!-- Left Illustration -->
            <div class="md:w-1/2 flex justify-start">
                <img src="<?= base_url('assets/img/tentang-ilustration.png'); ?>"
                    alt="Laboratorium Illustration"
                    class="w-full max-w-sm md:max-w-md lg:max-w-lg object-contain drop-shadow-2xl animate-float" />
            </div>

            <!-- Right Text Content -->
            <div class="md:w-1/2 text-center md:text-justify">
                <h2 class="text-3xl md:text-4xl lg:text-5xl font-bold text-black mb-6 leading-tight">
                    Tentang <span class="text-teal-600">E-SLAB</span>
                </h2>
                <p class="text-gray-700 text-base md:text-lg leading-relaxed mb-6">
                    <strong>E-SLAB</strong> adalah aplikasi peminjaman alat dan bahan laboratorium
                    yang dirancang khusus untuk jurusan <span class="text-cyan-700 font-semibold">Keperawatan</span>
                    dan <span class="text-teal-700 font-semibold">Kebidanan</span>. Aplikasi ini membantu
                    mempermudah proses administrasi laboratorium — mulai dari pencatatan peminjaman,
                    pelacakan status, hingga pengembalian alat secara efisien dan terorganisir.
                </p>
                <p class="text-gray-600 mb-6">
                    Tampilan sederhana namun modern memungkinkan akses cepat dan transparan ke data laboratorium.
                </p>
                <a href="#fitur"
                    class="inline-block px-8 py-3 bg-gradient-to-r from-cyan-500 to-teal-500 text-white rounded-full font-semibold shadow-lg hover:from-cyan-600 hover:to-teal-600 transform hover:-translate-y-1 hover:scale-105 transition-all duration-300">
                    Jelajahi Fitur E-SLAB <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- Dashboard Preview Section -->
    <section class="px-8 md:px-16 pt-12 pb-10 max-w-7xl mx-auto relative z-0 bg-gradient-to-b from-blue-50 via-cyan-50 to-white">
        <!-- Section Header -->
        <div class="text-center mb-10">
            <h2 class="text-3xl md:text-5xl font-bold text-gray-900 mb-6">
                Dashboard
                <span class="bg-gradient-to-r from-cyan-500 to-blue-600 bg-clip-text text-transparent">
                    Intuitif & Powerful
                </span>
            </h2>
            <p class="text-lg text-gray-600 max-w-3xl mx-auto">
                Pantau semua peminjaman Anda dalam satu tempat dengan visualisasi data yang mudah dipahami
            </p>
        </div>

        <!-- Dashboard Cards Grid -->
        <div class="grid md:grid-cols-2 gap-10">
            <!-- Dashboard Peminjaman Anda Card -->
            <div class="group bg-white rounded-3xl shadow-xl p-10 hover:shadow-2xl transition duration-500 border border-gray-100 transform hover:-translate-y-1">
                <div class="flex items-center gap-5 mb-8">
                    <div class="w-16 h-16 bg-gradient-to-r from-blue-500 to-cyan-500 rounded-lg flex items-center justify-center shadow-lg transform group-hover:scale-110 transition duration-500">
                        <i class="fas fa-chart-line text-white text-3xl"></i>
                    </div>
                    <h3 class="text-2xl md:text-3xl font-bold text-gray-800">
                        Dashboard Peminjaman Anda
                    </h3>
                </div>

                <div class="space-y-8">
                    <!-- Chart -->
                    <div class="h-56 bg-gradient-to-br from-blue-50 to-cyan-50 rounded-2xl flex items-end justify-between px-6 py-4 border border-blue-100 relative overflow-hidden">
                        <div class="w-10 bg-gradient-to-t from-blue-400 to-blue-300 rounded-t h-24 hover:h-36 transition-all duration-500 ease-in-out animate-bounce-chart"></div>
                        <div class="w-10 bg-gradient-to-t from-blue-500 to-blue-400 rounded-t h-36 hover:h-44 transition-all duration-500 ease-in-out animate-bounce-chart"></div>
                        <div class="w-10 bg-gradient-to-t from-blue-500 to-blue-400 rounded-t h-28 hover:h-36 transition-all duration-500 ease-in-out animate-bounce-chart"></div>
                        <div class="w-10 bg-gradient-to-t from-blue-600 to-blue-500 rounded-t h-36 hover:h-44 transition-all duration-500 ease-in-out animate-bounce-chart"></div>
                        <div class="w-10 bg-gradient-to-t from-blue-600 to-blue-500 rounded-t h-28 hover:h-36 transition-all duration-500 ease-in-out animate-bounce-chart"></div>
                    </div>

                    <!-- Stats -->
                    <div class="grid grid-cols-2 gap-6">
                        <div class="bg-gradient-to-br from-blue-50 to-blue-100 p-6 rounded-2xl border-l-4 border-blue-500 shadow-sm hover:shadow-md transition duration-300">
                            <p class="text-xs text-gray-600 font-medium mb-1">Jatuh Tempo</p>
                            <p class="text-2xl font-bold text-blue-600">7 Hari</p>
                        </div>
                        <div class="bg-gradient-to-br from-green-50 to-green-100 p-6 rounded-2xl border-l-4 border-green-500 shadow-sm hover:shadow-md transition duration-300">
                            <p class="text-xs text-gray-600 font-medium mb-1">Dikembalikan</p>
                            <p class="text-2xl font-bold text-green-600">3 Item</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Riwayat Peminjaman Card -->
            <div class="group bg-white rounded-3xl shadow-xl p-10 hover:shadow-2xl transition duration-500 border border-gray-100 transform hover:-translate-y-1">
                <div class="flex items-center gap-5 mb-8">
                    <div class="w-16 h-16 bg-gradient-to-r from-cyan-500 to-teal-500 rounded-lg flex items-center justify-center shadow-lg transform group-hover:scale-110 transition duration-500">
                        <i class="fas fa-history text-white text-3xl"></i>
                    </div>
                    <h3 class="text-2xl md:text-3xl font-bold text-gray-800">
                        Riwayat Peminjaman
                    </h3>
                </div>

                <div class="overflow-hidden rounded-xl border border-gray-100 shadow-sm hover:shadow-md transition duration-300">
                    <table class="w-full text-sm">
                        <thead>
                            <tr class="border-b-2 border-gray-200 bg-gradient-to-r from-gray-50 to-gray-100">
                                <th class="text-left py-4 px-4 font-semibold text-gray-700">Alat/Bahan</th>
                                <th class="text-center py-4 px-4 font-semibold text-gray-700">Tgl</th>
                                <th class="text-center py-4 px-4 font-semibold text-gray-700">Kembali</th>
                                <th class="text-center py-4 px-4 font-semibold text-gray-700">Status</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            <tr class="hover:bg-gray-50 transition duration-300">
                                <td class="py-4 px-4 text-gray-800 font-medium">Pipa Osmotis</td>
                                <td class="text-center text-gray-600">10</td>
                                <td class="text-center text-gray-600">17</td>
                                <td class="text-center">
                                    <span class="px-4 py-1 bg-yellow-100 text-yellow-800 rounded-full text-xs font-bold animate-pulse">Dipinjam</span>
                                </td>
                            </tr>
                            <tr class="hover:bg-gray-50 transition duration-300">
                                <td class="py-4 px-4 text-gray-800 font-medium">Centrifuge</td>
                                <td class="text-center text-gray-600">12</td>
                                <td class="text-center text-gray-600">19</td>
                                <td class="text-center">
                                    <span class="px-4 py-1 bg-blue-100 text-blue-800 rounded-full text-xs font-bold animate-pulse">Dikembalikan</span>
                                </td>
                            </tr>
                            <tr class="hover:bg-gray-50 transition duration-300">
                                <td class="py-4 px-4 text-gray-800 font-medium">Buffer Solution</td>
                                <td class="text-center text-gray-600">15</td>
                                <td class="text-center text-gray-600">22</td>
                                <td class="text-center">
                                    <span class="px-4 py-1 bg-blue-100 text-blue-800 rounded-full text-xs font-bold animate-pulse">Dikembalikan</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="mt-8 text-center">
                    <a href="<?= site_url('auth/login'); ?>" class="inline-block px-8 py-3 bg-gradient-to-r from-cyan-500 to-teal-500 text-white rounded-xl font-semibold hover:from-cyan-600 hover:to-teal-600 transition transform hover:scale-105 shadow-lg">
                        Lihat Semua Riwayat <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Fitur Section -->
    <section id="fitur" class="relative bg-white py-8 md:py-10 lg:py-10">
        <div class="max-w-7xl mx-auto px-6 sm:px-10 lg:px-16">
            <!-- Section Header -->
            <div class="text-center mb-12 md:mb-16">
                <h2 class="text-3xl sm:text-4xl md:text-5xl font-extrabold text-gray-900 mb-4 leading-tight">
                    Fitur-Fitur <span class="bg-gradient-to-r from-cyan-500 to-blue-600 bg-clip-text text-transparent">Unggulan</span>
                </h2>
                <p class="text-base sm:text-lg text-gray-600 max-w-3xl mx-auto">
                    Jelajahi kemudahan digital dengan <strong>E-SLAB</strong> — aplikasi pintar yang membuat proses peminjaman alat & bahan laboratorium lebih cepat, rapi, dan efisien.
                </p>
            </div>

            <!-- Grid Card -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-10 md:gap-12">
                <!-- Card 1 -->
                <div class="bg-gradient-to-b from-blue-50 via-cyan-50 to-white rounded-3xl p-8 sm:p-10 shadow-lg border border-gray-100 
                  flex flex-col h-full transform hover:-translate-y-3 hover:shadow-2xl 
                  transition-all duration-500 ease-out hover:bg-gradient-to-br hover:from-cyan-50 hover:to-white">
                    <div class="flex items-start gap-5">
                        <div class="w-16 h-16 bg-cyan-100 rounded-2xl flex items-center justify-center text-cyan-600 text-3xl shadow-inner">
                            <i class="fas fa-search"></i>
                        </div>
                        <div class="flex-1 text-left">
                            <h3 class="text-2xl font-semibold text-gray-800 mb-2">Katalog Lengkap</h3>
                            <p class="text-gray-600 leading-relaxed">
                                Akses ribuan alat dan bahan laboratorium lengkap dengan deskripsi,
                                spesifikasi, serta ketersediaan real-time.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="bg-gradient-to-b from-blue-50 via-cyan-50 to-white rounded-3xl p-8 sm:p-10 shadow-lg border border-gray-100 
                  flex flex-col h-full transform hover:-translate-y-3 hover:shadow-2xl 
                  transition-all duration-500 ease-out hover:bg-gradient-to-br hover:from-blue-50 hover:to-white">
                    <div class="flex items-start gap-5">
                        <div class="w-16 h-16 bg-blue-100 rounded-2xl flex items-center justify-center text-blue-600 text-3xl shadow-inner">
                            <i class="fas fa-rocket"></i>
                        </div>
                        <div class="flex-1 text-left">
                            <h3 class="text-2xl font-semibold text-gray-800 mb-2">Proses Cepat & Mudah</h3>
                            <p class="text-gray-600 leading-relaxed">
                                Peminjaman hanya dalam beberapa klik dengan persetujuan admin dan notifikasi real-time.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="bg-gradient-to-b from-cyan-50 via-teal-50 to-white rounded-3xl p-8 sm:p-10 shadow-lg border border-gray-100 
                  flex flex-col h-full transform hover:-translate-y-3 hover:shadow-2xl 
                  transition-all duration-500 ease-out hover:bg-gradient-to-br hover:from-teal-50 hover:to-white">
                    <div class="flex items-start gap-5">
                        <div class="w-16 h-16 bg-teal-100 rounded-2xl flex items-center justify-center text-teal-600 text-3xl shadow-inner">
                            <i class="fas fa-bell"></i>
                        </div>
                        <div class="flex-1 text-left">
                            <h3 class="text-2xl font-semibold text-gray-800 mb-2">Notifikasi Pintar</h3>
                            <p class="text-gray-600 leading-relaxed">
                                Dapatkan pengingat otomatis jatuh tempo, pembaruan status, dan pemberitahuan penting langsung ke email Anda.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- spacer agar footer tidak mepet -->
            <div class="h-8 md:h-12 lg:h-16"></div>
    </section>

    <!-- Panduan Section -->
    <section id="panduan" class="relative bg-gradient-to-b from-cyan-50 to-white py-20">
        <div class="max-w-6xl mx-auto px-6 md:px-6">
            <!-- Judul -->
            <div class="text-center mb-12">
                <h2 class="text-4xl md:text-5xl font-extrabold text-gray-800">
                    Panduan <span class="text-cyan-600">E-SLAB</span>
                </h2>
                <p class="text-gray-600 mt-3 max-w-2xl mx-auto leading-relaxed">
                    Ikuti langkah singkat berikut untuk menggunakan aplikasi peminjaman alat dan bahan laboratorium
                    <span class="font-semibold text-cyan-600">E-SLAB</span> dengan mudah.
                </p>
            </div>

            <!-- Ringkasan Alur -->
            <div
                class="bg-white rounded-3xl shadow-lg p-8 md:p-10 border border-gray-100 mb-10 transform hover:-translate-y-2 hover:shadow-2xl transition-all duration-500 ease-out">
                <h3 class="text-2xl font-semibold text-gray-800 mb-3">Alur Penggunaan Singkat</h3>
                <p class="text-gray-600 leading-relaxed">
                    Baik <span class="font-semibold">User</span> maupun <span class="font-semibold">Admin</span> mengikuti proses sederhana:
                </p>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-5 mt-6">
                    <div class="p-5 bg-cyan-50 rounded-2xl flex flex-col items-center shadow-sm">
                        <div class="text-cyan-600 text-3xl mb-3"><i class="fas fa-user-circle"></i></div>
                        <h4 class="font-semibold text-gray-800">Login / Daftar</h4>
                        <p class="text-gray-600 text-sm mt-1 text-center">Masuk atau daftar akun baru sesuai peran Anda.</p>
                    </div>
                    <div class="p-5 bg-blue-50 rounded-2xl flex flex-col items-center shadow-sm">
                        <div class="text-blue-600 text-3xl mb-3"><i class="fas fa-box-open"></i></div>
                        <h4 class="font-semibold text-gray-800">Peminjaman</h4>
                        <p class="text-gray-600 text-sm mt-1 text-center">Pilih alat atau bahan, isi form, dan ajukan peminjaman.</p>
                    </div>
                    <div class="p-5 bg-teal-50 rounded-2xl flex flex-col items-center shadow-sm">
                        <div class="text-teal-600 text-3xl mb-3"><i class="fas fa-bell"></i></div>
                        <h4 class="font-semibold text-gray-800">Notifikasi & Pengembalian</h4>
                        <p class="text-gray-600 text-sm mt-1 text-center">Pantau status peminjaman dan lakukan pengembalian tepat waktu.</p>
                    </div>
                </div>
            </div>

            <!-- Accordion -->
            <div class="grid grid-cols-1 gap-6">
                <!-- User -->
                <details
                    class="bg-white rounded-2xl shadow-md p-6 border border-gray-100 open:shadow-lg transition-all duration-500 hover:-translate-y-1"
                    open>
                    <summary class="flex justify-between items-center cursor-pointer text-lg font-semibold text-gray-800">
                        <span><i class="fas fa-user text-cyan-600 mr-2"></i> Panduan untuk User</span>
                        <i class="fas fa-chevron-down text-gray-500"></i>
                    </summary>
                    <div class="mt-4 text-gray-700 space-y-3">
                        <p>Langkah-langkah utama bagi pengguna:</p>
                        <ul class="list-disc ml-6 text-gray-600 leading-relaxed">
                            <li><span class="font-semibold">Login / Register</span> dengan mengisi nama, email, dan password.</li>
                            <li><span class="font-semibold">Akses Dashboard</span> untuk melihat daftar pinjaman, jatuh tempo, dan stok alat.</li>
                            <li><span class="font-semibold">Ajukan Peminjaman</span> dari katalog alat/bahan, lalu tunggu verifikasi admin.</li>
                            <li><span class="font-semibold">Cek Notifikasi</span> untuk status (Disetujui / Ditolak / Dikembalikan).</li>
                            <li><span class="font-semibold">Lihat Riwayat</span> peminjaman atau ubah pengaturan akun Anda.</li>
                        </ul>
                    </div>
                </details>

                <!-- Admin -->
                <details
                    class="bg-white rounded-2xl shadow-md p-6 border border-gray-100 transition-all duration-500 hover:-translate-y-1">
                    <summary class="flex justify-between items-center cursor-pointer text-lg font-semibold text-gray-800">
                        <span><i class="fas fa-user-shield text-blue-600 mr-2"></i> Panduan untuk Admin</span>
                        <i class="fas fa-chevron-down text-gray-500"></i>
                    </summary>
                    <div class="mt-4 text-gray-700 space-y-3">
                        <p>Tugas utama admin dalam mengelola sistem:</p>
                        <ul class="list-disc ml-6 text-gray-600 leading-relaxed">
                            <li><span class="font-semibold">Verifikasi Peminjaman</span> — Setujui atau tolak permintaan peminjaman user.</li>
                            <li><span class="font-semibold">Kelola Pengembalian</span> — Pastikan alat dikembalikan sesuai jadwal.</li>
                            <li><span class="font-semibold">Pantau Dashboard</span> — Lihat statistik peminjaman dan stok alat.</li>
                            <li><span class="font-semibold">Manage User</span> — Edit, hapus, atau aktifkan akun admin/user baru.</li>
                        </ul>
                    </div>
                </details>
            </div>

            <!-- Tips -->
            <div
                class="mt-10 bg-gradient-to-br from-cyan-50 to-white rounded-3xl shadow-md p-8 border border-gray-100 text-center transform hover:-translate-y-2 hover:shadow-2xl transition-all duration-500 ease-out">
                <h4 class="text-xl font-semibold text-gray-800 mb-3">
                    <i class="fas fa-lightbulb text-yellow-500 mr-2"></i> Tips Cepat
                </h4>
                <p class="text-gray-600 max-w-2xl mx-auto leading-relaxed">
                    Cek notifikasi secara rutin untuk pembaruan status peminjaman.
                    Gunakan menu <span class="font-semibold text-cyan-600">Riwayat</span> untuk memantau aktivitas Anda,
                    dan pastikan pengembalian dilakukan tepat waktu agar stok selalu akurat.
                </p>
            </div>
        </div>
    </section>

    <!-- Custom Animation Styles -->
    <style>
        @keyframes float {

            0%,
            100% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-10px);
            }
        }

        .animate-float {
            animation: float 4s ease-in-out infinite;
        }
    </style>

    <!-- Tailwind Custom Animation -->
    <style>
        @keyframes bounce-slow {

            0%,
            100% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-10px);
            }
        }

        .animate-bounce-slow {
            animation: bounce-slow 2s infinite ease-in-out;

            @keyframes float {

                0%,
                100% {
                    transform: translateY(0px);
                }

                50% {
                    transform: translateY(-10px);
                }
            }

            .animate-float {
                animation: float 4s ease-in-out infinite;
            }
        }
    </style>

    <!-- Smooth Scroll -->
    <script>
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    </script>