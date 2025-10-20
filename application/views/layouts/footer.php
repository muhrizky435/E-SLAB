</main>
</div>

<!-- JavaScript -->
<script src="<?= base_url('assets/js/app.js'); ?>"></script>
<script>
function closeModal(redirectUrl = null) {
  const modal = document.getElementById('flashModal') || document.getElementById('resultModal');
  if (!modal) return;

  const box = modal.querySelector('.bg-white');
  if (box) box.classList.add('animate-fade-out');
  modal.classList.add('bg-opacity-0');

  setTimeout(() => {
    modal.remove();
    if (redirectUrl) window.location.href = redirectUrl;
  }, 300);
}

// Auto-close modal sukses setelah 2 detik
document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('flashModal') || document.getElementById('resultModal');
  if (modal) {
    const isSuccess = modal.querySelector('.text-green-500, .text-green-600');
    if (isSuccess) {
      setTimeout(() => closeModal("<?= site_url('admin/katalog_alat'); ?>"), 2000);
    }
  }
});
</script>

<!-- Tambahkan animasi CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</body>
</html>
