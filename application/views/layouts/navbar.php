<header class="w-full flex justify-between items-center p-4 bg-[#e5f5fa] shadow">
  <div class="flex items-center space-x-2">
    <button onclick="toggleSidebar()" class="md:hidden p-2 bg-blue-500 text-white rounded">
      ☰
    </button>
    <h1 class="text-2xl font-bold"><?= isset($title) ? $title : 'Halaman'; ?></h1>
  </div>
  
  <div class="flex items-center space-x-2">
    <span class="text-gray-800 font-medium">
      <?= isset($user_name) ? htmlspecialchars($user_name) : 'User'; ?>
    </span>
    <div class="bg-gray-300 rounded-full w-8 h-8 flex items-center justify-center font-bold text-gray-700">
      <?= isset($user_initial) ? htmlspecialchars($user_initial) : 'I'; ?>
    </div>
  </div>
</header>

