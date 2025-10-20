<div class="flex items-center justify-center bg-gradient-to-br from-teal-100 to-teal-300 px-4 py-10 w-full">
  <div class="bg-white/20 backdrop-blur-lg shadow-2xl rounded-3xl overflow-hidden flex flex-col md:flex-row w-full max-w-4xl transform transition-all duration-500 hover:scale-[1.02]">

    <!-- Gambar -->
    <div class="hidden md:flex md:w-1/2 items-center justify-center bg-white">
      <img src="<?= base_url('assets/img/photo1.jpg'); ?>"
        alt="Login Illustration"
        class="w-full max-w-xl" />
    </div>

    <!-- Form -->
    <div class="md:w-1/2 bg-white bg-opacity-90 p-10 flex flex-col justify-center">
      <h3 class="text-3xl font-extrabold text-teal-600 mb-6 text-center">Login E-SLAB</h3>

      <!-- Toast -->
      <?php if (!empty($error)): ?>
        <div id="toast-error" class="fixed top-6 right-6 bg-red-500 text-white px-5 py-3 rounded-lg shadow-lg flex items-center space-x-3 opacity-0 transition-opacity duration-500 z-50">
          <i class="fas fa-times-circle text-xl"></i>
          <span><?= $error ?></span>
        </div>
      <?php elseif ($this->session->flashdata('success')): ?>
        <div id="toast-success" class="fixed top-6 right-6 bg-green-500 text-white px-5 py-3 rounded-lg shadow-lg flex items-center space-x-3 opacity-0 transition-opacity duration-500 z-50">
          <i class="fas fa-check-circle text-xl"></i>
          <span><?= $this->session->flashdata('success') ?></span>
        </div>
      <?php endif; ?>

      <!-- Form Login -->
      <form method="post" class="space-y-5">
        <div>
          <label class="block text-gray-700 font-medium mb-2">Username</label>
          <input type="text" name="username" required autofocus
            class="w-full px-5 py-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent transition shadow-sm" />
        </div>

        <div class="relative">
          <label class="block text-gray-700 font-medium mb-2">Password</label>
          <input type="password" id="password" name="password" required
            class="w-full px-5 py-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent transition shadow-sm pr-12" />
          <button type="button" id="togglePassword" class="absolute right-4 bottom-3 text-gray-500 hover:text-teal-600 focus:outline-none">
            <i class="fas fa-eye"></i>
          </button>
        </div>

        <button type="submit"
          class="w-full py-3 bg-teal-600 hover:bg-teal-700 text-white font-bold rounded-xl shadow-lg transition-transform transform hover:scale-105">
          Login
        </button>
      </form>

      <p class="text-center text-gray-600 text-sm mt-4">
        Belum punya akun?
        <a href="<?= site_url('auth/register'); ?>" class="text-teal-600 font-semibold hover:underline">Daftar sekarang</a>
      </p>

      <p class="text-center text-gray-500 text-sm mt-6">
        &copy; <?= date('Y') ?> E-SLAB. All rights reserved.
      </p>
    </div>
  </div>
</div>


<!-- Script -->
<script>
  // Toggle Password
  const togglePassword = document.getElementById('togglePassword');
  const passwordInput = document.getElementById('password');

  togglePassword.addEventListener('click', () => {
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);
    togglePassword.innerHTML = type === 'password' ?
      '<i class="fas fa-eye"></i>' :
      '<i class="fas fa-eye-slash"></i>';
  });

  // Toast animation + Delay redirect
  window.addEventListener('load', () => {
    const toastSuccess = document.getElementById('toast-success');
    const toastError = document.getElementById('toast-error');

    // Jika ada toast success
    if (toastSuccess) {
      // Tampilkan toast
      setTimeout(() => toastSuccess.classList.add('opacity-100'), 200);
      // Hilangkan toast setelah 2 detik
      setTimeout(() => toastSuccess.classList.remove('opacity-100'), 2000);
      // Redirect ke dashboard setelah 2.5 detik

      // Redirect ke dashboard yang sesuai role
      const redirectTo = "<?= $this->session->flashdata('redirect_to') ?? site_url('dashboard'); ?>";
      setTimeout(() => {
        window.location.href = redirectTo;
      }, 2200);
    }

    // Jika ada toast error
    if (toastError) {
      setTimeout(() => toastError.classList.add('opacity-100'), 100);
      setTimeout(() => toastError.classList.remove('opacity-100'), 4000);
    }
  });
</script>