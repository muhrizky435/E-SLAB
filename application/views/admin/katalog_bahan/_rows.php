<?php
$no = ($offset ?? 0) + 1;
if (empty($barang)): ?>
  <tr>
    <td colspan="5" class="text-center py-6 text-gray-500">Tidak ada data ditemukan.</td>
  </tr>
  <?php else:
  foreach ($barang as $b): ?>
    <tr class="border-b hover:bg-blue-50 transition">
      <td class="py-3 px-4"><?= $no++; ?></td>
      <td class="py-3 px-4 font-medium"><?= htmlspecialchars($b->kode_barang); ?></td>
      <td class="py-3 px-4"><?= htmlspecialchars($b->nama_barang); ?></td>
      <td class="py-3 px-4 text-center"><?= (int)$b->stok; ?></td>
      <td class="py-3 px-4 text-center">
        <div class="flex flex-wrap justify-center gap-2">
          <a href="<?= site_url('admin/katalog_bahan/edit/' . $b->id_barang); ?>"
            class="flex items-center gap-2 px-3 py-1.5 bg-yellow-400 text-white text-sm rounded-lg hover:bg-yellow-500 transition">
            <i class="fa fa-edit"></i>
            <span class="hidden sm:inline">Edit</span>
          </a>
          <a href="<?= site_url('admin/katalog_bahan/delete/' . $b->id_barang); ?>"
            class="flex items-center gap-2 px-3 py-1.5 bg-red-600 text-white text-sm rounded-lg hover:bg-red-700 transition btn-delete">
            <i class="fa fa-trash"></i>
            <!-- <span class="hidden sm:inline">Hapus</span> -->
          </a>
        </div>
      </td>
    </tr>
<?php endforeach;
endif; ?>