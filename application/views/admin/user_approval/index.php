<div class="p-2">
    <div class="mb-6">
        <h2 class="text-2xl font-bold text-gray-800">Persetujuan Admin</h2>
        <p class="text-sm text-gray-500 mt-1">Kelola permintaan persetujuan akun admin baru</p>
    </div>

    <?php if ($this->session->flashdata('success')): ?>
    <div class="mb-4 p-4 bg-green-100 text-green-700 rounded-lg">
        <?= $this->session->flashdata('success'); ?>
    </div>
    <?php endif; ?>

    <div class="bg-white rounded-xl shadow-md overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gradient-to-r from-teal-500 to-teal-400">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Nama</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Username</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Email</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Aksi</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <?php if (empty($pending_users)): ?>
                <tr>
                    <td colspan="4" class="px-6 py-4 text-center text-gray-500">
                        Tidak ada permintaan admin yang menunggu persetujuan
                    </td>
                </tr>
                <?php else: ?>
                    <?php foreach ($pending_users as $user): ?>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4"><?= htmlspecialchars($user->nama); ?></td>
                        <td class="px-6 py-4"><?= htmlspecialchars($user->username); ?></td>
                        <td class="px-6 py-4"><?= htmlspecialchars($user->email); ?></td>
                        <td class="px-6 py-4">
                            <div class="flex space-x-2">
                                <a href="<?= site_url('admin/user_approval/approve/'.$user->id_user); ?>" 
                                   class="px-4 py-2 bg-gradient-to-r from-green-500 to-green-400 text-white rounded-lg hover:from-green-600 hover:to-green-500 transition-all duration-200">
                                    Setujui
                                </a>
                                <a href="<?= site_url('admin/user_approval/reject/'.$user->id_user); ?>"
                                   class="px-4 py-2 bg-gradient-to-r from-red-500 to-red-400 text-white rounded-lg hover:from-red-600 hover:to-red-500 transition-all duration-200">
                                    Tolak
                                </a>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>