-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2025 at 05:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-slab`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `id_sub_kategori` int(11) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `satuan` varchar(30) DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `stok_minimum` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `id_sub_kategori`, `kode_barang`, `nama_barang`, `deskripsi`, `satuan`, `stok`, `stok_minimum`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'ALT-579', 'Nama Barang', NULL, 'unit', 0, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(2, 1, 'ALT-086', 'Advance Injection Training Arm / Phantom lengan injeksi TEST', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 07:47:55'),
(3, 1, 'ALT-437', 'Advanced Catheterisasi Trainer', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(4, 1, 'ALT-614', 'Airway Training Model', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(5, 1, 'ALT-252', 'Alas Baki', NULL, 'unit', 54, 0, 1, '2025-11-10 00:45:40', '2025-11-10 09:14:36'),
(6, 1, 'ALT-004', 'Alas Kasur', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(7, 1, 'ALT-600', 'Alas Kerja', NULL, 'unit', 57, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(8, 1, 'ALT-425', 'Alat peraga kelainan cervic', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(9, 1, 'ALT-485', 'Alat Peraga Sistem Reproduksi Pria', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(10, 1, 'ALT-940', 'Alat Peraga Sistem Reproduksi Wanita', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(11, 1, 'ALT-811', 'Ambu Bag dewasa', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(12, 1, 'ALT-957', 'Arm Spling', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(13, 1, 'ALT-166', 'Arterial Puncture Arm', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(14, 1, 'ALT-517', 'Arterial Puncture Wrist', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(15, 1, 'ALT-504', 'Auto Klik', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(16, 1, 'ALT-034', 'Baby Incubator', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(17, 1, 'ALT-635', 'Baju bayi', NULL, 'unit', 16, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(18, 1, 'ALT-717', 'Baju ICU Hijau', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(19, 1, 'ALT-765', 'Baju ICU putih', NULL, 'unit', 13, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(20, 1, 'ALT-365', 'Baju Kanguru', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(21, 1, 'ALT-976', 'Baju Pasien', NULL, 'unit', 22, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(22, 1, 'ALT-835', 'Baju Phantom', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(23, 1, 'ALT-941', 'Bak instrumen 20 cm x 10 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(24, 1, 'ALT-880', 'Bak instrumen 21 cm x 8 cm', NULL, 'unit', 53, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(25, 1, 'ALT-885', 'Bak instrumen 22 cm x 12 cm', NULL, 'unit', 57, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(26, 1, 'ALT-007', 'Bak instrumen 22 cm x 15 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(27, 1, 'ALT-380', 'Bak instrumen 25 cm x 13 cm', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(28, 1, 'ALT-910', 'Bak instrumen 26 cm x 15 cm', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(29, 1, 'ALT-619', 'Bak instrumen 30 cm x 20 cm', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(30, 1, 'ALT-100', 'Bak instrumen 31 cm x 20 cm', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(31, 1, 'ALT-804', 'Bak instrumen ukuran 32 cm x 9 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(32, 1, 'ALT-830', 'Bak instrumen ukuran 34 cm x 17 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(33, 1, 'ALT-170', 'Bak instrumen ukuran 37 cm x 18 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(34, 1, 'ALT-528', 'Bak instrumen ukuran 43 cm x 10 cm', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(35, 1, 'ALT-708', 'Bak instrumen ukuran 49 cm x 13 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(36, 1, 'ALT-738', 'Bak mandi bayi', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(37, 1, 'ALT-949', 'Baki', NULL, 'unit', 46, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(38, 1, 'ALT-122', 'Bantal hangat elektrik', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(39, 1, 'ALT-032', 'Bantal simulasi hecting', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(40, 1, 'ALT-075', 'Bantal tidur pasien', NULL, 'unit', 9, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(41, 1, 'ALT-629', 'Baskom bulat plastik diameter 32 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(42, 1, 'ALT-581', 'Baskom bulat plastik diameter 33 cm', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(43, 1, 'ALT-178', 'Baskom bulat plastik diameter 36 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(44, 1, 'ALT-761', 'Baskom bulat plastik diameter 44 cm', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(45, 1, 'ALT-137', 'Baskom bulat stainles diameter 26 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(46, 1, 'ALT-913', 'Baskom bulat stainles diameter 27 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(47, 1, 'ALT-854', 'Baskom bulat stainles diameter 29 cm', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(48, 1, 'ALT-052', 'Baskom bulat stainles diameter 30 cm', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(49, 1, 'ALT-618', 'Baskom bulat stainles diameter 31 cm', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(50, 1, 'ALT-073', 'Baskom bulat stainles diameter 32 cm', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(51, 1, 'ALT-489', 'Baskom bulat stainles diameter 33 cm', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(52, 1, 'ALT-943', 'Baskom bulat stainles diameter 34 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(53, 1, 'ALT-384', 'Baskom bulat stainles diameter 39 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(54, 1, 'ALT-467', 'Baskom bulat stainles diameter 40 cm', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(55, 1, 'ALT-584', 'Baskom bulat stainles diameter 41 cm', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(56, 1, 'ALT-866', 'Baskom bulat stainles diameter 42 cm', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(57, 1, 'ALT-006', 'Baskom kotak ukuran P : 34 CM L : 27 CM T : 9 CM', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(58, 1, 'ALT-698', 'Bed ICU', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(59, 1, 'ALT-003', 'Bed Side Monitor', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(60, 1, 'ALT-638', 'Bedpan stainles', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(61, 1, 'ALT-817', 'Bengkok', NULL, 'unit', 108, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(62, 1, 'ALT-269', 'Blood Warmer', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(63, 1, 'ALT-238', 'Body Infrared Thermometer', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(64, 1, 'ALT-242', 'Body Splint Immobilizer (KED)', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(65, 1, 'ALT-106', 'Botol WSD', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(66, 1, 'ALT-427', 'Boven Laken', NULL, 'unit', 31, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(67, 1, 'ALT-819', 'Box Pemeriksaan SDIDTK', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(68, 1, 'ALT-952', 'Brankard / Emergency Sretcher', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(69, 1, 'ALT-903', 'Breast Pump, Breast Reliever', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(70, 1, 'ALT-924', 'Breast Self Examination Model', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(71, 1, 'ALT-165', 'Buku Bagan Manajemen Terpadu Balita Sakit (MTBS)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(72, 1, 'ALT-732', 'Buku Format Pengkajian Status Kesehatan Keluarga', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(73, 1, 'ALT-448', 'Buku KIA', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(74, 1, 'ALT-047', 'Buku KIE Kesehatan Reproduksi Remaja', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(75, 1, 'ALT-620', 'Buku Model Posyandu', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(76, 1, 'ALT-370', 'Buku Petunjuk Pengisian Family Folder (Asuhan Keperawatan Keluarga)', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(77, 1, 'ALT-037', 'Buku Saku KRR', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(78, 1, 'ALT-476', 'Buli - buli panas', NULL, 'unit', 9, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(79, 1, 'ALT-917', 'Casuality Simulation Kit (Phantom Luka)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(80, 1, 'ALT-125', 'CD Pembelajaran : Alat Reproduksi manusia', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(81, 1, 'ALT-139', 'Celana bayi', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(82, 1, 'ALT-315', 'Celana Dalam dewasa (wanita)', NULL, 'unit', 20, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(83, 1, 'ALT-074', 'Celemek / Apron', NULL, 'unit', 18, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(84, 1, 'ALT-344', 'Celemek makan bayi', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(85, 1, 'ALT-560', 'Cermin', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(86, 1, 'ALT-499', 'Chest Drain & Needle Decompresion Trainer', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(87, 1, 'ALT-310', 'Circulation Pump', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(88, 1, 'ALT-565', 'Complete Auscultation Training System', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(89, 1, 'ALT-807', 'Cutdown Pad', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(90, 1, 'ALT-321', 'Decubitus Treatment Model', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(91, 1, 'ALT-347', 'Doppler', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(92, 1, 'ALT-992', 'Duk Bolong', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(93, 1, 'ALT-792', 'Ember plastik', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(94, 1, 'ALT-623', 'Eskap / Ice bag / Kirbat Es', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(95, 1, 'ALT-970', 'ETT (Endotracheal Tube)', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(96, 1, 'ALT-062', 'Fetal Monitor', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(97, 1, 'ALT-633', 'Food Model', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(98, 1, 'ALT-669', 'Gambar / Chart untuk PBM', NULL, 'unit', 49, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(99, 1, 'ALT-677', 'Garputala', NULL, 'unit', 34, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(100, 1, 'ALT-741', 'Gayung', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(101, 1, 'ALT-461', 'GCHB', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(102, 1, 'ALT-031', 'GCU', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(103, 1, 'ALT-527', 'Gelas plastik / Gelas kumur', NULL, 'unit', 29, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(104, 1, 'ALT-997', 'Gelas Ukur Hb', NULL, 'unit', 9, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(105, 1, 'ALT-653', 'Gendongan kanguru', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(106, 1, 'ALT-265', 'Gliserin Spuit', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(107, 1, 'ALT-286', 'Glukosmeter Family dr', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(108, 1, 'ALT-983', 'Gunting biasa', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(109, 1, 'ALT-208', 'Gunting Efisiotomi', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(110, 1, 'ALT-502', 'Gunting Jaringan', NULL, 'unit', 24, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(111, 1, 'ALT-934', 'Gunting Kuku', NULL, 'unit', 29, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(112, 1, 'ALT-507', 'Gunting Perban / Lister Bandage Scissors', NULL, 'unit', 32, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(113, 1, 'ALT-311', 'Gunting Runcing', NULL, 'unit', 33, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(114, 1, 'ALT-025', 'Gunting Tali Pusat', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(115, 1, 'ALT-516', 'Gunting Up Heacting', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(116, 1, 'ALT-549', 'Gurita Ibu', NULL, 'unit', 16, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(117, 1, 'ALT-121', 'Handuk Besar', NULL, 'unit', 75, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(118, 1, 'ALT-044', 'Handuk Kerja (putih)', NULL, 'unit', 70, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(119, 1, 'ALT-514', 'Handuk Kerja (warna)', NULL, 'unit', 30, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(120, 1, 'ALT-810', 'HB meter Family dr', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(121, 1, 'ALT-512', 'Hb Sahli (Lengkap)', NULL, 'unit', 36, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(122, 1, 'ALT-409', 'Head Immobilizer', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(123, 1, 'ALT-531', 'Helm Lacover', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(124, 1, 'ALT-541', 'Ice Pack', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(125, 1, 'ALT-405', 'Infant Arm', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(126, 1, 'ALT-684', 'Infant Training Leg', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(127, 1, 'ALT-788', 'Infant warmer', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(128, 1, 'ALT-757', 'Injection Trainer (IM)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(129, 1, 'ALT-959', 'Instrumen Simulasi, Deteksi dan Intervensi Dini Tumbuh Kembang Anak', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(130, 1, 'ALT-534', 'Intramuscular Injection Aid', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(131, 1, 'ALT-301', 'Intravenous Injection Arm', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(132, 1, 'ALT-263', 'Irrigator huknah diameter 12 cm', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(133, 1, 'ALT-685', 'IUD Kit (Pemasangan dan Pencabutan IUD)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(134, 1, 'ALT-254', 'IUD Removal Hook', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(135, 1, 'ALT-213', 'IUD String Retriever', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(136, 1, 'ALT-233', 'Jas lab', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(137, 1, 'ALT-067', 'Kabel panjang (terminal)', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(138, 1, 'ALT-597', 'Kacamata Pelindung (Google)', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(139, 1, 'ALT-283', 'Kain panjang (tapi)', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(140, 1, 'ALT-234', 'Kain parnel', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(141, 1, 'ALT-718', 'Kain tempat linen kotor', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(142, 1, 'ALT-818', 'Kain untuk sterilisasi', NULL, 'unit', 20, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(143, 1, 'ALT-369', 'Kalender Masa subur & tidak subur', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(144, 1, 'ALT-569', 'Kaos dalam bayi', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(145, 1, 'ALT-673', 'Karpet Puzzle', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(146, 1, 'ALT-604', 'Kartu E Untuk Tes Daya Lihat', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(147, 1, 'ALT-460', 'Keranjang alat tenun kotor', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(148, 1, 'ALT-236', 'Kipas angin berdiri', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(149, 1, 'ALT-640', 'Klem Arteri / pean lurus', NULL, 'unit', 19, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(150, 1, 'ALT-852', 'Klem Arteri bengkok / mosquito', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(151, 1, 'ALT-459', 'Klem kocher lurus (besar)', NULL, 'unit', 40, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(152, 1, 'ALT-377', 'Klem kocher lurus (kecil)', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(153, 1, 'ALT-870', 'Klem tali pusat', NULL, 'unit', 23, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(154, 1, 'ALT-391', 'KMS (Kartu Menuju Sehat)', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(155, 1, 'ALT-128', 'Kom diameter 10 cm', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(156, 1, 'ALT-398', 'Kom diameter 12 cm', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(157, 1, 'ALT-346', 'Kom diameter 14 cm', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(158, 1, 'ALT-613', 'Kom diameter 15 cm', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(159, 1, 'ALT-330', 'Kom diameter 16 cm', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(160, 1, 'ALT-111', 'Kom diameter 17 cm', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(161, 1, 'ALT-932', 'Kom diameter 22 cm', NULL, 'unit', 15, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(162, 1, 'ALT-009', 'Kom diameter 6 cm', NULL, 'unit', 35, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(163, 1, 'ALT-921', 'Kom diameter 7 cm', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(164, 1, 'ALT-069', 'Kom diameter 8 cm', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(165, 1, 'ALT-664', 'Kom diameter 9 cm', NULL, 'unit', 39, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(166, 1, 'ALT-759', 'Kom melamin diameter 5 cm', NULL, 'unit', 59, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(167, 1, 'ALT-902', 'Kom melamin diameter 6 cm', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(168, 1, 'ALT-484', 'Kom melamin diameter 8 cm', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(169, 1, 'ALT-362', 'Kom Sputum', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(170, 1, 'ALT-838', 'Korentang', NULL, 'unit', 15, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(171, 1, 'ALT-851', 'Kursi roda', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(172, 1, 'ALT-858', 'Laci pasien', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(173, 1, 'ALT-222', 'Laken', NULL, 'unit', 31, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(174, 1, 'ALT-773', 'Laken Anak', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(175, 1, 'ALT-374', 'Laken Bayi', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(176, 1, 'ALT-530', 'Lampu Infrared', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(177, 1, 'ALT-155', 'Lampu sorot', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(178, 1, 'ALT-814', 'Lap Kerja', NULL, 'unit', 14, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(179, 1, 'ALT-705', 'Laringoskop', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(180, 1, 'ALT-331', 'Laryngoscope Set', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(181, 1, 'ALT-526', 'Leaflet - Leaflet', NULL, 'unit', 71, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(182, 1, 'ALT-316', 'Lembar balik untuk konseling', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(183, 1, 'ALT-449', 'Lenghtboard', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(184, 1, 'ALT-394', 'Long Spine Board', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(185, 1, 'ALT-598', 'Mainan Anak', NULL, 'unit', 20, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(186, 1, 'ALT-282', 'Masker oksigen sederhana (anak)', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(187, 1, 'ALT-483', 'Masker oksigen sederhana (dewasa)', NULL, 'unit', 13, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(188, 1, 'ALT-575', 'Masker Oksigen Venturi', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(189, 1, 'ALT-767', 'Mathieu Nald Poeder', NULL, 'unit', 13, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(190, 1, 'ALT-914', 'Matras', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(191, 1, 'ALT-363', 'Mayo / Gudel / OPA (anak)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(192, 1, 'ALT-354', 'Mayo / Gudel / OPA (dewasa)', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(193, 1, 'ALT-259', 'Mesin EKG', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(194, 1, 'ALT-389', 'Mesin Suction', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(195, 1, 'ALT-462', 'Metal kateter', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(196, 1, 'ALT-973', 'Metline', NULL, 'unit', 49, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(197, 1, 'ALT-585', 'Mikrotoa', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(198, 1, 'ALT-438', 'Mitela', NULL, 'unit', 97, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(199, 1, 'ALT-920', 'Model Gigi', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(200, 1, 'ALT-674', 'Model Otot', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(201, 1, 'ALT-813', 'Monoaural', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(202, 1, 'ALT-054', 'Mucus extractor', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(203, 1, 'ALT-790', 'Multifunction Infrared Thermometer', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(204, 1, 'ALT-320', 'Nald Poeder', NULL, 'unit', 32, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(205, 1, 'ALT-695', 'Nasopharingeal Tube', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(206, 1, 'ALT-229', 'Nebulizer', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(207, 1, 'ALT-387', 'Nebulizer Ultrasonic', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(208, 1, 'ALT-901', 'Neck Colar', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(209, 1, 'ALT-837', 'Neonatal Simulator With Smart Skin Technology', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(210, 1, 'ALT-444', 'Nurse Training Baby, New Born', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(211, 1, 'ALT-266', 'Opthalmoscope', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(212, 1, 'ALT-982', 'Otoscope', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(213, 1, 'ALT-319', 'Ovarium Klem', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(214, 1, 'ALT-278', 'Over Laken', NULL, 'unit', 19, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(215, 1, 'ALT-145', 'Papan flipchart', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(216, 1, 'ALT-701', 'Papan penunjuk meja posyandu', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(217, 1, 'ALT-329', 'Particulate Respirator', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(218, 1, 'ALT-119', 'Partus Set', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(219, 1, 'ALT-209', 'Pediatric Nurse Training Newborn', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(220, 1, 'ALT-542', 'Pegangan pisau/ Handle Surgical Knife', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(221, 1, 'ALT-417', 'Penggerus Obat', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(222, 1, 'ALT-051', 'Pengukur LILA', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(223, 1, 'ALT-245', 'Pengukur Luka / Penggaris Luka', NULL, 'unit', 35, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(224, 1, 'ALT-779', 'Penlight', NULL, 'unit', 36, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(225, 1, 'ALT-361', 'Penyedot / Set HB Sahli (tidak ada angka)', NULL, 'unit', 13, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(226, 1, 'ALT-899', 'Peraga Alat dan Obat Kontrasepsi', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(227, 1, 'ALT-981', 'Peraga heacting perinium kain', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(228, 1, 'ALT-133', 'Perlak besar', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(229, 1, 'ALT-014', 'Perlak dengan kain di sampingnya', NULL, 'unit', 13, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(230, 1, 'ALT-775', 'Phantom bayi', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(231, 1, 'ALT-446', 'Phantom Birthing Station Simulator', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(232, 1, 'ALT-626', 'Phantom EVA Pelvic Teaching Model / EVA Gynecologic Manikin (Phantom Reproduksi Wanita)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(233, 1, 'ALT-068', 'Phantom Female Catheterization Simulator (Phantom Kateterisasi Wanita)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(234, 1, 'ALT-078', 'Phantom heacting silikon', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(235, 1, 'ALT-939', 'Phantom Ibu Hamil / Noelle Maternal And Neonatal Birth Simulator With PEDI Blue Note', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(236, 1, 'ALT-529', 'Phantom Injeksi IM / Gluteal Intramuscular Injection Model II', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(237, 1, 'ALT-556', 'Phantom Kerangka Panggul dan kepala bayi / Childbirth Demonstration Pelvis', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(238, 1, 'ALT-020', 'Phantom Kerangka Panggul dan kepala bayi / Pelvic Bone with Fetal Heads On Stand', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(239, 1, 'ALT-900', 'Phantom Laserasi Perinium / Episiotomy Suturing Simulator', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(240, 1, 'ALT-183', 'Phantom lengan dewasa (IV IM SC IC)', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(241, 1, 'ALT-785', 'Phantom lengan dewasa IV', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(242, 1, 'ALT-855', 'Phantom Lengan Infus', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(243, 1, 'ALT-472', 'Phantom Life Form\'s (Phantom Ventilasi)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(244, 1, 'ALT-081', 'Phantom Luka (karet)', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(245, 1, 'ALT-667', 'Phantom Luka (kayu)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(246, 1, 'ALT-000', 'Phantom Male Catheterization Simulator (Phantom Kateterisasi Pria)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(247, 1, 'ALT-801', 'Phantom Model Vagina', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(248, 1, 'ALT-825', 'Phantom Palpasi Abdomen / Obstetrical Manikin', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(249, 1, 'ALT-011', 'Phantom payudara (kayu)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(250, 1, 'ALT-477', 'Phantom Pemasangan ETT (EndoTracheal Tube)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(251, 1, 'ALT-918', 'Phantom Pemasangan Tracheostomy', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(252, 1, 'ALT-312', 'Phantom Pembukaan Serviks / Cervical Dilatation / Effacement Simulator', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(253, 1, 'ALT-084', 'Phantom Peraga Pelatihan Pemasangan dan Pencabutan Implant', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(254, 1, 'ALT-455', 'Phantom Peraga Pelatihan Pemasangan dan Pencabutan IUD', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(255, 1, 'ALT-993', 'Phantom Perawatan Colostomi dan Pemasangan NGT Bayi', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(256, 1, 'ALT-066', 'Phantom Perawatan payudara (kain)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(257, 1, 'ALT-077', 'Phantom Perawatan payudara (karet)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(258, 1, 'ALT-687', 'Phantom Persalinan / Advanced Childbirth Simulator', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(259, 1, 'ALT-642', 'Phantom Prostate Examination Simulator', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(260, 1, 'ALT-683', 'Phantom Rectum Reservoir', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(261, 1, 'ALT-248', 'Phantom Resusitasi Bayi', NULL, 'unit', 11, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(262, 1, 'ALT-985', 'Phantom RJP Brayden', NULL, 'unit', 0, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(263, 1, 'ALT-599', 'Phantom RJP Human Care', NULL, 'unit', 0, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(264, 1, 'ALT-724', 'Phantom RJP Laerdal', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(265, 1, 'ALT-912', 'Phantom RJP Prestan (Manual)', NULL, 'unit', 0, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(266, 1, 'ALT-171', 'Phantom Simulator Intravenous Arm II Full Set', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(267, 1, 'ALT-725', 'Phantom Utuh / Patient Care Simulator Sakura II', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(268, 1, 'ALT-053', 'Pinset Anatomis / Forceps Dressing', NULL, 'unit', 86, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(269, 1, 'ALT-925', 'Pinset siku', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(270, 1, 'ALT-359', 'Pinset Sirugis / Forceps Tissue', NULL, 'unit', 116, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(271, 1, 'ALT-285', 'Pispot / Urinal laki-laki', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(272, 1, 'ALT-501', 'Pispot / Urinal perempuan', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(273, 1, 'ALT-590', 'Pispot Anak / Potty', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(274, 1, 'ALT-040', 'Pneumothorax Trainer', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(275, 1, 'ALT-709', 'Popok bayi', NULL, 'unit', 31, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(276, 1, 'ALT-582', 'Poster - Poster', NULL, 'unit', 13, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(277, 1, 'ALT-481', 'Reflek hammer', NULL, 'unit', 23, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(278, 1, 'ALT-592', 'Restrain', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(279, 1, 'ALT-383', 'Safety Box', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(280, 1, 'ALT-492', 'Sarung bantal', NULL, 'unit', 32, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(281, 1, 'ALT-794', 'Sarung bantal bayi', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(282, 1, 'ALT-979', 'Sarung guling bayi', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(283, 1, 'ALT-479', 'Sarung kaki bayi', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(284, 1, 'ALT-411', 'Sarung pasien kotak\"', NULL, 'unit', 19, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(285, 1, 'ALT-700', 'Sarung tangan bayi', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(286, 1, 'ALT-506', 'Scalpel', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(287, 1, 'ALT-566', 'Scoop Strecher', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(288, 1, 'ALT-172', 'Selang / Kanul Nasal Anak', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(289, 1, 'ALT-603', 'Selang / Kanul Nasal Dewasa', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(290, 1, 'ALT-557', 'Selang penghubung sungkup', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(291, 1, 'ALT-511', 'Selimut bayi', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(292, 1, 'ALT-659', 'Selimut Lurik besar', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(293, 1, 'ALT-691', 'Selimut Lurik kecil', NULL, 'unit', 22, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(294, 1, 'ALT-735', 'Selimut Wol Kembang', NULL, 'unit', 16, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(295, 1, 'ALT-364', 'Sepatu Boot', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(296, 1, 'ALT-803', 'Set Curretage', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(297, 1, 'ALT-707', 'Set Implant (Pemasangan dan Pencabutan Implant)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(298, 1, 'ALT-120', 'Setengah kocher', NULL, 'unit', 18, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(299, 1, 'ALT-636', 'Sikat', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(300, 1, 'ALT-555', 'Snellen Chart', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(301, 1, 'ALT-415', 'Sonde Uterus', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(302, 1, 'ALT-518', 'Spalk', NULL, 'unit', 23, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(303, 1, 'ALT-666', 'Spekulum cusco ukuran M', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(304, 1, 'ALT-102', 'Spine Board', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(305, 1, 'ALT-897', 'Standar Infus bed', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(306, 1, 'ALT-681', 'Standar Infus mobile', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(307, 1, 'ALT-658', 'Stat Baby', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(308, 1, 'ALT-243', 'Sterilisator Listrik (basah)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(309, 1, 'ALT-201', 'Sterilisator Listrik (kering)', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(310, 1, 'ALT-860', 'Stetoskop Anak', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(311, 1, 'ALT-935', 'Stetoskop Bayi', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(312, 1, 'ALT-878', 'Stetoskop Dewasa Double / Stetoskop Pendidikan', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(313, 1, 'ALT-950', 'Stetoskop Dewasa Mono', NULL, 'unit', 16, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(314, 1, 'ALT-503', 'Stetoskop Dewasa Mono (Cardiology Stehoscope)', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(315, 1, 'ALT-424', 'Stetoskop Dewasa Mono (Classic Stehoscope)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(316, 1, 'ALT-686', 'Stik Laken', NULL, 'unit', 22, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(317, 1, 'ALT-239', 'Stik Laken Bayi', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(318, 1, 'ALT-991', 'Stoma Care Torso/Ostomy Nursing Model', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(319, 1, 'ALT-969', 'Tabung Oksigen', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(320, 1, 'ALT-593', 'Tali Karamantel Besar', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(321, 1, 'ALT-118', 'Tali Karamantel Kecil', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(322, 1, 'ALT-809', 'Tangga untuk naik ke bed', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(323, 1, 'ALT-194', 'Tas Emergency', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(324, 1, 'ALT-400', 'Tas PHN KIT besar', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(325, 1, 'ALT-176', 'Tas PHN Kit kecil', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(326, 1, 'ALT-250', 'Tempat air untuk cuci tangan', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(327, 1, 'ALT-216', 'Tempat kapas alkohol dengan tutup', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(328, 1, 'ALT-012', 'Tempat Korentang', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(329, 1, 'ALT-911', 'Tempat sabun batang', NULL, 'unit', 9, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(330, 1, 'ALT-789', 'Tempat sampah injak', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(331, 1, 'ALT-474', 'Tempat sampah plastik', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(332, 1, 'ALT-272', 'Tempat tidur / boks bayi', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(333, 1, 'ALT-678', 'Tempat tidur anak', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(334, 1, 'ALT-643', 'Tempat tidur biasa', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(335, 1, 'ALT-445', 'Tempat tidur dengan pengaturan putar', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(336, 1, 'ALT-639', 'Tempat tidur elektrik', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(337, 1, 'ALT-017', 'Tempat tidur gynekologi / Gynecological Examination Table', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(338, 1, 'ALT-443', 'Tempat Tissu (bulat)', NULL, 'unit', 16, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(339, 1, 'ALT-728', 'Tenakulum / Kogeltang', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(340, 1, 'ALT-570', 'Tensimeter Air Raksa', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(341, 1, 'ALT-134', 'Tensimeter Air Raksa mobile / Mobile Sphygmomanometer', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(342, 1, 'ALT-999', 'Tensimeter Anaeroid (jarum) / Aneroid Sphygmomanometer', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(343, 1, 'ALT-223', 'Tensimeter Anak', NULL, 'unit', 8, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(344, 1, 'ALT-986', 'Termometer air', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(345, 1, 'ALT-589', 'Termometer air raksa', NULL, 'unit', 25, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(346, 1, 'ALT-786', 'Termometer digital', NULL, 'unit', 13, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(347, 1, 'ALT-439', 'Termos Imunisasi Besar / Cool box', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(348, 1, 'ALT-927', 'Termos Imunisasi Kecil', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(349, 1, 'ALT-453', 'Timbangan Bayi', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(350, 1, 'ALT-244', 'Timbangan BB kotak', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(351, 1, 'ALT-694', 'Timbangan Emas', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(352, 1, 'ALT-318', 'Tongkat dengan ujung karet', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(353, 1, 'ALT-181', 'Tongue spatel', NULL, 'unit', 57, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(354, 1, 'ALT-856', 'Topi bayi', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(355, 1, 'ALT-123', 'Topi ICU', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(356, 1, 'ALT-627', 'Tourniquet', NULL, 'unit', 26, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(357, 1, 'ALT-306', 'Tracheostomy', NULL, 'unit', 3, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(358, 1, 'ALT-842', 'Trauma Manikin', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(359, 1, 'ALT-480', 'Trauma Manikin/Ultimate Hurt', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(360, 1, 'ALT-309', 'Trauma Manikin/Ultimate Hurtfull Body', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(361, 1, 'ALT-275', 'Trocart IUD', NULL, 'unit', 10, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(362, 1, 'ALT-303', 'Troli', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(363, 1, 'ALT-931', 'Troli + standar baskom double / Trolley Dressing With Drawer', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(364, 1, 'ALT-063', 'Troli dengan laci susun didalam / Medicine Trolley', NULL, 'unit', 6, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(365, 1, 'ALT-915', 'Troli Emergency', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(366, 1, 'ALT-403', 'Tromol Kapas', NULL, 'unit', 4, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(367, 1, 'ALT-126', 'Tromol Kassa', NULL, 'unit', 7, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(368, 1, 'ALT-271', 'Tutup Gelas Stainles', NULL, 'unit', 17, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(369, 1, 'ALT-260', 'Urinal tertutup (plastik)', NULL, 'unit', 2, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(370, 1, 'ALT-948', 'Urinal tertutup (stainles)', NULL, 'unit', 5, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(371, 1, 'ALT-494', 'Vacuum Extractor', NULL, 'unit', 1, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(372, 1, 'ALT-539', 'Wound Closure Pad Light', NULL, 'unit', 12, 0, 1, '2025-11-10 00:45:40', '2025-11-10 00:45:40'),
(373, 3, 'BHN-KP-809', 'Alcohol 70% (100ml)', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(374, 3, 'BHN-KP-829', 'Alcohol 70% (1L)', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(375, 3, 'BHN-KP-541', 'Alcohol swab', NULL, 'pcs', 7099, 0, 1, '2025-11-10 00:46:14', '2025-11-10 09:00:59'),
(376, 3, 'BHN-KP-401', 'Alginate dressing', NULL, 'lembar', 2, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(377, 3, 'BHN-KP-438', 'Aquabidest 25ml', NULL, 'botol', 63, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(378, 3, 'BHN-KP-610', 'Aquadest (1L)', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(379, 3, 'BHN-KP-839', 'Aquadest 500ml', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(380, 3, 'BHN-KP-621', 'Arm Spling L', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(381, 3, 'BHN-KP-329', 'Arm Spling M', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(382, 3, 'BHN-KP-768', 'Baby oil', NULL, 'botol', 22, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(383, 3, 'BHN-KP-033', 'Baju Hazmat', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(384, 3, 'BHN-KP-548', 'Baju Pasien', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(385, 3, 'BHN-KP-022', 'Balok yoga', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(386, 3, 'BHN-KP-503', 'Baterai 9 volt', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(387, 3, 'BHN-KP-830', 'Baterai besar', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(388, 3, 'BHN-KP-049', 'Baterai size AA', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(389, 3, 'BHN-KP-928', 'Baterai size AAA', NULL, 'buah', 38, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(390, 3, 'BHN-KP-198', 'Bayclin', NULL, 'botol', 11, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(391, 3, 'BHN-KP-194', 'Bayclin 1L', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(392, 3, 'BHN-KP-195', 'Benang jahit catgut chromic tanpa needle', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(393, 3, 'BHN-KP-701', 'Benang jahit catgut chromic with needle', NULL, 'pcs', 11, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(394, 3, 'BHN-KP-881', 'Benang jahit catgut plain tanpa needle', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(395, 3, 'BHN-KP-807', 'Benang jahit catgut plain with needle', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(396, 3, 'BHN-KP-058', 'Benang jahit nylon', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(397, 3, 'BHN-KP-551', 'Benang jahit Siede Silk', NULL, 'roll', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(398, 3, 'BHN-KP-388', 'Benang Jahit Silk Braided with needle', NULL, 'pcs', 8, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(399, 3, 'BHN-KP-652', 'Betadine Cair', NULL, 'botol', 15, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(400, 3, 'BHN-KP-029', 'Betadine Cair 1L', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(401, 3, 'BHN-KP-633', 'Betadine mothwash 190ml', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(402, 3, 'BHN-KP-563', 'Betadine salep', NULL, 'tube', 13, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(403, 3, 'BHN-KP-186', 'Betadine vaginal douche 100 ml (+aplikator)', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(404, 3, 'BHN-KP-692', 'Betadine vaginal douche 225 ml (tanpa aplikator)', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(405, 3, 'BHN-KP-068', 'Bib celemek', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(406, 3, 'BHN-KP-612', 'Bisturi', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(407, 3, 'BHN-KP-818', 'blood cholesterol test strip / stick kolesterol (easy touch)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(408, 3, 'BHN-KP-748', 'blood cholesterol test strip / stick kolesterol (Family Dr)', NULL, 'pcs', 20, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(409, 3, 'BHN-KP-303', 'blood glucose test strip / stick gula darah (easy touch)', NULL, 'pcs', 50, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(410, 3, 'BHN-KP-822', 'blood Hemoglobin (HB) / stick hemoglobin family dr', NULL, 'pcs', 100, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(411, 3, 'BHN-KP-496', 'blood Hemoglobin (HB) / stick hemoglobin test strip Easy Touch', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(412, 3, 'BHN-KP-234', 'Blood lancet', NULL, 'pcs', 700, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(413, 3, 'BHN-KP-493', 'blood uric acid / stick asam urat test strip easy touch', NULL, 'pcs', 100, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(414, 3, 'BHN-KP-155', 'Bola', NULL, 'buah', 24, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(415, 3, 'BHN-KP-406', 'Boneka tangan', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(416, 3, 'BHN-KP-294', 'Buku Notebook', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(417, 3, 'BHN-KP-264', 'Buku Tulis', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(418, 3, 'BHN-KP-215', 'Cakram kalender kehamilan', NULL, 'buah', 16, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(419, 3, 'BHN-KP-597', 'Caladine lotion', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(420, 3, 'BHN-KP-801', 'Catheter 3 way no 18', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(421, 3, 'BHN-KP-392', 'Catheter 3 way no 20', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(422, 3, 'BHN-KP-449', 'Catheter no.10', NULL, 'buah', 23, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(423, 3, 'BHN-KP-175', 'Catheter no.12', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(424, 3, 'BHN-KP-773', 'Catheter no.14', NULL, 'buah', 20, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(425, 3, 'BHN-KP-427', 'Catheter no.16', NULL, 'buah', 95, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(426, 3, 'BHN-KP-709', 'Catheter no.18', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(427, 3, 'BHN-KP-904', 'Catheter no.20', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(428, 3, 'BHN-KP-483', 'Catheter No.6', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(429, 3, 'BHN-KP-347', 'Catheter no.8', NULL, 'buah', 29, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(430, 3, 'BHN-KP-443', 'Celana dalam', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14'),
(431, 3, 'BHN-KP-444', 'Colostomy bag / Kantong kolostomi anak', NULL, 'pcs', 100, 0, 1, '2025-11-10 00:46:14', '2025-11-10 00:46:14');
INSERT INTO `barang` (`id_barang`, `id_sub_kategori`, `kode_barang`, `nama_barang`, `deskripsi`, `satuan`, `stok`, `stok_minimum`, `is_active`, `created_at`, `updated_at`) VALUES
(432, 3, 'BHN-KP-815', 'Colostomy bag / Kantong kolostomi dewasa', NULL, 'pcs', 54, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(433, 3, 'BHN-KP-024', 'Colostomy bag alcare', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(434, 3, 'BHN-KP-243', 'Colostomy clamp', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(435, 3, 'BHN-KP-488', 'Corong', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(436, 3, 'BHN-KP-775', 'Cotton Bud', NULL, 'pcs', 85, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(437, 3, 'BHN-KP-258', 'Cuka/asam acetat', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(438, 3, 'BHN-KP-452', 'Cup feeding', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(439, 3, 'BHN-KP-620', 'D 10% 500ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(440, 3, 'BHN-KP-713', 'D 5% 500ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(441, 3, 'BHN-KP-984', 'D40% 25ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(442, 3, 'BHN-KP-914', 'Daryantulle / Sofratulle', NULL, 'lembar', 13, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(443, 3, 'BHN-KP-513', 'Docare keramas instant', NULL, 'buah', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(444, 3, 'BHN-KP-508', 'Dot', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(445, 3, 'BHN-KP-109', 'Duk Lubang', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(446, 3, 'BHN-KP-776', 'Esensial oil', NULL, 'botol', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(447, 3, 'BHN-KP-007', 'ETT (Endotracheal Tube) no. 6,5', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(448, 3, 'BHN-KP-690', 'ETT (Endotracheal Tube) no. 7', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(449, 3, 'BHN-KP-856', 'ETT (Endotracheal Tube) no. 7,5', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(450, 3, 'BHN-KP-132', 'Face Mask / masker', NULL, 'pcs', 745, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(451, 3, 'BHN-KP-885', 'Face shield', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(452, 3, 'BHN-KP-070', 'Gel Kompres/Gel pack', NULL, 'buah', 11, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(453, 3, 'BHN-KP-202', 'Gelang pasien biru', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(454, 3, 'BHN-KP-547', 'Gelang pasien kuning', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(455, 3, 'BHN-KP-668', 'Gelang pasien merah', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(456, 3, 'BHN-KP-607', 'Gelang pasien pink', NULL, 'buah', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(457, 3, 'BHN-KP-717', 'Gelang pasien putih', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(458, 3, 'BHN-KP-084', 'Gelas ukur obat', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(459, 3, 'BHN-KP-450', 'Gliserin 100 ml', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(460, 3, 'BHN-KP-362', 'GOM (Boraks Gliserin) 8ml', NULL, 'botol', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(461, 3, 'BHN-KP-697', 'Goniometer', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(462, 3, 'BHN-KP-824', 'Gunting Kuku', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(463, 3, 'BHN-KP-174', 'Hand body lotion', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(464, 3, 'BHN-KP-328', 'Hand body lotion serum 300', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(465, 3, 'BHN-KP-991', 'Hands coen disposible uk.L', NULL, 'pasang', 800, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(466, 3, 'BHN-KP-207', 'Hands coen disposible uk.M', NULL, 'pasang', 1750, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(467, 3, 'BHN-KP-558', 'Hands coen disposible uk.S', NULL, 'pasang', 850, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(468, 3, 'BHN-KP-154', 'Hands coen disposible uk.XL', NULL, 'pasang', 50, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(469, 3, 'BHN-KP-959', 'Hands coen RT', NULL, 'pasang', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(470, 3, 'BHN-KP-335', 'Hands coen steril uk. 6,5', NULL, 'pasang', 416, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(471, 3, 'BHN-KP-331', 'Hands coen steril uk. 7', NULL, 'pasang', 677, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(472, 3, 'BHN-KP-564', 'Hands coen steril uk. 8', NULL, 'pasang', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(473, 3, 'BHN-KP-158', 'Hands coen steril uk.7,5', NULL, 'pasang', 399, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(474, 3, 'BHN-KP-948', 'Handsanitizer 100ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(475, 3, 'BHN-KP-698', 'Handsanitizer 5 L', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(476, 3, 'BHN-KP-341', 'Handsanitizer 500ml', NULL, 'botol', 34, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(477, 3, 'BHN-KP-120', 'Handscoen kain', NULL, 'pasang', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(478, 3, 'BHN-KP-800', 'Handuk baju', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(479, 3, 'BHN-KP-404', 'Handuk besar', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(480, 3, 'BHN-KP-374', 'Handuk kerja cuci tangan', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(481, 3, 'BHN-KP-844', 'Handuk rambut', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(482, 3, 'BHN-KP-369', 'HCG Urine pregnancy test', NULL, 'pcs', 250, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(483, 3, 'BHN-KP-054', 'HCl 0,1', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(484, 3, 'BHN-KP-213', 'Head cap', NULL, 'pcs', 247, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(485, 3, 'BHN-KP-728', 'Heparin Sodium', NULL, 'vial', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(486, 3, 'BHN-KP-868', 'Hibiscrub 500 ml', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(487, 3, 'BHN-KP-749', 'Humidifier', NULL, '', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(488, 3, 'BHN-KP-137', 'Hydrocoloid', NULL, 'lembar', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(489, 3, 'BHN-KP-848', 'Hydrogel dressing', NULL, 'lembar', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(490, 3, 'BHN-KP-715', 'Ice Bag kompres', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(491, 3, 'BHN-KP-440', 'Implant plus inserter', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(492, 3, 'BHN-KP-324', 'Infus set 15 drops', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(493, 3, 'BHN-KP-278', 'Infus set 20 drops', NULL, 'buah', 117, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(494, 3, 'BHN-KP-696', 'Infus set Blood Tranfusi set', NULL, 'buah', 69, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(495, 3, 'BHN-KP-677', 'Infus set dengan karet injeksi type 500 ( Y-SITE)', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(496, 3, 'BHN-KP-088', 'Infus set microdrip', NULL, 'buah', 42, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(497, 3, 'BHN-KP-921', 'Infus set steril with buret 100 ml type : pediatric 60 drops / ml', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(498, 3, 'BHN-KP-308', 'IV Catheter 18 G', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(499, 3, 'BHN-KP-244', 'IV Catheter 20 G', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(500, 3, 'BHN-KP-632', 'IV Catheter 22 G', NULL, 'buah', 183, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(501, 3, 'BHN-KP-932', 'IV Catheter 24 G', NULL, 'buah', 37, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(502, 3, 'BHN-KP-694', 'IV Catheter 26 G', NULL, 'buah', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(503, 3, 'BHN-KP-026', 'IV extension tubing 1 way', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(504, 3, 'BHN-KP-641', 'IV extension tubing 2 way', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(505, 3, 'BHN-KP-753', 'IV extension tubing 3 way', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(506, 3, 'BHN-KP-053', 'Jarum kulit no.10', NULL, 'buah', 24, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(507, 3, 'BHN-KP-391', 'Jarum kulit no.11', NULL, 'buah', 24, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(508, 3, 'BHN-KP-655', 'Jarum kulit no.12', NULL, 'buah', 48, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(509, 3, 'BHN-KP-754', 'Jarum kulit no.8', NULL, 'buah', 12, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(510, 3, 'BHN-KP-907', 'Jarum otot no.11', NULL, 'buah', 36, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(511, 3, 'BHN-KP-873', 'Jarum otot no.12', NULL, 'buah', 36, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(512, 3, 'BHN-KP-659', 'Jarum otot no.8', NULL, 'buah', 12, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(513, 3, 'BHN-KP-123', 'Jelly', NULL, 'tube', 21, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(514, 3, 'BHN-KP-840', 'Kacamata Google', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(515, 3, 'BHN-KP-101', 'Kantong ASI', NULL, 'pcs', 90, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(516, 3, 'BHN-KP-309', 'Kantong plastik hitam (besar)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(517, 3, 'BHN-KP-521', 'Kantong plastik hitam (kecil)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(518, 3, 'BHN-KP-060', 'Kantong plastik hitam (sedang)', NULL, 'pcs', 30, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(519, 3, 'BHN-KP-905', 'Kantong plastik kuning (besar)', NULL, 'pcs', 310, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(520, 3, 'BHN-KP-495', 'Kantong plastik kuning (kecil)', NULL, 'pcs', 800, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(521, 3, 'BHN-KP-490', 'Kantong Plastik kuning (sedang)', NULL, 'pcs', 199, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(522, 3, 'BHN-KP-580', 'Kantong Plastik Merah (besar)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(523, 3, 'BHN-KP-656', 'Kantong Plastik Merah (kecil)', NULL, 'pcs', 40, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(524, 3, 'BHN-KP-872', 'Kantong Plastik Merah (sedang)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(525, 3, 'BHN-KP-545', 'Kantong Plastik ungu (besar)', NULL, 'pcs', 40, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(526, 3, 'BHN-KP-722', 'Kapas wajah', NULL, 'pak', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(527, 3, 'BHN-KP-147', 'Kartu triage', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(528, 3, 'BHN-KP-168', 'Kassa gulung besar 80 cm', NULL, 'roll', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(529, 3, 'BHN-KP-410', 'Kassa steril', NULL, 'pak', 68, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(530, 3, 'BHN-KP-380', 'Kassa steril 5x5', NULL, 'pak', 28, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(531, 3, 'BHN-KP-979', 'KCL', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(532, 3, 'BHN-KP-087', 'Kertas EKG Fukuda 63mm', NULL, 'roll', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(533, 3, 'BHN-KP-176', 'Kertas EKG kotak 80x90mm', NULL, 'pak', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(534, 3, 'BHN-KP-819', 'kertas EKG roll 30mm', NULL, 'roll', 9, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(535, 3, 'BHN-KP-720', 'kertas EKG roll 80mm', NULL, 'roll', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(536, 3, 'BHN-KP-015', 'Kertas Goldar', NULL, 'lembar', 97, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(537, 3, 'BHN-KP-869', 'Kondom kateter', NULL, 'buah', 19, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(538, 3, 'BHN-KP-190', 'Kondom laki-laki', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(539, 3, 'BHN-KP-902', 'Kondom perempuan', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(540, 3, 'BHN-KP-966', 'LCD writing table', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(541, 3, 'BHN-KP-586', 'Lidi kapas kambium', NULL, 'pcs', 347, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(542, 3, 'BHN-KP-534', 'Lidi kapas steril', NULL, 'pcs', 167, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(543, 3, 'BHN-KP-247', 'Lilin Aroma terapi', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(544, 3, 'BHN-KP-425', 'Lipbalm', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(545, 3, 'BHN-KP-675', 'Lisol 600 ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(546, 3, 'BHN-KP-083', 'Masker KN95', NULL, 'pcs', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(547, 3, 'BHN-KP-219', 'Masker N95', NULL, 'pcs', 12, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(548, 3, 'BHN-KP-568', 'Matras Yoga', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(549, 3, 'BHN-KP-925', 'Mayo / Gudel / OPA (anak)', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(550, 3, 'BHN-KP-097', 'Mayo / Gudel / OPA (dewasa)', NULL, 'buah', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(551, 3, 'BHN-KP-599', 'Medisoft cotton ball / kapas bola', NULL, 'pcs', 4540, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(552, 3, 'BHN-KP-663', 'Metline', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(553, 3, 'BHN-KP-630', 'MgSO4', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(554, 3, 'BHN-KP-320', 'Minyak kayu putih', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(555, 3, 'BHN-KP-737', 'Minyak telon', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(556, 3, 'BHN-KP-248', 'Mitella disposible', NULL, 'buah', 24, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(557, 3, 'BHN-KP-056', 'Mucus Extractor', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(558, 3, 'BHN-KP-917', 'Nacl 100ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(559, 3, 'BHN-KP-639', 'Nacl 500ml', NULL, 'botol', 32, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(560, 3, 'BHN-KP-812', 'Needle 23G', NULL, 'pcs', 22, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(561, 3, 'BHN-KP-171', 'Needle 24G', NULL, 'pcs', 37, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(562, 3, 'BHN-KP-104', 'Needle 25G', NULL, 'pcs', 19, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(563, 3, 'BHN-KP-585', 'Needle 26G', NULL, 'pcs', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(564, 3, 'BHN-KP-153', 'Needle 27G', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(565, 3, 'BHN-KP-424', 'Needle Flexpen', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(566, 3, 'BHN-KP-687', 'NGT No.10 Fr', NULL, 'buah', 28, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(567, 3, 'BHN-KP-340', 'NGT No.12 Fr', NULL, 'buah', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(568, 3, 'BHN-KP-847', 'NGT No.14 Fr', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(569, 3, 'BHN-KP-719', 'NGT No.16 Fr', NULL, 'buah', 133, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(570, 3, 'BHN-KP-888', 'NGT No.18 Fr', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(571, 3, 'BHN-KP-226', 'NGT No.20 Fr', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(572, 3, 'BHN-KP-798', 'NGT No.3,5 Fr', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(573, 3, 'BHN-KP-526', 'NGT No.5 Fr', NULL, 'buah', 136, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(574, 3, 'BHN-KP-589', 'NGT No.6 Fr', NULL, 'buah', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(575, 3, 'BHN-KP-861', 'NGT No.8 Fr', NULL, 'buah', 26, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(576, 3, 'BHN-KP-435', 'No Pain spray', NULL, 'botol', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(577, 3, 'BHN-KP-291', 'Notebook', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(578, 3, 'BHN-KP-032', 'Obat Amoxicillin serbuk sirup 125mg / 5ml', NULL, 'botol', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(579, 3, 'BHN-KP-390', 'Obat Amoxicillin tablet', NULL, 'buah', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(580, 3, 'BHN-KP-796', 'Obat Antasida Doen', NULL, 'buah', 57, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(581, 3, 'BHN-KP-530', 'Obat Asam Mefenamat 500mg', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(582, 3, 'BHN-KP-476', 'Obat Effervescent CDR', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(583, 3, 'BHN-KP-382', 'Obat Effervescent CDR', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(584, 3, 'BHN-KP-712', 'Obat gel Bioplacenton 15 gr', NULL, 'tube', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(585, 3, 'BHN-KP-760', 'Obat injeksi ampul Ketorolac', NULL, 'ampul', 15, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(586, 3, 'BHN-KP-266', 'Obat injeksi ampul Lidocain', NULL, 'ampul', 26, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(587, 3, 'BHN-KP-069', 'Obat injeksi furosemid', NULL, 'ampul', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(588, 3, 'BHN-KP-813', 'Obat Injeksi Heparin sodium', NULL, 'vial', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(589, 3, 'BHN-KP-030', 'Obat injeksi insulin', NULL, 'ampul', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(590, 3, 'BHN-KP-685', 'Obat injeksi Oksitosin', NULL, 'ampul', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(591, 3, 'BHN-KP-583', 'Obat injeksi Phytomenadione', NULL, 'ampul', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(592, 3, 'BHN-KP-116', 'Obat injeksi Ranitidine', NULL, 'ampul', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(593, 3, 'BHN-KP-385', 'Obat injeksi vial cyanocobalamine / Vit B20', NULL, 'vial', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(594, 3, 'BHN-KP-981', 'Obat kapsul Cefadroxil', NULL, 'buah', 79, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(595, 3, 'BHN-KP-884', 'Obat KB Implant', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(596, 3, 'BHN-KP-076', 'Obat KB injeksi', NULL, 'vial', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(597, 3, 'BHN-KP-014', 'Obat KB IUD', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(598, 3, 'BHN-KP-217', 'Obat KB pil', NULL, 'lembar', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(599, 3, 'BHN-KP-262', 'Obat kumur Listerine', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(600, 3, 'BHN-KP-896', 'Obat Metered Dose Inhalers (MDI)', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(601, 3, 'BHN-KP-910', 'Obat nebu Ventolin / combivent nebules', NULL, 'ampul', 15, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(602, 3, 'BHN-KP-519', 'Obat Salep burnazine', NULL, 'tube', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(603, 3, 'BHN-KP-222', 'Obat salep gentamicin', NULL, 'tube', 13, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(604, 3, 'BHN-KP-233', 'Obat Salep Intracite', NULL, 'tube', 11, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(605, 3, 'BHN-KP-276', 'Obat salep mederma', NULL, 'tube', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(606, 3, 'BHN-KP-887', 'Obat Salep Metcovazine', NULL, 'tube', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(607, 3, 'BHN-KP-019', 'Obat Salep Miconazole', NULL, 'tube', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(608, 3, 'BHN-KP-112', 'Obat salp hydrocortisone cream', NULL, 'tube', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(609, 3, 'BHN-KP-399', 'Obat salp mata', NULL, 'tube', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(610, 3, 'BHN-KP-151', 'Obat salp mata Erlamycetin', NULL, 'tube', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(611, 3, 'BHN-KP-930', 'Obat Salp nebacetin cream', NULL, 'tube', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(612, 3, 'BHN-KP-770', 'Obat Sanmol /contrexin drops', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(613, 3, 'BHN-KP-729', 'Obat semprot hidung BNS', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(614, 3, 'BHN-KP-695', 'Obat serbuk Nebacetin Serbuk', NULL, 'vial', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(615, 3, 'BHN-KP-021', 'Obat sirup OBH', NULL, 'botol', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(616, 3, 'BHN-KP-556', 'Obat solution Bisolvon larutan 150ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(617, 3, 'BHN-KP-257', 'Obat sublingual Isosorbid Dinitrate (ISDN) 5mg', NULL, 'buah', 40, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(618, 3, 'BHN-KP-140', 'Obat suppositoria fladystin/provagin', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(619, 3, 'BHN-KP-878', 'Obat suppositoria Microlax', NULL, 'tube', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(620, 3, 'BHN-KP-225', 'Obat Suppositoria Superrhoid', NULL, 'buah', 12, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(621, 3, 'BHN-KP-228', 'Obat Suppositoria Suprafenid', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(622, 3, 'BHN-KP-506', 'Obat tablet antasida', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(623, 3, 'BHN-KP-422', 'Obat tablet Cefadroxil', NULL, 'buah', 79, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(624, 3, 'BHN-KP-875', 'Obat tablet Diatab', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(625, 3, 'BHN-KP-855', 'Obat tablet Metronidazol 500mg', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(626, 3, 'BHN-KP-791', 'Obat tablet Ondansentron', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(627, 3, 'BHN-KP-066', 'Obat tablet Paracetamol 500 mg', NULL, 'buah', 72, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(628, 3, 'BHN-KP-138', 'Obat tablet vaginal Nystatin', NULL, 'buah', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(629, 3, 'BHN-KP-364', 'Obat tetes hidung (dengan alat spray) / avamy\'s', NULL, 'botol', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(630, 3, 'BHN-KP-552', 'Obat tetes hidung Breathy', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(631, 3, 'BHN-KP-879', 'Obat tetes mata', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(632, 3, 'BHN-KP-358', 'Obat tetes telinga', NULL, 'buah', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(633, 3, 'BHN-KP-468', 'Obat vial Cefotaxime', NULL, 'vial', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(634, 3, 'BHN-KP-540', 'Obat vial Ceftriaxon', NULL, 'vial', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(635, 3, 'BHN-KP-671', 'Oxycan', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(636, 3, 'BHN-KP-922', 'Pampers bayi', NULL, 'buah', 44, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(637, 3, 'BHN-KP-162', 'Pampers Dewasa', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(638, 3, 'BHN-KP-778', 'Papan tulis tablet', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(639, 3, 'BHN-KP-336', 'Parfum', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(640, 3, 'BHN-KP-074', 'Pasta gigi anak', NULL, 'buah', 21, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(641, 3, 'BHN-KP-400', 'Pasta gigi dewasa', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(642, 3, 'BHN-KP-295', 'Peluit', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(643, 3, 'BHN-KP-095', 'Pembalut biasa', NULL, 'buah', 80, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(644, 3, 'BHN-KP-942', 'Pembalut maternity', NULL, 'buah', 45, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(645, 3, 'BHN-KP-826', 'Pemotong ampul', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(646, 3, 'BHN-KP-802', 'Pemotong tablet', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(647, 3, 'BHN-KP-662', 'Penampung ASI (silicon)', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(648, 3, 'BHN-KP-144', 'Pencukur rambut (gillete)', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(649, 3, 'BHN-KP-752', 'Penggaris luka', NULL, 'buah', 278, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(650, 3, 'BHN-KP-211', 'Peniti', NULL, 'buah', 132, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(651, 3, 'BHN-KP-263', 'Penlight', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(652, 3, 'BHN-KP-050', 'Perban elastis 10 cm x 4,5m', NULL, 'roll', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(653, 3, 'BHN-KP-001', 'perban elastis 15cm x 4,5m', NULL, 'roll', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(654, 3, 'BHN-KP-270', 'Perban elastis 7,5cm x 4,5m', NULL, 'roll', 13, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(655, 3, 'BHN-KP-946', 'perban / kassa gulung panjang (15cm)', NULL, 'roll', 74, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(656, 3, 'BHN-KP-491', 'perban / kassa gulung pendek (5cm)', NULL, 'roll', 280, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(657, 3, 'BHN-KP-562', 'perban / kassa gulung sedang (10cm)', NULL, 'roll', 55, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(658, 3, 'BHN-KP-271', 'Pipet Obat', NULL, 'buah', 11, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(659, 3, 'BHN-KP-373', 'plester coklat 1,25cm', NULL, 'roll', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(660, 3, 'BHN-KP-367', 'plester coklat 2,5cm', NULL, 'roll', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(661, 3, 'BHN-KP-118', 'plester coklat 7,5cm', NULL, 'roll', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(662, 3, 'BHN-KP-072', 'Plester Dermafix 10 x 20', NULL, 'lembar', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(663, 3, 'BHN-KP-052', 'Plester Dermafix 10x12cm', NULL, 'lembar', 40, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(664, 3, 'BHN-KP-755', 'Plester Dermafix 5x7cm', NULL, 'lembar', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(665, 3, 'BHN-KP-078', 'Plester Dermafix besar', NULL, 'lembar', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(666, 3, 'BHN-KP-417', 'Plester Foam dressing penyerap eksudat (W-CARE AH)', NULL, 'lembar', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(667, 3, 'BHN-KP-037', 'Plester Hypafix (10 cm x 5m)', NULL, 'roll', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(668, 3, 'BHN-KP-759', 'Plester Hypafix (5cm x 5m)', NULL, 'roll', 30, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(669, 3, 'BHN-KP-184', 'Plester IV dressing 5x6 cm', NULL, 'lembar', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(670, 3, 'BHN-KP-739', 'Plester IV Dressing uk.6x7cm', NULL, 'lembar', 191, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(671, 3, 'BHN-KP-486', 'Plester Kompres Demam', NULL, 'lembar', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(672, 3, 'BHN-KP-124', 'Plester micropore 1,25cm', NULL, 'roll', 46, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(673, 3, 'BHN-KP-371', 'Plester micropore 2,5cm', NULL, 'roll', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(674, 3, 'BHN-KP-524', 'Plester tegaderm 10 x 12', NULL, 'lembar', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(675, 3, 'BHN-KP-672', 'Plester Tranparant Dressing roll 10cmx1m', NULL, 'roll', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(676, 3, 'BHN-KP-156', 'Plester transparant dressing roll 10cm x 2m', NULL, 'roll', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(677, 3, 'BHN-KP-305', 'Plester transparant dressing roll 5cm', NULL, 'roll', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(678, 3, 'BHN-KP-523', 'pot feses', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(679, 3, 'BHN-KP-820', 'pot Sputum', NULL, 'buah', 11, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(680, 3, 'BHN-KP-913', 'Pot urine', NULL, 'buah', 35, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(681, 3, 'BHN-KP-854', 'Pouch Sterilisator', NULL, 'buah', 397, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(682, 3, 'BHN-KP-129', 'Puzzle', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(683, 3, 'BHN-KP-287', 'Ransel Verban', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(684, 3, 'BHN-KP-280', 'Reagen goldar antigen A', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(685, 3, 'BHN-KP-223', 'Reagen goldar antigen AB', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(686, 3, 'BHN-KP-157', 'Reagen goldar antigen B', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(687, 3, 'BHN-KP-958', 'Reagen goldar antigen D', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(688, 3, 'BHN-KP-803', 'Ringer laktat 500 ml', NULL, 'botol', 19, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(689, 3, 'BHN-KP-204', 'Sabun cuci cream', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(690, 3, 'BHN-KP-836', 'Sabun handwash', NULL, 'botol', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(691, 3, 'BHN-KP-473', 'Sabun handwash refill', NULL, 'buah', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(692, 3, 'BHN-KP-867', 'Sabun handwash refill 185ml', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(693, 3, 'BHN-KP-999', 'Sabun mandi batang', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(694, 3, 'BHN-KP-638', 'Sabun mandi bayi cair', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(695, 3, 'BHN-KP-616', 'Sabun mandi cair', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(696, 3, 'BHN-KP-381', 'Sabun mandi cair 220', NULL, 'buah', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(697, 3, 'BHN-KP-582', 'Sedotan putih', NULL, 'pcs', 25, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(698, 3, 'BHN-KP-853', 'Sedotan warna', NULL, 'pcs', 291, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(699, 3, 'BHN-KP-238', 'Selang oksigen Nasal kanul anak', NULL, 'buah', 16, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(700, 3, 'BHN-KP-781', 'Selang oksigen Nasal kanul dewasa', NULL, 'buah', 35, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(701, 3, 'BHN-KP-827', 'Selang oksigen nebulizer', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(702, 3, 'BHN-KP-912', 'Selang oksigen NRM anak', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(703, 3, 'BHN-KP-458', 'Selang oksigen NRM Dewasa', NULL, 'buah', 13, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(704, 3, 'BHN-KP-071', 'Selang oksigen symple mask anak', NULL, 'buah', 6, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(705, 3, 'BHN-KP-766', 'Selang oksigen symple mask bayi', NULL, 'buah', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(706, 3, 'BHN-KP-703', 'Selang oksigen symple mask dewasa', NULL, 'buah', 53, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(707, 3, 'BHN-KP-408', 'Selang suction 10G', NULL, 'buah', 61, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(708, 3, 'BHN-KP-077', 'Selang suction 12G', NULL, 'buah', 36, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(709, 3, 'BHN-KP-165', 'Selang suction 6G', NULL, 'buah', 16, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(710, 3, 'BHN-KP-507', 'Selang Suction 8G', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(711, 3, 'BHN-KP-479', 'Sendok plastik putih', NULL, 'buah', 57, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(712, 3, 'BHN-KP-467', 'Sendok plastik warna', NULL, 'buah', 9, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(713, 3, 'BHN-KP-099', 'Sendok takar obat', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(714, 3, 'BHN-KP-837', 'Senter LED', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(715, 3, 'BHN-KP-337', 'Shampoo botol', NULL, 'botol', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(716, 3, 'BHN-KP-625', 'Sikat cuci tangan (Spone cuci tangan)', NULL, 'buah', 7, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(717, 3, 'BHN-KP-954', 'Sikat gigi anak', NULL, 'buah', 20, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(718, 3, 'BHN-KP-463', 'Sikat gigi dewasa', NULL, 'buah', 17, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(719, 3, 'BHN-KP-394', 'Sikat Kuku', NULL, 'buah', 9, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(720, 3, 'BHN-KP-181', 'Silicon penampung ASI', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(721, 3, 'BHN-KP-584', 'Sisir bayi', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(722, 3, 'BHN-KP-779', 'Sisir kutu', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(723, 3, 'BHN-KP-203', 'Sisir rambut', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(724, 3, 'BHN-KP-693', 'Snellen Chart', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(725, 3, 'BHN-KP-808', 'Spalk Bayi/Anak', NULL, 'buah', 15, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(726, 3, 'BHN-KP-199', 'Spalk/Bidai 50cm', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(727, 3, 'BHN-KP-267', 'Spalk/Bidai 70cm', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(728, 3, 'BHN-KP-420', 'Spone Tepid Water', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(729, 3, 'BHN-KP-511', 'Spuit 0,05ml', NULL, 'buah', 64, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(730, 3, 'BHN-KP-527', 'Spuit 0,5ml', NULL, 'buah', 132, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(731, 3, 'BHN-KP-031', 'Spuit 10ml', NULL, 'buah', 278, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(732, 3, 'BHN-KP-559', 'Spuit 1ml tuberkulin', NULL, 'buah', 287, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(733, 3, 'BHN-KP-315', 'Spuit 20ml', NULL, 'buah', 160, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(734, 3, 'BHN-KP-614', 'Spuit 3ml', NULL, 'buah', 396, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(735, 3, 'BHN-KP-852', 'Spuit 50ml biru', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(736, 3, 'BHN-KP-448', 'Spuit 50ml hijau / Catheter Tip', NULL, 'buah', 183, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(737, 3, 'BHN-KP-196', 'Spuit 5ml', NULL, 'buah', 100, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(738, 3, 'BHN-KP-300', 'Spuit insulin 0,5ml', NULL, 'buah', 100, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(739, 3, 'BHN-KP-929', 'Spuit insulin 1ml', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(740, 3, 'BHN-KP-987', 'Stik es krim', NULL, 'buah', 458, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(741, 3, 'BHN-KP-273', 'Stik pedicure', NULL, 'buah', 8, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(742, 3, 'BHN-KP-201', 'Suction ball', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(743, 3, 'BHN-KP-210', 'Tabung darah besar', NULL, 'buah', 23, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(744, 3, 'BHN-KP-188', 'Tabung darah kecil', NULL, 'buah', 21, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(745, 3, 'BHN-KP-043', 'Tabung TM / wadah 15ml', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(746, 3, 'BHN-KP-989', 'Tabung TM / wadah 30ml', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(747, 3, 'BHN-KP-281', 'Talk bayi', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(748, 3, 'BHN-KP-038', 'Talk bayi 50gr', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(749, 3, 'BHN-KP-600', 'Talk bayi herocyn 200gr', NULL, 'buah', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(750, 3, 'BHN-KP-082', 'Tasbih', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(751, 3, 'BHN-KP-091', 'Termometer digital', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(752, 3, 'BHN-KP-333', 'Termometer infrared', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(753, 3, 'BHN-KP-544', 'Three way stopcock (JMS) panjang', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(754, 3, 'BHN-KP-216', 'Three way stopcock (JMS) pendek', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(755, 3, 'BHN-KP-538', 'Tissu gulung', NULL, 'roll', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(756, 3, 'BHN-KP-229', 'Tisu pengesat (Tesa) soft hand towel', NULL, 'pak', 11, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(757, 3, 'BHN-KP-089', 'Tisu wajah', NULL, 'pak', 57, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(758, 3, 'BHN-KP-994', 'Tisu wajah kecil', NULL, 'pak', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(759, 3, 'BHN-KP-134', 'Tongue Spatel steril kayu', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(760, 3, 'BHN-KP-036', 'Tracheostomy retainer', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(761, 3, 'BHN-KP-004', 'Tracheostomy tube', NULL, 'buah', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(762, 3, 'BHN-KP-951', 'Transofix', NULL, 'buah', 14, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(763, 3, 'BHN-KP-788', 'Tusuk gigi', NULL, 'pcs', 200, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(764, 3, 'BHN-KP-834', 'Ultrasound gel 250ml', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(765, 3, 'BHN-KP-920', 'Umbilical clamp / Klem Tali pusat', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(766, 3, 'BHN-KP-906', 'Underpad dewasa', NULL, 'buah', 25, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(767, 3, 'BHN-KP-431', 'Urinalisis', NULL, 'pcs', 100, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(768, 3, 'BHN-KP-206', 'Urine bag', NULL, 'buah', 113, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(769, 3, 'BHN-KP-098', 'Vaginal Spatula', NULL, 'buah', 100, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(770, 3, 'BHN-KP-570', 'Vaksin BCG', NULL, 'vial', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(771, 3, 'BHN-KP-284', 'Vaksin Hepatitis B (Hb0)', NULL, 'pcs', 4, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(772, 3, 'BHN-KP-325', 'Vaksin MR', NULL, 'vial', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(773, 3, 'BHN-KP-344', 'Vaksin Pentabio', NULL, 'vial', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(774, 3, 'BHN-KP-990', 'Vaksin polio bivalent', NULL, 'vial', 0, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(775, 3, 'BHN-KP-355', 'Vaksin TT', NULL, 'vial', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(776, 3, 'BHN-KP-588', 'Wash bensin (1L)', NULL, 'botol', 5, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(777, 3, 'BHN-KP-730', 'Waslap', NULL, 'pasang', 54, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(778, 3, 'BHN-KP-935', 'Wing needle 23 G', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(779, 3, 'BHN-KP-105', 'Wing needle 25G', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(780, 3, 'BHN-KP-010', 'Wing needle 27 G', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:15', '2025-11-10 00:46:15'),
(781, 4, 'BHN-KB-732', 'Alkohol Cair 70% @ 100 ml Exp. Mei 2028', NULL, 'botol', 82, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(782, 4, 'BHN-KB-441', 'Afrin (obat tetes hidung) Exp.September 2027 TEST', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 07:43:18'),
(783, 4, 'BHN-KB-062', 'Alkohol Cair 95% @ 1liter Exp. April 2026', NULL, 'liter', 1900, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(784, 4, 'BHN-KB-776', 'Alkohol swab Exp.Agustus 2026 (100), November 2027 (1600)', NULL, 'pcs', 1197, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(785, 4, 'BHN-KB-726', 'Aquabidest 100 ml Exp. 10/10/2026', NULL, 'botol', 20, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(786, 4, 'BHN-KB-325', 'Aquadest (1 Ltr) Exp. Oktober 2027', NULL, 'ml', 4000, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(787, 4, 'BHN-KB-766', 'Antasida Doen Syrup Exp. Desember 2026', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(788, 4, 'BHN-KB-925', 'Antiseptic Surgical Scrub Exp. Juni 2026', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(789, 4, 'BHN-KB-007', 'Amoxcilin Trihydrate Exp. Februari 2026', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(790, 4, 'BHN-KB-215', 'Aplikator Betadine Vaginal Douche Exp.31/05/2025 (1),Oktober 2026 (1)', NULL, 'pcs', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(791, 4, 'BHN-KB-403', 'Asam asetat 6% (100 ml) Exp.03/03/2025 (3); 22/10/2025 (1); 29/01/2026 (2)', NULL, 'botol', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(792, 4, 'BHN-KB-047', 'Baju Perawatan Metode Kangguru (N/A)', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(793, 4, 'BHN-KB-683', 'Bayclin @ 500 ml Exp.29/01/2026 (8); 22/02/2027 (14); 26/03/2027 (20)', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(794, 4, 'BHN-KB-895', 'Bayclin @ 100 ml Exp.05/02/2026 ; 22/02/2027 (24); 26/03/2027 (24)', NULL, 'botol', 36, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(795, 4, 'BHN-KB-105', 'Bedak bayi Exp. Oktober 2026 ; Nopember 2026 (1)', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(796, 4, 'BHN-KB-814', 'Benang kasur (untuk TP bayi) (N/A)', NULL, 'roll', 20, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(797, 4, 'BHN-KB-400', 'Benedic Cair Mfg Date. 06/03/2017 (Exp. N/A)', NULL, 'ml', 1950, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(798, 4, 'BHN-KB-327', 'Betadine Cair @ 30 ml Exp. Juli 2027', NULL, 'botol', 32, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(799, 4, 'BHN-KB-253', 'Betadine Cair @ 60 ml Exp. Agustus 2027', NULL, 'botol', 22, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(800, 4, 'BHN-KB-522', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(801, 4, 'BHN-KB-838', 'Betadine Vaginal Douche (Povidine Iodine 100%) Exp. Desember 2025', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(802, 4, 'BHN-KB-306', 'Betadine zalp (Obat antibiotik zalf) Exp. Desember 2027', NULL, 'tube', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(803, 4, 'BHN-KB-839', 'Bioplacenton Exp.', NULL, 'tube', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(804, 4, 'BHN-KB-910', 'Blood lancet Exp. Nopember 2026', NULL, 'pcs', 21, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(805, 4, 'BHN-KB-534', 'Blood Set (Tranfusion Set) Exp. Oktober 2027', NULL, 'pcs', 14, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(806, 4, 'BHN-KB-630', 'Bola Kapas kering steril @1 bungkus isi 5 pcs Exp. Mei 2026', NULL, 'bungkus', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(807, 4, 'BHN-KB-696', 'Bola Permainan warna warni (N/A)', NULL, 'set', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(808, 4, 'BHN-KB-004', 'Breathy (Obat Tetes Hidung) Exp.April 2026', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(809, 4, 'BHN-KB-796', 'Candesartan Exp. Mei 2027', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(810, 4, 'BHN-KB-137', 'Captopril Exp. Oktober 2026', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(811, 4, 'BHN-KB-264', 'Catgut Chromic Heacting (Benang USP 2/0) Exp. Februari 2027', NULL, 'pcs', 68, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(812, 4, 'BHN-KB-189', 'Catgut Chromic Heacting with Neddle (Benang USP 3/0) Exp. Juni 2027', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(813, 4, 'BHN-KB-025', 'Catgut Plain Heacting with Neddle (Benang USP 3/0) Exp. Oktober 2027', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(814, 4, 'BHN-KB-405', 'Catgut Silk Heacting (Benang USP 3/0) Exp. Juli 2028 (5)', NULL, 'pcs', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(815, 4, 'BHN-KB-478', 'Catgut Silk Heacting (Benang USP 2/0) Exp. Juli 2029', NULL, 'pcs', 20, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(816, 4, 'BHN-KB-109', 'CDR (Effervencent) Exp. Juni 2027', NULL, 'tube', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(817, 4, 'BHN-KB-781', 'Cefriaxone (obat pemberian IV) Exp. Nopember 2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(818, 4, 'BHN-KB-219', 'Celemek/Apron (N/A)', NULL, 'buah', 52, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(819, 4, 'BHN-KB-366', 'Cendo mini dose Exp. Juni 2025', NULL, 'dose', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(820, 4, 'BHN-KB-987', 'Cenfresh (obat mata tetes) Exp. April 2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(821, 4, 'BHN-KB-086', 'Cefotaxim Sodium (Obat serbuk diecerkan) Exp. Mei 2028', NULL, 'vial', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(822, 4, 'BHN-KB-959', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(823, 4, 'BHN-KB-645', 'Chloramphenicol zalp (obat salep mata) Exp. Maret 2028', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(824, 4, 'BHN-KB-305', 'Cyanocobalamin Exp.', NULL, 'vial', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(825, 4, 'BHN-KB-635', 'Cytobrush (N/A)', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(826, 4, 'BHN-KB-652', 'Cotton bud Exp. 07/12/2029', NULL, 'pcs', 96, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(827, 4, 'BHN-KB-749', 'Cover All (N/A)', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(828, 4, 'BHN-KB-877', 'Daryant tule Exp. Januari 2026', NULL, 'lembar', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(829, 4, 'BHN-KB-619', 'Ditiazem Exp. Agustus 2027', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(830, 4, 'BHN-KB-328', 'Demafix-S (IV Cath. 6x7 cm) Exp. Desember 2029', NULL, 'lembar', 90, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(831, 4, 'BHN-KB-387', 'Demafix (5 x 7 cm)', NULL, 'lembar', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(832, 4, 'BHN-KB-589', 'Demafix (10 x 25 cm) Exp. Desember 20206', NULL, 'lembar', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(833, 4, 'BHN-KB-243', 'Dermafix (10 x 12 cm)', NULL, 'lembar', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(834, 4, 'BHN-KB-467', 'Dextrose 5% (500 ml) Exp. 05/08/2026', NULL, 'fls', 7, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(835, 4, 'BHN-KB-225', 'Enzimatik Exp. September 2026', NULL, 'liter', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(836, 4, 'BHN-KB-939', 'Essential oil khusus baby (N/A)', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(837, 4, 'BHN-KB-798', 'Face Shield (N/A)', NULL, 'buah', 15, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(838, 4, 'BHN-KB-716', 'Forumen Docusate Sodium Exp. 06/09/2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(839, 4, 'BHN-KB-840', 'Flagistatin Vaginal Ovule (Obat Vaginal) Exp. April 2025', NULL, 'tablet', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(840, 4, 'BHN-KB-117', 'Folley Katheter 1 way 8FR (N/A)', NULL, 'pcs', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(841, 4, 'BHN-KB-970', 'Folley Katheter 1 way 12FR (N/A)', NULL, 'pcs', 6, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(842, 4, 'BHN-KB-299', 'Folley Katheter 1 way 16FR (N/A)', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(843, 4, 'BHN-KB-211', 'Folley Katheter 1 way 18FR (N/A)', NULL, 'pcs', 6, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(844, 4, 'BHN-KB-182', 'Folley Katheter 2 way 20FR Exp. Nopember 2025, Januari 2028', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(845, 4, 'BHN-KB-201', 'Folley Katheter 2 way 18FR Exp. Nop\' 2028', NULL, 'pcs', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(846, 4, 'BHN-KB-149', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(847, 4, 'BHN-KB-152', 'Folley Katheter 2 way 16FR Exp. April 2027 (20), Okt\' 2027 (60), Nop\' 2028 (19)', NULL, 'pcs', 50, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(848, 4, 'BHN-KB-070', 'Folley Katheter 2 way 14FR Exp. 2027 (2), Desember 2027 (30)', NULL, 'pcs', 44, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(849, 4, 'BHN-KB-677', 'Folley Katheter 2 way 12FR Exp.', NULL, 'pcs', 50, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(850, 4, 'BHN-KB-245', 'Folley Katheter 2 way 8FR Exp. Juli 2028', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(851, 4, 'BHN-KB-709', 'Folley Katheter 2 way 6FR Exp. Juli 2028', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42');
INSERT INTO `barang` (`id_barang`, `id_sub_kategori`, `kode_barang`, `nama_barang`, `deskripsi`, `satuan`, `stok`, `stok_minimum`, `is_active`, `created_at`, `updated_at`) VALUES
(852, 4, 'BHN-KB-802', 'Folley Katheter 3 way 20FR Exp. Nopember 2028', NULL, 'pcs', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(853, 4, 'BHN-KB-727', 'Furosemid/Terazid Exp. Februari 2027', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(854, 4, 'BHN-KB-099', 'Gelas ukur 500 ml (N/A)', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(855, 4, 'BHN-KB-700', 'Gelas ukur 1000 ml (N/A)', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(856, 4, 'BHN-KB-507', 'Gentamycin AB zalp 0,1% (5 gram) Exp.', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(857, 4, 'BHN-KB-785', 'Gentamycin sulfate (Tetes Mata) Exp.', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(858, 4, 'BHN-KB-125', 'Handsanitazier Gell @ 100 ml Exp. September 2027', NULL, 'botol', 15, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(859, 4, 'BHN-KB-398', 'Handsanitazier @ 500 ml Exp. 2027', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(860, 4, 'BHN-KB-045', 'Handsanitazier Gell @ 500 ml Exp.', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(861, 4, 'BHN-KB-728', 'Handscoen Non Steril S Exp. Agustus 2027, 02/02/2030 (36 box)', NULL, 'pasang', 6869, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(862, 4, 'BHN-KB-449', 'Handscoen Non Steril M Exp. Agustus 2027', NULL, 'pasang', 10022, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(863, 4, 'BHN-KB-347', 'Handscoen Non Steril L Exp. Agustus 2027', NULL, 'pasang', 297, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(864, 4, 'BHN-KB-574', 'Handscoen Non Steril XL Exp.', NULL, 'pasang', 48, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(865, 4, 'BHN-KB-938', 'Handscoen steril Uk. 6 Exp. Februari 2026', NULL, 'pasang', 91, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(866, 4, 'BHN-KB-827', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(867, 4, 'BHN-KB-410', 'Handscoen steril Uk. 6,5 Exp. Agustus 2027 (13), September 2027 (18), Februari 2026 (22)', NULL, 'pasang', 149, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(868, 4, 'BHN-KB-946', 'Handscoen steril Uk. 7 Exp.Desember 2029 (122), Juli 2027 (13), Agustus (10), Febr\'2026 (39),', NULL, 'pasang', 173, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(869, 4, 'BHN-KB-469', 'Handscoen steril Uk. 7,5 Exp. Juni 2027 (1), Mei 20206 (20)', NULL, 'pasang', 105, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(870, 4, 'BHN-KB-231', 'Handscoen steril Uk. 8 Exp.', NULL, 'pasang', 50, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(871, 4, 'BHN-KB-693', 'Handscoen Obgyn Exp. Februari 2026 (2), Juli 2028 (8)', NULL, 'pasang', 32, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(872, 4, 'BHN-KB-786', 'Handscoen Karet (PI) NA', NULL, 'pasang', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(873, 4, 'BHN-KB-830', 'HCL 0,1N (Mfg Date 27/04/2017) Exp. N/A, Exp. 22/10/2025', NULL, 'ml', 2000, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(874, 4, 'BHN-KB-075', 'Hydrocortisone krim 2,5% Exp.Juli 2025', NULL, 'tube', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(875, 4, 'BHN-KB-462', 'Infus Set Macro Exp. Agust\' 2028 (16), September 2026', NULL, 'pcs', 42, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(876, 4, 'BHN-KB-418', 'Infus Set Child / Pediatric Exp.September 2027', NULL, 'pcs', 21, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(877, 4, 'BHN-KB-026', 'Isi Oksigen (dalam tabung) N/A', NULL, 'tabung', 25, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(878, 4, 'BHN-KB-801', 'Isosorbide Dinitrate Exp. Juni 2026 (5), Nopember 2026 (2)', NULL, 'lembar', 7, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(879, 4, 'BHN-KB-559', 'IO-GEL 3 ml PFS / HPMC Exp.', NULL, 'tube', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(880, 4, 'BHN-KB-464', 'IV Cath. 14G Exp. 11/2027', NULL, 'pcs', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(881, 4, 'BHN-KB-784', 'IV Cath. 16G Exp. 09/2026 (3), Nop 2027 (50)', NULL, 'pcs', 33, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(882, 4, 'BHN-KB-596', 'IV Cath. No. 18G Exp. Nop 2027 (50), 06/06/2029 (2)', NULL, 'pcs', 32, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(883, 4, 'BHN-KB-015', 'IV Cath. No. 20G Exp. April 2027 (2), April 2028 (90)', NULL, 'pcs', 60, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(884, 4, 'BHN-KB-509', 'IV Cath. No. 22G Exp.Juni 2028', NULL, 'pcs', 19, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(885, 4, 'BHN-KB-845', 'IV Cath. No. 24G Exp.06/2026 (3), 09/2027 (15), Sept 2027 (20)', NULL, 'pcs', 97, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(886, 4, 'BHN-KB-812', 'IV Cath. No. 26G Exp. Juni 2028 (5), Okt\' 2026 (3)', NULL, 'pcs', 48, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(887, 4, 'BHN-KB-757', 'Ice gel pack Exp. N/A', NULL, 'pcs', 6, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(888, 4, 'BHN-KB-723', 'Jarum Heacting Otot G 12 (1134) Exp. N/A', NULL, 'pcs', 84, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(889, 4, 'BHN-KB-038', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(890, 4, 'BHN-KB-627', 'Jarum Heacting Otot G 8 (1132) Exp. N/A', NULL, 'pcs', 160, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(891, 4, 'BHN-KB-360', 'Jarum Heacting Kulit G 8 (1132) Exp. N/A', NULL, 'pcs', 24, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(892, 4, 'BHN-KB-703', 'Jarum Heacting Kulit G 12 Exp. N/A', NULL, 'pcs', 38, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(893, 4, 'BHN-KB-214', 'Jarum Heacting Kulit G 7 Exp. N/A', NULL, 'pcs', 40, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(894, 4, 'BHN-KB-578', 'Jelly supp. (N/A)', NULL, 'tube', 12, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(895, 4, 'BHN-KB-763', 'Jelly (MY) Exp. Agustus 2025, Januari 2028 (7)', NULL, 'tube', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(896, 4, 'BHN-KB-101', 'Kacamata Safety Googles (N/A)', NULL, 'buah', 14, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(897, 4, 'BHN-KB-774', 'Kalender Kehamilan (N/A)', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(898, 4, 'BHN-KB-916', 'Kapas Pembalut luka @ 500 gram Exp. 01/01/2027', NULL, 'ball', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(899, 4, 'BHN-KB-294', 'Kapas (Netto 50 gram)', NULL, 'bungkus', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(900, 4, 'BHN-KB-190', 'Kapas cebok bayi/bola besar Exp. Juli 2025 (100), Oktober 2027 (400), Okt\'2029 (5)', NULL, 'pcs', 881, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(901, 4, 'BHN-KB-908', 'Kassa Uk. 5 cm x 5 cm Gauze Swabs (200 pcs) Exp. Mei 2027', NULL, 'pcs', 200, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(902, 4, 'BHN-KB-590', 'Kassa Hidrofil Balut Luka (3,6 m x 15 cm) Exp.Agustus 2029 (12), Juli 2027 (50), N/A (43)', NULL, 'roll', 62, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(903, 4, 'BHN-KB-407', 'Kassa Hidrofil Balut Luka (2 m x 10 cm) (N/A)', NULL, 'roll', 40, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(904, 4, 'BHN-KB-828', 'Kassa (20 m x 80 cm) @ 50 gram (N/A)', NULL, 'gulung', 11, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(905, 4, 'BHN-KB-126', 'Kassa steril Exp. Juni 2027', NULL, 'box', 46, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(906, 4, 'BHN-KB-601', 'KB Implant (2 batang) Exp.Februari 2026 (2), Februari 2029 (1)', NULL, 'set', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(907, 4, 'BHN-KB-915', 'KB Implant (1 batang) Exp. Agustus 2028 (1), Juli 2029 (1)', NULL, 'set', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(908, 4, 'BHN-KB-489', 'KB Injeksi 1 bulan (0,5 ml) Exp.Mei 2027', NULL, 'vial', 78, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(909, 4, 'BHN-KB-427', 'KB Injeksi 2 bulan (Gestin F2) Exp. 06/03/2026', NULL, 'vial', 79, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(910, 4, 'BHN-KB-046', 'KB Injeksi 3 bulan (1 ml) Exp. 13/6/2026 (1), 20/09/2027 (38)', NULL, 'vial', 70, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(911, 4, 'BHN-KB-071', 'KB Injeksi 3 bulan (3 ml) Exp.20/09/2027', NULL, 'vial', 70, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(912, 4, 'BHN-KB-516', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(913, 4, 'BHN-KB-669', 'KB Injeksi Protera Exp.', NULL, 'vial', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(914, 4, 'BHN-KB-419', 'KB IUD Exp. 2028', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(915, 4, 'BHN-KB-208', 'KB Kondom Exp. 2026 (3 pack), 2027 (7 pack)', NULL, 'pack', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(916, 4, 'BHN-KB-283', 'KB Mini Pil Andalan Laktasi (Kemasan 28 pil) Exp. Juni 2026 (1) dan Februari 2027 (3)', NULL, 'strip', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(917, 4, 'BHN-KB-500', 'KB Mini Pil Microlut (Kemasan 35 pil) Exp. Mei 2026', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(918, 4, 'BHN-KB-107', 'KB Pil Andalan Exp. 02/07/2028', NULL, 'blister', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(919, 4, 'BHN-KB-128', 'KB Pil Andalan Fe Exp. 07/06/2026', NULL, 'blister', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(920, 4, 'BHN-KB-420', 'KB Pil Kombinasi Monofasik (Elza) Exp. Juli 2022 (2), Januari 2026 (1)', NULL, 'blister', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(921, 4, 'BHN-KB-010', 'KB Pil Kombinasi Bifasik (Andalan Biru) Exp. 02 Juli 2028', NULL, 'blister', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(922, 4, 'BHN-KB-788', 'KB Pil Kombinasi Trifasik (Trinodiol) Exp.', NULL, 'blister', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(923, 4, 'BHN-KB-288', 'KB Pil Planotab Exp. Nop\' 2025', NULL, 'blister', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(924, 4, 'BHN-KB-874', 'KB Pil Postpil Exp. Feb\' 2025', NULL, 'tablet', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(925, 4, 'BHN-KB-444', 'KB Pil Darurat (KonDar) Exp. Nopember 2025', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(926, 4, 'BHN-KB-023', 'KB Progesteron Oral (Primolut Norethisterone 5 mg) Exp. Juli 2027', NULL, 'blister', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(927, 4, 'BHN-KB-517', 'Kondom Chateter Exp. Desember 2029', NULL, 'pcs', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(928, 4, 'BHN-KB-794', 'Kresek/ Plastik besar (Hitam/Merah/Kuning) Exp. (N/A)', NULL, 'lembar', 42, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(929, 4, 'BHN-KB-330', 'Kresek/ Plastik besar (ukuran 60 x 100) Exp. (N/A)', NULL, 'lembar', 25, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(930, 4, 'BHN-KB-815', 'Kresek/ Plastik besar (ukuran 40 x 60) Exp. (N/A)', NULL, 'lembar', 50, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(931, 4, 'BHN-KB-502', 'Kresek/ Plastik kecil Exp.N/A', NULL, 'lembar', 148, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(932, 4, 'BHN-KB-289', 'Kresek Sampah Medis (Warna Kuning) dengan Logo Medis Exp. N/A', NULL, 'lembar', 129, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(933, 4, 'BHN-KB-390', 'Kresek Sampah Medis (Warna Merah) dengan Logo Medis Exp. N/A', NULL, 'lembar', 75, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(934, 4, 'BHN-KB-181', 'Kresek Sampah Medis (Warna Coklat) dengan Logo Medis Exp. N/A', NULL, 'lembar', 100, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(935, 4, 'BHN-KB-544', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(936, 4, 'BHN-KB-504', 'Kresek Sampah Medis (Warna Ungu) dengan Logo Medis Exp. N/A', NULL, 'lembar', 100, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(937, 4, 'BHN-KB-924', 'Korek api batang (N/A)', NULL, 'pak', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(938, 4, 'BHN-KB-833', 'Larutan Desinfektan (Clorine One Clean + Clorine tablet)', NULL, 'liter', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(939, 4, 'BHN-KB-167', 'Laminaria nTent \"KTK\" Exp. Januari 2027', NULL, 'pcs', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(940, 4, 'BHN-KB-207', 'Larce Exp. Sept\' 2025', NULL, 'pcs', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(941, 4, 'BHN-KB-952', 'Lidi Kapas Kambium Exp. N/A', NULL, 'pcs', 233, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(942, 4, 'BHN-KB-001', 'Lidi Wotten Steril (Transport swab) Exp. September 2027 (50), September 2028 (136)', NULL, 'pcs', 182, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(943, 4, 'BHN-KB-408', 'Lidokain injeksi (injeksi) Exp.Maret 2025 (40), Oktober 2028 (67)', NULL, 'ampul', 103, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(944, 4, 'BHN-KB-011', 'Masker Medis @ 1 box = 50 Pcs Exp. N/A', NULL, 'box', 14, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(945, 4, 'BHN-KB-020', 'Masker N95 Exp. N/A', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(946, 4, 'BHN-KB-030', 'Methergin/Ergometrin injeksi Exp.Tahun 2026 (1), Agustus 2026 (40), Juli 2027 (44)', NULL, 'ampul', 83, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(947, 4, 'BHN-KB-138', 'Metildopa Exp. Nopember 2025', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(948, 4, 'BHN-KB-680', 'Metronidazole (obat vagina tablet) Exp. Oktober 2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(949, 4, 'BHN-KB-558', 'MgSO4 Injeksi', NULL, 'fls', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(950, 4, 'BHN-KB-426', 'Miconazole', NULL, 'tube', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(951, 4, 'BHN-KB-779', 'Microlax (Obat Suppositol) Exp. Agustus 2027', NULL, 'tube', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(952, 4, 'BHN-KB-914', 'Minyak kayu putih (60 ml) Exp. Desember 2026', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(953, 4, 'BHN-KB-618', 'Minyak kayu putih (30 ml) Exp. November 2025', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(954, 4, 'BHN-KB-734', 'Minyak kayu putih (15 ml) Exp. September 2025', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(955, 4, 'BHN-KB-870', 'Minyak kayu putih (120 ml) Exp. Sept\' 2028', NULL, 'botol', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(956, 4, 'BHN-KB-529', 'Minyak telon 30 ml Exp. Juli 2027', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(957, 4, 'BHN-KB-272', 'Minyak telon 100 ml Exp. Mei 2025', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(958, 4, 'BHN-KB-725', 'NACL 0,9% (500 ml) Exp. Mei 2025 (2), Juli 2025 (3), Feb 2027 (26)', NULL, 'fls', 27, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(959, 4, 'BHN-KB-575', 'NACL 0,9% ( 100 ml) Exp.14/09/2025', NULL, 'fls', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(960, 4, 'BHN-KB-339', 'Nebacetin', NULL, 'tube', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(961, 4, 'BHN-KB-765', 'Neddle No. 21 G Exp. Mei 2027', NULL, 'pcs', 28, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(962, 4, 'BHN-KB-024', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(963, 4, 'BHN-KB-826', 'Neddle No. 22 G Exp. Maret 2029', NULL, 'pcs', 200, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(964, 4, 'BHN-KB-303', 'Neddle No. 23 G Exp. Juni 2028, Januari 2030 (56)', NULL, 'pcs', 100, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(965, 4, 'BHN-KB-537', 'Neddle No. 24 G Exp. Juni 2028', NULL, 'pcs', 49, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(966, 4, 'BHN-KB-388', 'Neddle No. 25 G Exp. Februari 2027', NULL, 'pcs', 97, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(967, 4, 'BHN-KB-571', 'Neddle No. 26 G Exp.Juni 2026', NULL, 'pcs', 34, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(968, 4, 'BHN-KB-344', 'Neddle No. 27 G Exp. Februari 2027', NULL, 'pcs', 98, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(969, 4, 'BHN-KB-373', 'Needle Flexpen 5mm', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(970, 4, 'BHN-KB-505', 'Neo Gynoxa (obat vagina krim) Exp. -', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(971, 4, 'BHN-KB-493', 'Norethisterone Enanthate (NET-EN) Exp.Januari 2027 (1) dan Exp. 01/12/2022 (6)', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(972, 4, 'BHN-KB-936', 'Nystatin (obat vagina tablet)', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(973, 4, 'BHN-KB-609', 'OBH Syrup Exp. Maret 2029', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(974, 4, 'BHN-KB-817', 'Obat untuk tambah darah (Fe Bumil) Exp.', NULL, 'lembar', 9, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(975, 4, 'BHN-KB-637', 'Obat Insulin Exp.', NULL, 'pcs', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(976, 4, 'BHN-KB-935', 'Oculenta (obat mata gel) Exp. Agustus 2026', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(977, 4, 'BHN-KB-040', 'Oil massage Exp. N/A (3)', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(978, 4, 'BHN-KB-922', 'Oil / Minyak zaitun massage', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(979, 4, 'BHN-KB-921', 'Oksitosin injeksi Exp.September 2025, Nopember 2027 (200)', NULL, 'ampul', 285, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(980, 4, 'BHN-KB-293', 'Olive Oil (50 ml) Exp. N/A (3)', NULL, 'botol', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(981, 4, 'BHN-KB-316', 'Panadol (Kaplet) Exp. Juni 2027', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(982, 4, 'BHN-KB-236', 'Parasetamol (Tablet) Exp. Mei 2026', NULL, 'tablet', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(983, 4, 'BHN-KB-715', 'Pembalut Maternitas Exp. N/A', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(984, 4, 'BHN-KB-320', 'Pembalut wanita (ukuran standar) Exp. N/A', NULL, 'pcs', 23, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(985, 4, 'BHN-KB-903', 'Pempers Dewasa Exp. N/A (2), 02/07/2026 (5)', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(986, 4, 'BHN-KB-077', 'Pempers Bayi (NB-S)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(987, 4, 'BHN-KB-150', 'Pengukur Lingkar Kepala Bayi (N/A)', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(988, 4, 'BHN-KB-265', 'Pengukur Lingkar Lengan (LILA) (N/A)', NULL, 'buah', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(989, 4, 'BHN-KB-658', 'Penutup Kepala (Disposible)', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(990, 4, 'BHN-KB-707', 'Plester anti air 10 cm x 1 m Exp. N/A', NULL, 'cm', 100, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(991, 4, 'BHN-KB-009', 'Plester anti air Exp. N/A', NULL, 'meter', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(992, 4, 'BHN-KB-374', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(993, 4, 'BHN-KB-570', 'Plester Ultrafix (10 cm x 5 m) Exp.Januari 2027', NULL, 'roll', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(994, 4, 'BHN-KB-729', 'Plester Ultrafix (15 cm x 5 m) Exp.', NULL, 'roll', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(995, 4, 'BHN-KB-628', 'Plester Ultrafix (5 cm x 5 m) Exp. Juli 2028', NULL, 'roll', 21, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(996, 4, 'BHN-KB-250', 'Plester Merah (1,25 cm x 5 m) Exp. Januari 2026', NULL, 'roll', 63, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(997, 4, 'BHN-KB-971', 'Plester Merah (1,25 cm x 1 m) Exp. N/A (19), Januari 2028 (37)', NULL, 'roll', 56, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(998, 4, 'BHN-KB-511', 'Plester Micropore Exp. N/A', NULL, 'pcs', 82, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(999, 4, 'BHN-KB-604', 'Plesterin (Plester Bulat) Exp.02/2027 (1.303), Exp.NA (182)', NULL, 'pcs', 737, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1000, 4, 'BHN-KB-671', 'Promag Exp. Mei 2025 (3 Blister @ 10 Tablet)', NULL, 'tablet', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1001, 4, 'BHN-KB-813', 'Profenid Supp.', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1002, 4, 'BHN-KB-832', 'Propanolol Exp. Januari 2027', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1003, 4, 'BHN-KB-653', 'Puzzel (Alat Permainan) (N/A)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1004, 4, 'BHN-KB-178', 'Reagent darah Anti A Exp.Januari 2026', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1005, 4, 'BHN-KB-455', 'Reagent darah Anti AB Exp. Agustus 2025', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1006, 4, 'BHN-KB-561', 'Reagent darah Anti B Exp. Desember 2025', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1007, 4, 'BHN-KB-583', 'Reagent darah Anti D Exp. Desember 2025', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1008, 4, 'BHN-KB-483', 'Reco 1% Exp. Juli 2025 (3), Sept\' 2025 (2)', NULL, 'tube', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1009, 4, 'BHN-KB-049', 'Rivanol @100 ml Exp. September 2025', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1010, 4, 'BHN-KB-472', 'Rhinos', NULL, 'kapsul', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1011, 4, 'BHN-KB-824', 'RL Exp. Desember 2025', NULL, 'fls', 74, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1012, 4, 'BHN-KB-061', 'Salbutamol Aerosol (obat oral spray) Exp. 31/01/2028', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1013, 4, 'BHN-KB-112', 'Sabun cuci tangan (Refill) Exp. Agustus 2028', NULL, 'botol', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1014, 4, 'BHN-KB-836', 'Sabun cuci Detergen (N/A)', NULL, 'sachet', 77, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1015, 4, 'BHN-KB-592', 'Sabun mandi bayi (batang)', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1016, 4, 'BHN-KB-358', 'Sabun mandi bayi (cair)', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1017, 4, 'BHN-KB-664', 'Sabun mandi dewasa (batang)', NULL, 'batang', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1018, 4, 'BHN-KB-759', 'Sabun mandi dewasa (cair) 100 ml Exp. 10/05/2026 (4), April 2027 (2), Desember 2027 (1), Januari 202', NULL, 'botol', 11, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1019, 4, 'BHN-KB-752', 'Sabun mandi dewasa (cair) 250 ml Exp. 03/06/2025', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1020, 4, 'BHN-KB-855', 'Safety box', NULL, 'pcs', 13, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1021, 4, 'BHN-KB-022', 'Sagestam 10 gram', NULL, 'tube', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1022, 4, 'BHN-KB-997', 'Salonpas Jet Spray', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1023, 4, 'BHN-KB-829', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1024, 4, 'BHN-KB-593', 'Sangobion Syrup Exp. 21/03/2026', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1025, 4, 'BHN-KB-353', 'SDIDTK (set mainan edukasi anak) (N/A)', NULL, 'set', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1026, 4, 'BHN-KB-308', 'Sedotan Plastik (Tekuk) (N/A)', NULL, 'pcs', 51, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1027, 4, 'BHN-KB-017', 'Selang Oksigen/Kanul Nasal Anak Exp. Agustus 2026', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1028, 4, 'BHN-KB-193', 'Selang Oksigen bayi Exp. April 2029', NULL, 'pcs', 55, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1029, 4, 'BHN-KB-160', 'Selang Oksigen (Sungkup Dewasa) Exp. 11/2028 (1), 04/2029 (2)', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1030, 4, 'BHN-KB-848', 'Selang Oksigen (Sungkup Bayi) Exp. 04/2027 (2), 04/2028 (2), 03/2029 (1)', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1031, 4, 'BHN-KB-384', 'Shampo Bayi Exp.Agust\'2026', NULL, 'botol', 9, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1032, 4, 'BHN-KB-432', 'Shampo Dewasa (70 ml) Exp. 09/02/2026 (5),10/05/2026 (5)', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1033, 4, 'BHN-KB-503', 'Sikat Gigi + Pasta Gigi Exp. 28/02/2028', NULL, 'paket', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1034, 4, 'BHN-KB-576', 'Sikat Instrumen medis Exp. April 2028', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1035, 4, 'BHN-KB-199', 'Sikat tangan/Surgical Brush (Reusable) Exp. 04/12/2027', NULL, 'buah', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1036, 4, 'BHN-KB-909', 'Sisir Bayi (N/A)', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1037, 4, 'BHN-KB-238', 'Sisir Dewasa (N/A)', NULL, 'buah', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1038, 4, 'BHN-KB-273', 'Spirtus Tgl.Repack 13/04/2016', NULL, 'ml', 900, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1039, 4, 'BHN-KB-557', 'Spuit 0,05 cc Exp. Maret 2027 (100), Juli 2027 (5)', NULL, 'pcs', 105, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1040, 4, 'BHN-KB-206', 'Spuit 0,5 cc Exp. Tahun 2021 (24), Agustus 2027 (100)', NULL, 'pcs', 82, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1041, 4, 'BHN-KB-458', 'Spuit 0,1 cc Exp. Februari 2029', NULL, 'pcs', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1042, 4, 'BHN-KB-052', 'Spuit 1 cc Exp. September 2025 (48), Agustus 2027 (100), Juli 2028 (200)', NULL, 'pcs', 291, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1043, 4, 'BHN-KB-176', 'Spuit 10 cc Exp. Mei 2028', NULL, 'pcs', 96, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1044, 4, 'BHN-KB-710', 'Spuit 20 cc', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1045, 4, 'BHN-KB-782', 'Spuit 3 cc Exp. Juli 2027 (288), Mei 2028 (250)', NULL, 'pcs', 222, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1046, 4, 'BHN-KB-973', 'Spuit 5 cc Exp.Nopember 2027(22),September 2028 (150)', NULL, 'pcs', 55, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1047, 4, 'BHN-KB-131', 'Spuit 50 ml (Eccentrik Trip) Exp. Agustus 2027', NULL, 'pcs', 8, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1048, 4, 'BHN-KB-880', 'Spuit 50 ml (One med Cath. Tip) Exp. Juni 2027, Agustus 2027 (2)', NULL, 'pcs', 7, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1049, 4, 'BHN-KB-028', 'Spuit 100ml (One med Cath. Tip) Exp. Agustus 2026', NULL, 'pcs', 10, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1050, 4, 'BHN-KB-842', 'Spuit khusus Insulin Exp. Nopember 2028', NULL, 'buah', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1051, 4, 'BHN-KB-334', 'Steimer (obat hidung spray) Exp. Agustus 2026', NULL, 'pcs', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1052, 4, 'BHN-KB-907', 'Stik Glukose (Elektrik) Exp. April 2025', NULL, 'strip', 50, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1053, 4, 'BHN-KB-642', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1054, 4, 'BHN-KB-450', 'Stik Hb (Elektrik)', NULL, 'strip', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1055, 4, 'BHN-KB-164', 'Stik Protein urine & glucose (celup) Exp.April 2026', NULL, 'pcs', 20, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1056, 4, 'BHN-KB-498', 'Stomach Tube/ Selang NGT Fr 3,5 Exp. N/A (2), Desember 2028 (23)', NULL, 'pcs', 25, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1057, 4, 'BHN-KB-770', 'Stomach Tube/ Selang NGT 5 Fr Exp. Mei 2027 (10), Desember 2027 (2), Juli 2029 (16)', NULL, 'pcs', 25, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1058, 4, 'BHN-KB-166', 'Stomach Tube/ Selang NGT 8 Fr Exp. Desember 2027, Januari 2029 (3)', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1059, 4, 'BHN-KB-831', 'Stomach Tube/ Selang NGT 14 Fr Exp. Agustus 2027', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1060, 4, 'BHN-KB-712', 'Stomach Tube/ Selang NGT 16 Fr Exp. Oktober 2027', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1061, 4, 'BHN-KB-892', 'Stomach Tube/ Selang NGT 18 Fr Exp. September 2027', NULL, 'pcs', 5, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1062, 4, 'BHN-KB-605', 'Suplemen Kalsium (Vitonal Calsi) Exp. Februari 2026', NULL, 'strip', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1063, 4, 'BHN-KB-775', 'Tabung sampel darah kecil warna merah Exp. Nopember 2026', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1064, 4, 'BHN-KB-034', 'Tabung sampel darah kecil warna ungu Exp. Februari 2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1065, 4, 'BHN-KB-284', 'Tabung sampel darah kecil warna hijau Exp. Maret 2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1066, 4, 'BHN-KB-064', 'Tabung sampel darah besar warna merah Exp. Februari 2028', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1067, 4, 'BHN-KB-280', 'Tabung sampel darah besar warna ungu Exp. Juli 2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1068, 4, 'BHN-KB-951', 'Tabung sampel darah besar warna hijau Exp. Desember 2027', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1069, 4, 'BHN-KB-543', 'Test Pack (Tes Kehamilan) Exp. 23/05/2025', NULL, 'pcs', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1070, 4, 'BHN-KB-144', 'Tissue BHD (N/A)', NULL, 'buah', 55, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1071, 4, 'BHN-KB-196', 'Tissue biasa 50 gram Exp. N/A', NULL, 'bungkus', 133, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1072, 4, 'BHN-KB-930', 'Tissue Pengesat 100 gram Exp. N/A', NULL, 'bungkus', 12, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1073, 4, 'BHN-KB-475', 'Transofix Exp. Desember 2027', NULL, 'pcs', 13, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1074, 4, 'BHN-KB-994', 'Tusuk gigi Exp. N/A tanpa bungkus (1500), N/A dengan bungkus (90)', NULL, 'pcs', 1540, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1075, 4, 'BHN-KB-094', 'Umbilical cord klem Exp. N/A', NULL, 'pcs', 155, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1076, 4, 'BHN-KB-708', 'Underpad', NULL, 'lembar', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1077, 4, 'BHN-KB-886', 'Urine bag Exp. Des\' 2027', NULL, 'pcs', 79, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1078, 4, 'BHN-KB-391', 'Vit. K injeksi (Pythomenadione) Exp. Juli 2026 (40), April 2026 (30)', NULL, 'vial', 70, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1079, 4, 'BHN-KB-123', 'NAMA BAHAN HABIS PAKAI', NULL, 'satuan', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1080, 4, 'BHN-KB-649', 'Vital ear (Obat Tetes Telinga) Exp. Mei 2025', NULL, 'botol', 0, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1081, 4, 'BHN-KB-490', 'Vaksin BCG + Pelarut 1 amp 20 dosis Exp.', NULL, 'vial', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1082, 4, 'BHN-KB-648', 'Vaksin Campak + Pelarut Exp.', NULL, 'vial', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1083, 4, 'BHN-KB-841', 'Vaksin Combo TD Exp.', NULL, 'vial', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1084, 4, 'BHN-KB-684', 'Vaksin DPT Combe5 Exp.', NULL, 'vial', 3, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1085, 4, 'BHN-KB-738', 'Vaksin DPT Pentabio Exp.', NULL, 'vial', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1086, 4, 'BHN-KB-041', 'Vaksin HB 0 Uniject Exp.April 2026', NULL, 'vial', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1087, 4, 'BHN-KB-948', 'Vaksin Polio Bivalen Exp.', NULL, 'vial', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1088, 4, 'BHN-KB-471', 'Water For Injecstion (25 ml) Exp. 01/04/2025', NULL, 'fls', 25, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1089, 4, 'BHN-KB-447', 'Water For Injecstion (50 ml) Exp.24/01/2027', NULL, 'botol', 4, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1090, 4, 'BHN-KB-095', 'Water For Injecstion (500 ml) Exp.29/06/2027', NULL, 'botol', 2, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1091, 4, 'BHN-KB-682', 'Water For Injecstion (1000 ml) Exp.', NULL, 'botol', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42'),
(1092, 4, 'BHN-KB-548', 'YB Aerosol Exp. Juli 2026', NULL, 'buah', 1, 0, 1, '2025-11-10 00:46:42', '2025-11-10 00:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `barang_stok_mutasi`
--

CREATE TABLE `barang_stok_mutasi` (
  `id_mutasi` bigint(20) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `sumber` enum('peminjaman','penyesuaian','lainnya') NOT NULL DEFAULT 'peminjaman',
  `referensi_id` varchar(50) DEFAULT NULL,
  `tipe` enum('keluar','masuk') NOT NULL,
  `qty` int(11) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `barang_stok_mutasi`
--

INSERT INTO `barang_stok_mutasi` (`id_mutasi`, `id_barang`, `sumber`, `referensi_id`, `tipe`, `qty`, `keterangan`, `created_at`) VALUES
(46, 2, 'peminjaman', 'PJM-20251110-0001', 'keluar', 1, 'Disetujui', '2025-11-10 07:47:55'),
(47, 375, 'peminjaman', 'PJM-20251110-0002', 'keluar', 1, 'Disetujui', '2025-11-10 08:59:30'),
(48, 5, 'peminjaman', 'PJM-20251110-0003', 'keluar', 10, 'Disetujui', '2025-11-10 08:59:40'),
(49, 375, 'peminjaman', 'PJM-20251110-0002', 'masuk', 1, 'Dikembalikan', '2025-11-10 09:00:59'),
(50, 5, 'peminjaman', 'PJM-20251110-0005', 'keluar', 10, 'Disetujui', '2025-11-10 09:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id_detail` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `catatan` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id_detail`, `id_peminjaman`, `id_barang`, `nama_barang`, `qty`, `catatan`) VALUES
(49, 65, 2, 'Advance Injection Training Arm / Phantom lengan injeksi TEST', 1, 'TEST PINJAM'),
(50, 66, 375, 'Alcohol swab', 1, 'test'),
(51, 67, 5, 'Alas Baki', 10, ''),
(52, 68, 3, 'Advanced Catheterisasi Trainer', 1, 'coba'),
(53, 69, 5, 'Alas Baki', 10, 'coba'),
(54, 70, 6, 'Alas Kasur', 5, 'hehe'),
(55, 71, 3, 'Advanced Catheterisasi Trainer', 1, 'test'),
(56, 72, 375, 'Alcohol swab', 99, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Kebidanan'),
(1, 'Keperawatan');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `catatan` varchar(255) DEFAULT NULL,
  `tanggal_ditambahkan` timestamp NOT NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `status` enum('belum_dibaca','dibaca') DEFAULT 'belum_dibaca',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `id_user`, `pesan`, `status`, `created_at`) VALUES
(55, 2, 'Peminjaman dengan kode <b>PJM-20251110-0001</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-10 08:46:46'),
(56, 2, 'Peminjaman dengan kode <b>PJM-20251110-0001</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-11-10 08:47:55'),
(57, 9, 'Peminjaman dengan kode <b>PJM-20251110-0002</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-10 09:57:00'),
(58, 9, 'Peminjaman dengan kode <b>PJM-20251110-0003</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-10 09:58:32'),
(59, 9, 'Peminjaman dengan kode <b>PJM-20251110-0002</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-11-10 09:59:30'),
(60, 9, 'Peminjaman dengan kode <b>PJM-20251110-0003</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-11-10 09:59:40'),
(61, 10, 'Peminjaman dengan kode <b>PJM-20251110-0004</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-10 10:05:54'),
(62, 10, 'Peminjaman dengan kode <b>PJM-20251110-0005</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-10 10:06:59'),
(63, 10, 'Peminjaman dengan kode <b>PJM-20251110-0006</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-10 10:12:57'),
(64, 10, 'Peminjaman dengan kode <b>PJM-20251110-0004</b> telah <span class=\'text-red-600 font-semibold\'>ditolak</span>.', 'belum_dibaca', '2025-11-10 10:14:29'),
(65, 10, 'Peminjaman dengan kode <b>PJM-20251110-0005</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-11-10 10:14:36'),
(66, 2, 'Peminjaman dengan kode <b>PJM-20251111-0001</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-11 16:55:06'),
(67, 10, 'Peminjaman dengan kode <b>PJM-20251111-0002</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-11-11 16:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `kode_peminjaman` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_peminjam` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `jurusan` varchar(100) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `tanggal_disetujui` datetime DEFAULT NULL,
  `tanggal_dikembalikan` datetime DEFAULT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `status` enum('pending','disetujui','ditolak','dikembalikan') NOT NULL DEFAULT 'pending',
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `kode_peminjaman`, `id_user`, `nama_peminjam`, `no_hp`, `jurusan`, `kelas`, `nama_barang`, `tanggal_pinjam`, `tanggal_kembali`, `tanggal_disetujui`, `tanggal_dikembalikan`, `tujuan`, `status`, `keterangan`, `created_at`, `updated_at`) VALUES
(65, 'PJM-20251110-0001', 2, 'Endeavour', '08991345688', 'test2', 'TI-3B', 'Advance Injection Training Arm / Phantom lengan injeksi TEST', '2025-11-10', '2025-11-20', '2025-11-10 08:47:55', NULL, 'lab test', 'disetujui', 'Test pinjam', '2025-11-10 07:46:46', '2025-11-10 07:47:55'),
(66, 'PJM-20251110-0002', 9, 'Deku', '08991345659', 'test2', 'TI-3B', 'Alcohol swab', '2025-11-10', '2025-11-20', '2025-11-10 09:59:30', '2025-11-10 00:00:00', 'lab test2', 'dikembalikan', 'oe', '2025-11-10 08:57:00', '2025-11-10 09:00:59'),
(67, 'PJM-20251110-0003', 9, 'Deku', '08991345659', 'test2', 'TI-3B', 'Alas Baki', '2025-10-10', '2025-11-20', '2025-11-10 09:59:40', NULL, 'lab test2', 'disetujui', '', '2025-11-10 08:58:32', '2025-11-10 08:59:40'),
(68, 'PJM-20251110-0004', 10, 'Budi', '08991345657', 'test', 'TI-3C', 'Advanced Catheterisasi Trainer', '2025-09-10', '2025-09-14', NULL, NULL, 'lab test', 'ditolak', 'coba', '2025-11-10 09:05:54', '2025-11-10 09:14:29'),
(69, 'PJM-20251110-0005', 10, 'Upin', '08991345688', 'test3', 'TI-3B', 'Alas Baki', '2025-08-10', '2025-11-20', '2025-11-10 10:14:36', NULL, 'lab test', 'disetujui', 'coba', '2025-11-10 09:06:59', '2025-11-10 09:14:36'),
(70, 'PJM-20251110-0006', 10, 'Ipin', '08991345657', 'test2', 'TI-3B', 'Alas Kasur', '2025-10-10', '2025-10-12', NULL, NULL, 'lab test', 'pending', 'ok', '2025-11-10 09:12:57', NULL),
(71, 'PJM-20251111-0001', 2, 'Aceng', '08991345657', 'test', 'TI-3B', 'Advanced Catheterisasi Trainer', '2025-11-11', '2025-11-11', NULL, NULL, 'lab test2', 'pending', 'oke', '2025-11-11 15:55:06', NULL),
(72, 'PJM-20251111-0002', 10, 'Jarjit', '08991345657', 'test', 'TI-3B', 'Alcohol swab', '2025-10-11', '2025-10-19', NULL, NULL, 'lab test', 'pending', 'oke', '2025-11-11 15:58:35', NULL);

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `trg_peminjaman_approved_after_update` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
  IF (OLD.status <> NEW.status) AND (NEW.status = 'disetujui') THEN
    -- Kurangi stok setiap barang yang ada di detail
    UPDATE barang b
    JOIN detail_peminjaman d ON d.id_barang = b.id_barang
    SET b.stok = b.stok - d.qty
    WHERE d.id_peminjaman = NEW.id_peminjaman;

    -- Catat mutasi stok (keluar)
    INSERT INTO barang_stok_mutasi (id_barang, sumber, referensi_id, tipe, qty, keterangan)
    SELECT d.id_barang, 'peminjaman', NEW.kode_peminjaman, 'keluar', d.qty, 'Disetujui'
    FROM detail_peminjaman d
    WHERE d.id_peminjaman = NEW.id_peminjaman;

  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_peminjaman_returned_after_update` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
  IF (OLD.status = 'disetujui') AND (NEW.status = 'dikembalikan') THEN
    -- Tambah stok kembali
    UPDATE barang b
    JOIN detail_peminjaman d ON d.id_barang = b.id_barang
    SET b.stok = b.stok + d.qty
    WHERE d.id_peminjaman = NEW.id_peminjaman;

    -- Catat mutasi stok (masuk)
    INSERT INTO barang_stok_mutasi (id_barang, sumber, referensi_id, tipe, qty, keterangan)
    SELECT d.id_barang, 'peminjaman', NEW.kode_peminjaman, 'masuk', d.qty, 'Dikembalikan'
    FROM detail_peminjaman d
    WHERE d.id_peminjaman = NEW.id_peminjaman;

  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_verifikasi_log`
