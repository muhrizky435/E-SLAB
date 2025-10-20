<div class="flex items-center justify-center bg-gradient-to-br from-teal-100 to-teal-300 px-4 py-10 w-full">
  <div class="bg-white/20 backdrop-blur-lg shadow-2xl rounded-3xl overflow-hidden flex flex-col md:flex-row w-full max-w-4xl transform transition-all duration-500 hover:scale-[1.02]">

    <!-- Gambar -->
    <div class="hidden md:flex md:w-1/2 items-center justify-center bg-white p-4">
      <img src="<?= base_url('assets/img/photo2.jpg'); ?>" 
           alt="Register Illustration"
           class="w-full max-w-xs transition-transform" />
    </div>

    <!-- Form -->
    <div class="md:w-1/2 bg-white bg-opacity-95 p-6 flex flex-col justify-center">
      <h3 class="text-xl font-extrabold text-teal-600 mb-5 text-center">Daftar E-SLAB</h3>

      <!-- Toast -->
      <?php if (!empty($error)): ?>
        <div id="toast-error" class="fixed top-6 right-6 bg-red-500 text-white px-5 py-3 rounded-lg shadow-lg flex items-center space-x-3 opacity-0 transition-opacity duration-500 z-50">
          <i class="fas fa-times-circle text-xl"></i>
          <span><?= htmlspecialchars($error); ?></span>
        </div>
      <?php elseif ($this->session->flashdata('success')): ?>
        <div id="toast-success" class="fixed top-6 right-6 bg-green-500 text-white px-5 py-3 rounded-lg shadow-lg flex items-center space-x-3 opacity-0 transition-opacity duration-500 z-50">
          <i class="fas fa-check-circle text-xl"></i>
          <span><?= $this->session->flashdata('success'); ?></span>
        </div>
      <?php endif; ?>

      <!-- Form Register -->
      <form method="post" class="grid grid-cols-1 md:grid-cols-2 gap-3" id="registerForm">
        <div>
          <label class="block text-gray-700 font-medium mb-1 text-sm">Nama Lengkap</label>
          <input type="text" name="nama" required
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 text-sm" />
        </div>

        <div>
          <label class="block text-gray-700 font-medium mb-1 text-sm">Username</label>
          <input type="text" name="username" required
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 text-sm" />
        </div>

        <div>
          <label class="block text-gray-700 font-medium mb-1 text-sm">Email</label>
          <input type="email" name="email" required
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 text-sm" />
        </div>

        <div class="relative">
          <label class="block text-gray-700 font-medium mb-1 text-sm">Password</label>
          <input type="password" id="password" name="password" required
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 pr-8 text-sm" />
          <button type="button" id="togglePassword" class="absolute right-2 bottom-1.5 text-gray-500 hover:text-teal-600 focus:outline-none">
            <i class="fas fa-eye text-sm"></i>
          </button>
        </div>

        <div class="relative md:col-span-2">
          <label class="block text-gray-700 font-medium mb-1 text-sm">Konfirmasi Password</label>
          <input type="password" id="confirm_password" name="confirm_password" required
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 pr-8 text-sm" />
        </div>

        <div class="md:col-span-2">
          <label class="block text-gray-700 font-medium mb-1 text-sm">Role</label>
          <select name="role" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 text-sm">
            <option value="user">User</option>
            <option value="admin">Admin</option>
          </select>
          <p class="text-xs text-gray-400 mt-1">Role admin hanya berlaku jika Anda memiliki session admin.</p>
        </div>

        <div class="md:col-span-2">
          <button type="submit"
            class="w-full py-2 bg-teal-600 hover:bg-teal-700 text-white font-bold rounded-lg shadow-md transition-transform transform hover:scale-105 text-sm">
            Daftar
          </button>
        </div>
      </form>

      <p class="text-center text-gray-600 text-xs mt-3">
        Sudah punya akun? 
        <a href="<?= site_url('auth/login'); ?>" class="text-teal-600 font-semibold hover:underline">Login di sini</a>
      </p>

      <p class="text-center text-gray-500 text-xs mt-2">
        &copy; <?= date('Y') ?> E-SLAB. All rights reserved.
      </p>
    </div>
  </div>
</div>

<!-- Script -->
<script>
  const tgl = document.getElementById('togglePassword');
  const pw = document.getElementById('password');
  const confirmPw = document.getElementById('confirm_password');

  tgl.addEventListener('click', () => {
    const type = pw.getAttribute('type') === 'password' ? 'text' : 'password';
    pw.setAttribute('type', type);
    confirmPw.setAttribute('type', type);
    tgl.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
  });

  document.getElementById('registerForm').addEventListener('submit', function(e) {
    if (pw.value !== confirmPw.value) {
      e.preventDefault();
      let toast = document.getElementById('toast-error');
      if (!toast) {
        toast = document.createElement('div');
        toast.id = 'toast-error';
        toast.className = 'fixed top-6 right-6 bg-red-500 text-white px-5 py-3 rounded-lg shadow-lg flex items-center space-x-3 z-50';
        toast.innerHTML = '<i class="fas fa-times-circle text-xl"></i><span>Konfirmasi password tidak cocok.</span>';
        document.body.appendChild(toast);
      }
      toast.classList.add('opacity-100');
      setTimeout(() => toast.classList.remove('opacity-100'), 3000);
    }
  });

  window.addEventListener('load', () => {
    const toastSuccess = document.getElementById('toast-success');
    const toastError = document.getElementById('toast-error');
    if (toastSuccess) {
      setTimeout(() => toastSuccess.classList.add('opacity-100'), 200);
      setTimeout(() => toastSuccess.classList.remove('opacity-100'), 1500);
      setTimeout(() => window.location.href = "<?= site_url('auth/login'); ?>", 1700);
    }
    if (toastError) {
      setTimeout(() => toastError.classList.add('opacity-100'), 100);
      setTimeout(() => toastError.classList.remove('opacity-100'), 3000);
    }
  });
</script>
