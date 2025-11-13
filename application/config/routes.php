<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'landing/index';
$route['register'] = 'auth/register';
$route['dashboard'] = 'dashboard/index';
$route['login'] = 'auth/login';

// route user
// peminjaman
$route['peminjaman'] = 'peminjaman/index';
$route['katalog_alat'] = 'peminjaman/alat';
$route['katalog_bahan'] = 'peminjaman/bahan';

$route['keranjang'] = 'keranjang/index';
$route['riwayat'] = 'riwayat/index';
$route['notifikasi'] = 'notifikasi/index';
$route['bantuan'] = 'bantuan/index';

$route['profile_setting'] = 'UserController/profile';
$route['user/update_password'] = 'UserController/update_password';
// end route user


// route admin
$route['admin'] = 'admin/admin/index';
$route['admin/dashboard_admin'] = 'admin/admin/dashboard';

// Verifikasi Peminjaman
$route['adminpeminjaman/setujui/(:num)'] = 'admin/adminpeminjaman/setujui/$1';
$route['adminpeminjaman/tolak/(:num)'] = 'admin/adminpeminjaman/tolak/$1';
$route['adminpeminjaman/kembalikan/(:num)'] = 'admin/adminpeminjaman/kembalikan/$1';
$route['adminpeminjaman/detail/(:num)'] = 'admin/adminpeminjaman/detail/$1';

// Manajemen alat
$route['admin/katalog_alat'] = 'admin/katalog_alat/index';
$route['admin/katalog_alat/edit/(:num)'] = 'admin/katalog_alat/edit/$1';
$route['admin/katalog_alat/delete/(:num)'] = 'admin/katalog_alat/delete/$1';
$route['admin/katalog_alat/tambah'] = 'admin/katalog_alat/tambah';
$route['admin/katalog_alat/simpan'] = 'admin/katalog_alat/simpan';

// Manajemen bahan
$route['admin/katalog_bahan'] = 'admin/katalog_bahan/index';
$route['admin/katalog_bahan/edit/(:num)'] = 'admin/katalog_bahan/edit/$1';
$route['admin/katalog_bahan/delete/(:num)'] = 'admin/katalog_bahan/delete/$1';
$route['admin/katalog_bahan/tambah'] = 'admin/katalog_bahan/tambah';
$route['admin/katalog_bahan/simpan'] = 'admin/katalog_bahan/simpan';

// Manajemen pengembalian
$route['admin/pengembalian'] = 'admin/pengembalian/index';
$route['admin/pengembalian/kembalikan/(:num)'] = 'admin/pengembalian/kembalikan/$1';
$route['admin/pengembalian/hapus/(:num)'] = 'admin/pengembalian/hapus/$1';
$route['admin/pengembalian/detail/(:num)'] = 'admin/pengembalian/detail/$1';

// Halaman form import
$route['admin/import'] = 'admin/import/index';
$route['admin/import/upload'] = 'admin/import/upload_csv';

// Manajemen User
$route['admin/user'] = 'admin/admin/user';
$route['admin/user_approval'] = 'admin/user_approval/index';
$route['admin/user_approval/approve/(:num)'] = 'admin/user_approval/approve/$1';
$route['admin/user_approval/reject/(:num)'] = 'admin/user_approval/reject/$1';
$route['admin/user_detail/(:num)'] = 'admin/admin/user_detail/$1';
$route['admin/user_edit/(:num)'] = 'admin/admin/user_edit/$1';
$route['admin/user_delete/(:num)'] = 'admin/admin/user_delete/$1';

// Daftar riwayat peminjaman (admin)
$route['admin/daftarRiwayat'] = 'admin/adminpeminjaman/daftarRiwayat';
$route['admin/daftarRiwayat/export'] = 'admin/adminpeminjaman/export_csv';

// 404 Override error
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