--

CREATE TABLE `peminjaman_verifikasi_log` (
  `id_log` bigint(20) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `aksi` enum('setujui','tolak','kembalikan') NOT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman_verifikasi_log`
--

INSERT INTO `peminjaman_verifikasi_log` (`id_log`, `id_peminjaman`, `id_admin`, `aksi`, `catatan`, `created_at`) VALUES
(42, 65, 3, 'setujui', NULL, '2025-11-10 07:47:55'),
(43, 66, 3, 'setujui', NULL, '2025-11-10 08:59:30'),
(44, 67, 3, 'setujui', NULL, '2025-11-10 08:59:40'),
(45, 68, 9, 'tolak', NULL, '2025-11-10 09:14:29'),
(46, 69, 9, 'setujui', NULL, '2025-11-10 09:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `sub_kategori`
--

CREATE TABLE `sub_kategori` (
  `id_sub_kategori` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_sub` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_kategori`
--

INSERT INTO `sub_kategori` (`id_sub_kategori`, `id_kategori`, `nama_sub`) VALUES
(1, 1, 'Alat'),
(3, 1, 'Bahan'),
(2, 2, 'Alat'),
(4, 2, 'Bahan');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin','superadmin') NOT NULL DEFAULT 'user',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status_approval` enum('pending','approved','rejected') DEFAULT 'approved',
  `requested_role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `email`, `password`, `role`, `is_active`, `created_at`, `updated_at`, `status_approval`, `requested_role`) VALUES
(2, 'skay TEST', 'sky TEST', 'sky@test.com', '$2y$10$C1P.EjZ/VSy.Nz94iV.vP.rGJBP.BltgYQQKDm8VwZVGyvnQKHXKq', 'user', 1, '2025-09-03 09:54:15', '2025-11-10 07:43:45', 'approved', NULL),
(3, 'admin1', 'admin1', 'admin@test.com', '$2y$10$cD0EQ93UvVs0eOfEcHPEAeoVn1alibdQQa3bfq30gyjt6YqcuTyBi', 'admin', 1, '2025-09-03 09:54:15', '2025-10-20 09:42:34', 'approved', NULL),
(8, 'user', 'user', 'user@gmail.com', '$2y$10$weqiVO.d/efFG61/40cWL.pKvU25uoPMvKUiMQyRAyZSMOtETjVES', 'user', 1, '2025-10-20 09:23:06', '2025-11-10 09:02:46', 'approved', NULL),
(9, 'admin2', 'admin2', 'admin2@gmail.com', '$2y$10$H7kVG0Kyh7AvbmsTg5.PMuSijoJKwQc/MVXbD9ErWqfQtfYKfuccK', 'admin', 1, '2025-11-10 07:50:36', '2025-11-10 09:01:27', 'approved', NULL),
(10, 'user2', 'user2', 'user2@gmail.com', '$2y$10$9eg332GgMBJAXL8/ubEk4.9yWZLF00aENtsDhu3A6JMp00dypFR.i', 'user', 1, '2025-11-10 07:52:10', '2025-11-10 09:02:19', 'approved', NULL),
(11, 'admin 3', 'admin3', 'admin3@gmail.com', '$2y$10$qFjU96c.tY2rdSgRt4ZB.ebUqnmdHnbx72yX94AL.FSnqj/zd.IMe', 'admin', 1, '2025-11-10 09:58:33', '2025-11-10 10:06:20', 'approved', NULL),
(12, 'admin 4', 'admin4', 'admin4@gmail.com', '$2y$10$2Ydag0OFJpY4pWobTwNkzuskA8ZDUKVzpFRh6fSHbE85r6Tthtysy', 'user', 1, '2025-11-10 10:05:22', NULL, 'pending', 'admin'),
(13, 'user 4', 'user4', 'user4@gmail.com', '$2y$10$W5ismczKUVMPM432rMjJ8.4EmZk3YsryW29iIAi.3FP1cDS46gdy6', 'user', 1, '2025-11-10 10:05:59', NULL, 'approved', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `uq_kode` (`kode_barang`),
  ADD KEY `idx_nama_barang` (`nama_barang`),
  ADD KEY `fk_barang_subkat` (`id_sub_kategori`);

--
-- Indexes for table `barang_stok_mutasi`
--
ALTER TABLE `barang_stok_mutasi`
  ADD PRIMARY KEY (`id_mutasi`),
  ADD KEY `idx_mutasi_barang` (`id_barang`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id_detail`),
  ADD UNIQUE KEY `uq_detail` (`id_peminjaman`,`id_barang`),
  ADD KEY `idx_pjm` (`id_peminjaman`),
  ADD KEY `fk_det_barang` (`id_barang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `uq_kategori` (`nama_kategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD UNIQUE KEY `uq_cart` (`id_user`,`id_barang`),
  ADD KEY `fk_cart_barang` (`id_barang`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD UNIQUE KEY `uq_kode_pjm` (`kode_peminjaman`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_user_status` (`id_user`,`status`);

--
-- Indexes for table `peminjaman_verifikasi_log`
--
ALTER TABLE `peminjaman_verifikasi_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `idx_log_pjm` (`id_peminjaman`),
  ADD KEY `fk_log_admin` (`id_admin`);

--
-- Indexes for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD PRIMARY KEY (`id_sub_kategori`),
  ADD UNIQUE KEY `uq_sub` (`id_kategori`,`nama_sub`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang_stok_mutasi`
--
ALTER TABLE `barang_stok_mutasi`
  MODIFY `id_mutasi` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman_verifikasi_log`
--
ALTER TABLE `peminjaman_verifikasi_log`
  MODIFY `id_log` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  MODIFY `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_barang_subkat` FOREIGN KEY (`id_sub_kategori`) REFERENCES `sub_kategori` (`id_sub_kategori`) ON UPDATE CASCADE;

--
-- Constraints for table `barang_stok_mutasi`
--
ALTER TABLE `barang_stok_mutasi`
  ADD CONSTRAINT `fk_mutasi_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `fk_det_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_det_pjm` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `fk_cart_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_pjm_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman_verifikasi_log`
--
ALTER TABLE `peminjaman_verifikasi_log`
  ADD CONSTRAINT `fk_log_admin` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_log_pjm` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD CONSTRAINT `fk_subkat_kat` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
