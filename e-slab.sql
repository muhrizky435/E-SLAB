-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2025 at 12:09 PM
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
(372, 3, 'BHN-647', 'Testtest', '', 'pcs', 88, 1, 1, '2025-10-17 05:52:34', '2025-10-20 07:42:58'),
(373, 1, 'ALT-KP-188', 'Test alat1', '', 'pcs', 93, 1, 1, '2025-10-17 05:54:28', '2025-10-20 07:53:04'),
(374, 1, 'ALT-KP889', 'Advance Injection Training Arm / Phantom lengan injeksi', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 09:19:47'),
(375, 1, 'ALT-KP687', 'Advanced Catheterisasi Trainer', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(376, 1, 'ALT-KP169', 'Airway Training Model', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 09:21:13'),
(377, 1, 'ALT-KP427', 'Alas Baki', NULL, 'pcs', 70, 0, 1, '2025-10-20 01:56:12', '2025-10-20 09:35:13'),
(378, 1, 'ALT-KP438', 'Alas Kasur', NULL, 'pcs', 9, 0, 1, '2025-10-20 01:56:12', '2025-10-20 09:26:28'),
(379, 1, 'ALT-KP482', 'Alas Kerja', NULL, 'pcs', 57, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(380, 1, 'ALT-KP601', 'Alat peraga kelainan cervic', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(381, 1, 'ALT-KP136', 'Alat Peraga Sistem Reproduksi Pria', NULL, 'pcs', 0, 0, 1, '2025-10-20 01:56:12', '2025-10-20 09:34:04'),
(382, 1, 'ALT-KP543', 'Alat Peraga Sistem Reproduksi Wanita', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(383, 1, 'ALT-KP334', 'Ambu Bag dewasa', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(384, 1, 'ALT-KP008', 'Arm Spling', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(385, 1, 'ALT-KP365', 'Arterial Puncture Arm', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(386, 1, 'ALT-KP612', 'Arterial Puncture Wrist', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(388, 1, 'ALT-KP689', 'Baby Incubator', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(389, 1, 'ALT-KP297', 'Baju bayi', NULL, 'pcs', 16, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(390, 1, 'ALT-KP628', 'Baju ICU Hijau', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(391, 1, 'ALT-KP392', 'Baju ICU putih', NULL, 'pcs', 13, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(392, 1, 'ALT-KP053', 'Baju Kanguru', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(393, 1, 'ALT-KP263', 'Baju Pasien', NULL, 'pcs', 22, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(394, 1, 'ALT-KP363', 'Baju Phantom', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(395, 1, 'ALT-KP321', 'Bak instrumen 20 cm x 10 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(396, 1, 'ALT-KP528', 'Bak instrumen 21 cm x 8 cm', NULL, 'pcs', 53, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(397, 1, 'ALT-KP831', 'Bak instrumen 22 cm x 12 cm', NULL, 'pcs', 57, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(398, 1, 'ALT-KP600', 'Bak instrumen 22 cm x 15 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(399, 1, 'ALT-KP043', 'Bak instrumen 25 cm x 13 cm', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(400, 1, 'ALT-KP561', 'Bak instrumen 26 cm x 15 cm', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(401, 1, 'ALT-KP997', 'Bak instrumen 30 cm x 20 cm', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(402, 1, 'ALT-KP531', 'Bak instrumen 31 cm x 20 cm', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(403, 1, 'ALT-KP659', 'Bak instrumen ukuran 32 cm x 9 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(404, 1, 'ALT-KP150', 'Bak instrumen ukuran 34 cm x 17 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(405, 1, 'ALT-KP865', 'Bak instrumen ukuran 37 cm x 18 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(406, 1, 'ALT-KP785', 'Bak instrumen ukuran 43 cm x 10 cm', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(407, 1, 'ALT-KP325', 'Bak instrumen ukuran 49 cm x 13 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(408, 1, 'ALT-KP527', 'Bak mandi bayi', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(409, 1, 'ALT-KP887', 'Baki', NULL, 'pcs', 46, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(410, 1, 'ALT-KP063', 'Bantal hangat elektrik', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(411, 1, 'ALT-KP097', 'Bantal simulasi hecting', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(412, 1, 'ALT-KP774', 'Bantal tidur pasien', NULL, 'pcs', 9, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(413, 1, 'ALT-KP129', 'Baskom bulat plastik diameter 32 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(414, 1, 'ALT-KP335', 'Baskom bulat plastik diameter 33 cm', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(415, 1, 'ALT-KP348', 'Baskom bulat plastik diameter 36 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(416, 1, 'ALT-KP449', 'Baskom bulat plastik diameter 44 cm', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(417, 1, 'ALT-KP787', 'Baskom bulat stainles diameter 26 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(418, 1, 'ALT-KP048', 'Baskom bulat stainles diameter 27 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(419, 1, 'ALT-KP586', 'Baskom bulat stainles diameter 29 cm', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(420, 1, 'ALT-KP027', 'Baskom bulat stainles diameter 30 cm', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(421, 1, 'ALT-KP248', 'Baskom bulat stainles diameter 31 cm', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(422, 1, 'ALT-KP557', 'Baskom bulat stainles diameter 32 cm', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(423, 1, 'ALT-KP208', 'Baskom bulat stainles diameter 33 cm', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(424, 1, 'ALT-KP503', 'Baskom bulat stainles diameter 34 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(425, 1, 'ALT-KP254', 'Baskom bulat stainles diameter 39 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(426, 1, 'ALT-KP875', 'Baskom bulat stainles diameter 40 cm', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(427, 1, 'ALT-KP234', 'Baskom bulat stainles diameter 41 cm', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(428, 1, 'ALT-KP568', 'Baskom bulat stainles diameter 42 cm', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(429, 1, 'ALT-KP477', 'Baskom kotak ukuran P : 34 CM L : 27 CM T : 9 CM', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(430, 1, 'ALT-KP269', 'Bed ICU', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(431, 1, 'ALT-KP956', 'Bed Side Monitor', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(432, 1, 'ALT-KP795', 'Bedpan stainles', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(433, 1, 'ALT-KP702', 'Bengkok', NULL, 'pcs', 108, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(434, 1, 'ALT-KP576', 'Blood Warmer', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(435, 1, 'ALT-KP951', 'Body Infrared Thermometer', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(436, 1, 'ALT-KP694', 'Body Splint Immobilizer (KED)', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(437, 1, 'ALT-KP912', 'Botol WSD', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(438, 1, 'ALT-KP722', 'Boven Laken', NULL, 'pcs', 31, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(439, 1, 'ALT-KP430', 'Box Pemeriksaan SDIDTK', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(440, 1, 'ALT-KP976', 'Brankard / Emergency Sretcher', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(441, 1, 'ALT-KP994', 'Breast Pump, Breast Reliever', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(442, 1, 'ALT-KP417', 'Breast Self Examination Model', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(443, 1, 'ALT-KP262', 'Buku Bagan Manajemen Terpadu Balita Sakit (MTBS)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(444, 1, 'ALT-KP815', 'Buku Format Pengkajian Status Kesehatan Keluarga', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(445, 1, 'ALT-KP088', 'Buku KIA', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(446, 1, 'ALT-KP662', 'Buku KIE Kesehatan Reproduksi Remaja', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(447, 1, 'ALT-KP667', 'Buku Model Posyandu', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(448, 1, 'ALT-KP678', 'Buku Petunjuk Pengisian Family Folder (Asuhan Keperawatan Keluarga)', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(449, 1, 'ALT-KP736', 'Buku Saku KRR', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(450, 1, 'ALT-KP525', 'Buli - buli panas', NULL, 'pcs', 9, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(451, 1, 'ALT-KP007', 'Casuality Simulation Kit (Phantom Luka)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(452, 1, 'ALT-KP122', 'CD Pembelajaran : Alat Reproduksi manusia', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(453, 1, 'ALT-KP626', 'Celana bayi', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(454, 1, 'ALT-KP560', 'Celana Dalam dewasa (wanita)', NULL, 'pcs', 20, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(455, 1, 'ALT-KP937', 'Celemek / Apron', NULL, 'pcs', 18, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(456, 1, 'ALT-KP133', 'Celemek makan bayi', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(457, 1, 'ALT-KP681', 'Cermin', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(458, 1, 'ALT-KP456', 'Chest Drain & Needle Decompresion Trainer', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(459, 1, 'ALT-KP005', 'Circulation Pump', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(460, 1, 'ALT-KP059', 'Complete Auscultation Training System', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(461, 1, 'ALT-KP395', 'Cutdown Pad', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(462, 1, 'ALT-KP391', 'Decubitus Treatment Model', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(463, 1, 'ALT-KP526', 'Doppler', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(464, 1, 'ALT-KP982', 'Duk Bolong', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(465, 1, 'ALT-KP862', 'Ember plastik', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(466, 1, 'ALT-KP180', 'Eskap / Ice bag / Kirbat Es', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(467, 1, 'ALT-KP676', 'ETT (Endotracheal Tube)', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(468, 1, 'ALT-KP370', 'Fetal Monitor', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(469, 1, 'ALT-KP251', 'Food Model', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(470, 1, 'ALT-KP655', 'Gambar / Chart untuk PBM', NULL, 'pcs', 49, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(471, 1, 'ALT-KP900', 'Garputala', NULL, 'pcs', 34, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(472, 1, 'ALT-KP581', 'Gayung', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(473, 1, 'ALT-KP844', 'GCHB', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(474, 1, 'ALT-KP759', 'GCU', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(475, 1, 'ALT-KP246', 'Gelas plastik / Gelas kumur', NULL, 'pcs', 29, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(476, 1, 'ALT-KP290', 'Gelas Ukur Hb', NULL, 'pcs', 9, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(477, 1, 'ALT-KP156', 'Gendongan kanguru', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(478, 1, 'ALT-KP758', 'Gliserin Spuit', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(479, 1, 'ALT-KP980', 'Glukosmeter Family dr', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(480, 1, 'ALT-KP186', 'Gunting biasa', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(481, 1, 'ALT-KP574', 'Gunting Efisiotomi', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(482, 1, 'ALT-KP184', 'Gunting Jaringan', NULL, 'pcs', 24, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(483, 1, 'ALT-KP821', 'Gunting Kuku', NULL, 'pcs', 29, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(484, 1, 'ALT-KP493', 'Gunting Perban / Lister Bandage Scissors', NULL, 'pcs', 32, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(485, 1, 'ALT-KP498', 'Gunting Runcing', NULL, 'pcs', 33, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(486, 1, 'ALT-KP375', 'Gunting Tali Pusat', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(487, 1, 'ALT-KP116', 'Gunting Up Heacting', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(488, 1, 'ALT-KP332', 'Gurita Ibu', NULL, 'pcs', 16, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(489, 1, 'ALT-KP772', 'Handuk Besar', NULL, 'pcs', 75, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(490, 1, 'ALT-KP486', 'Handuk Kerja (putih)', NULL, 'pcs', 70, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(491, 1, 'ALT-KP283', 'Handuk Kerja (warna)', NULL, 'pcs', 30, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(492, 1, 'ALT-KP941', 'HB meter Family dr', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(493, 1, 'ALT-KP664', 'Hb Sahli (Lengkap)', NULL, 'pcs', 36, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(494, 1, 'ALT-KP692', 'Head Immobilizer', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(495, 1, 'ALT-KP377', 'Helm Lacover', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(496, 1, 'ALT-KP413', 'Ice Pack', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(497, 1, 'ALT-KP388', 'Infant Arm', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(498, 1, 'ALT-KP118', 'Infant Training Leg', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(499, 1, 'ALT-KP917', 'Infant warmer', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(500, 1, 'ALT-KP025', 'Injection Trainer (IM)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(501, 1, 'ALT-KP210', 'Instrumen Simulasi, Deteksi dan Intervensi Dini Tumbuh Kembang Anak', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(502, 1, 'ALT-KP276', 'Intramuscular Injection Aid', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(503, 1, 'ALT-KP673', 'Intravenous Injection Arm', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(504, 1, 'ALT-KP032', 'Irrigator huknah diameter 12 cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(505, 1, 'ALT-KP238', 'IUD Kit (Pemasangan dan Pencabutan IUD)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(506, 1, 'ALT-KP739', 'IUD Removal Hook', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(507, 1, 'ALT-KP404', 'IUD String Retriever', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(508, 1, 'ALT-KP463', 'Jas lab', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(509, 1, 'ALT-KP127', 'Kabel panjang (terminal)', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(510, 1, 'ALT-KP247', 'Kacamata Pelindung (Google)', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(511, 1, 'ALT-KP255', 'Kain panjang (tapi)', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(512, 1, 'ALT-KP536', 'Kain parnel', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(513, 1, 'ALT-KP013', 'Kain tempat linen kotor', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(514, 1, 'ALT-KP814', 'Kain untuk sterilisasi', NULL, 'pcs', 20, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(515, 1, 'ALT-KP876', 'Kalender Masa subur & tidak subur', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(516, 1, 'ALT-KP929', 'Kaos dalam bayi', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(517, 1, 'ALT-KP000', 'Karpet Puzzle', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(518, 1, 'ALT-KP896', 'Kartu E Untuk Tes Daya Lihat', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(519, 1, 'ALT-KP547', 'Keranjang alat tenun kotor', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(520, 1, 'ALT-KP185', 'Kipas angin berdiri', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(521, 1, 'ALT-KP003', 'Klem Arteri / pean lurus', NULL, 'pcs', 19, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(522, 1, 'ALT-KP431', 'Klem Arteri bengkok / mosquito', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(523, 1, 'ALT-KP623', 'Klem kocher lurus (besar)', NULL, 'pcs', 40, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(524, 1, 'ALT-KP891', 'Klem kocher lurus (kecil)', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(525, 1, 'ALT-KP204', 'Klem tali pusat', NULL, 'pcs', 23, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(526, 1, 'ALT-KP436', 'KMS (Kartu Menuju Sehat)', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(527, 1, 'ALT-KP245', 'Kom diameter 10 cm', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(528, 1, 'ALT-KP718', 'Kom diameter 12 cm', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(529, 1, 'ALT-KP103', 'Kom diameter 14 cm', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(530, 1, 'ALT-KP440', 'Kom diameter 15 cm', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(531, 1, 'ALT-KP301', 'Kom diameter 16 cm', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(532, 1, 'ALT-KP666', 'Kom diameter 17 cm', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(533, 1, 'ALT-KP502', 'Kom diameter 22 cm', NULL, 'pcs', 15, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(534, 1, 'ALT-KP864', 'Kom diameter 6 cm', NULL, 'pcs', 35, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(535, 1, 'ALT-KP146', 'Kom diameter 7 cm', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(536, 1, 'ALT-KP713', 'Kom diameter 8 cm', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(537, 1, 'ALT-KP810', 'Kom diameter 9 cm', NULL, 'pcs', 39, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(538, 1, 'ALT-KP542', 'Kom melamin diameter 5 cm', NULL, 'pcs', 59, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(539, 1, 'ALT-KP575', 'Kom melamin diameter 6 cm', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(540, 1, 'ALT-KP556', 'Kom melamin diameter 8 cm', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(541, 1, 'ALT-KP230', 'Kom Sputum', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(542, 1, 'ALT-KP281', 'Korentang', NULL, 'pcs', 15, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(543, 1, 'ALT-KP829', 'Kursi roda', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(544, 1, 'ALT-KP074', 'Laci pasien', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(545, 1, 'ALT-KP418', 'Laken', NULL, 'pcs', 31, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(546, 1, 'ALT-KP977', 'Laken Anak', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(547, 1, 'ALT-KP219', 'Laken Bayi', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(548, 1, 'ALT-KP630', 'Lampu Infrared', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(549, 1, 'ALT-KP222', 'Lampu sorot', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(550, 1, 'ALT-KP444', 'Lap Kerja', NULL, 'pcs', 14, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(551, 1, 'ALT-KP756', 'Laringoskop', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(552, 1, 'ALT-KP972', 'Laryngoscope Set', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(553, 1, 'ALT-KP318', 'Leaflet - Leaflet', NULL, 'pcs', 71, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(554, 1, 'ALT-KP946', 'Lembar balik untuk konseling', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(555, 1, 'ALT-KP888', 'Lenghtboard', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(556, 1, 'ALT-KP264', 'Long Spine Board', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(557, 1, 'ALT-KP757', 'Mainan Anak', NULL, 'pcs', 20, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(558, 1, 'ALT-KP153', 'Masker oksigen sederhana (anak)', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(559, 1, 'ALT-KP499', 'Masker oksigen sederhana (dewasa)', NULL, 'pcs', 13, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(560, 1, 'ALT-KP195', 'Masker Oksigen Venturi', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(561, 1, 'ALT-KP148', 'Mathieu Nald Poeder', NULL, 'pcs', 13, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(562, 1, 'ALT-KP082', 'Matras', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(563, 1, 'ALT-KP445', 'Mayo / Gudel / OPA (anak)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(564, 1, 'ALT-KP158', 'Mayo / Gudel / OPA (dewasa)', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(565, 1, 'ALT-KP762', 'Mesin EKG', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(566, 1, 'ALT-KP196', 'Mesin Suction', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(567, 1, 'ALT-KP735', 'Metal kateter', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(568, 1, 'ALT-KP685', 'Metline', NULL, 'pcs', 49, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(569, 1, 'ALT-KP682', 'Mikrotoa', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(570, 1, 'ALT-KP881', 'Mitela', NULL, 'pcs', 97, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(571, 1, 'ALT-KP726', 'Model Gigi', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(572, 1, 'ALT-KP450', 'Model Otot', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(573, 1, 'ALT-KP942', 'Monoaural', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(574, 1, 'ALT-KP066', 'Mucus extractor', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(575, 1, 'ALT-KP073', 'Multifunction Infrared Thermometer', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(576, 1, 'ALT-KP010', 'Nald Poeder', NULL, 'pcs', 32, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(577, 1, 'ALT-KP698', 'Nasopharingeal Tube', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(578, 1, 'ALT-KP559', 'Nebulizer', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(579, 1, 'ALT-KP872', 'Nebulizer Ultrasonic', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(580, 1, 'ALT-KP926', 'Neck Colar', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(581, 1, 'ALT-KP811', 'Neonatal Simulator With Smart Skin Technology', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(582, 1, 'ALT-KP469', 'Nurse Training Baby, New Born', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(583, 1, 'ALT-KP680', 'Opthalmoscope', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(584, 1, 'ALT-KP658', 'Otoscope', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(585, 1, 'ALT-KP565', 'Ovarium Klem', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(586, 1, 'ALT-KP954', 'Over Laken', NULL, 'pcs', 19, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(587, 1, 'ALT-KP765', 'Papan flipchart', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(588, 1, 'ALT-KP585', 'Papan penunjuk meja posyandu', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(589, 1, 'ALT-KP539', 'Particulate Respirator', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(590, 1, 'ALT-KP426', 'Partus Set', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(591, 1, 'ALT-KP562', 'Pediatric Nurse Training Newborn', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(592, 1, 'ALT-KP930', 'Pegangan pisau/ Handle Surgical Knife', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(593, 1, 'ALT-KP731', 'Penggerus Obat', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(594, 1, 'ALT-KP683', 'Pengukur LILA', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(595, 1, 'ALT-KP233', 'Pengukur Luka / Penggaris Luka', NULL, 'pcs', 35, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(596, 1, 'ALT-KP867', 'Penlight', NULL, 'pcs', 36, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(597, 1, 'ALT-KP343', 'Penyedot / Set HB Sahli (tidak ada angka)', NULL, 'pcs', 13, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(598, 1, 'ALT-KP042', 'Peraga Alat dan Obat Kontrasepsi', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(599, 1, 'ALT-KP291', 'Peraga heacting perinium kain', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(600, 1, 'ALT-KP618', 'Perlak besar', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(601, 1, 'ALT-KP315', 'Perlak dengan kain di sampingnya', NULL, 'pcs', 13, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(602, 1, 'ALT-KP249', 'Phantom bayi', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(603, 1, 'ALT-KP501', 'Phantom Birthing Station Simulator', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(604, 1, 'ALT-KP643', 'Phantom EVA Pelvic Teaching Model / EVA Gynecologic Manikin (Phantom Reproduksi Wanita)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(605, 1, 'ALT-KP192', 'Phantom Female Catheterization Simulator (Phantom Kateterisasi Wanita)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(606, 1, 'ALT-KP566', 'Phantom heacting silikon', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(607, 1, 'ALT-KP967', 'Phantom Ibu Hamil / Noelle Maternal And Neonatal Birth Simulator With PEDI Blue Note', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(608, 1, 'ALT-KP411', 'Phantom Injeksi IM / Gluteal Intramuscular Injection Model II', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(609, 1, 'ALT-KP014', 'Phantom Kerangka Panggul dan kepala bayi / Childbirth Demonstration Pelvis', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(610, 1, 'ALT-KP181', 'Phantom Kerangka Panggul dan kepala bayi / Pelvic Bone with Fetal Heads On Stand', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(611, 1, 'ALT-KP331', 'Phantom Laserasi Perinium / Episiotomy Suturing Simulator', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(612, 1, 'ALT-KP642', 'Phantom lengan dewasa (IV IM SC IC)', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(613, 1, 'ALT-KP611', 'Phantom lengan dewasa IV', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(614, 1, 'ALT-KP607', 'Phantom Lengan Infus', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(615, 1, 'ALT-KP645', 'Phantom Life Form\'s (Phantom Ventilasi)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(616, 1, 'ALT-KP986', 'Phantom Luka (karet)', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(617, 1, 'ALT-KP732', 'Phantom Luka (kayu)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(618, 1, 'ALT-KP138', 'Phantom Male Catheterization Simulator (Phantom Kateterisasi Pria)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(619, 1, 'ALT-KP351', 'Phantom Model Vagina', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(620, 1, 'ALT-KP242', 'Phantom Palpasi Abdomen / Obstetrical Manikin', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(621, 1, 'ALT-KP393', 'Phantom payudara (kayu)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(622, 1, 'ALT-KP344', 'Phantom Pemasangan ETT (EndoTracheal Tube)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(623, 1, 'ALT-KP126', 'Phantom Pemasangan Tracheostomy', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(624, 1, 'ALT-KP915', 'Phantom Pembukaan Serviks / Cervical Dilatation / Effacement Simulator', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(625, 1, 'ALT-KP381', 'Phantom Peraga Pelatihan Pemasangan dan Pencabutan Implant', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(626, 1, 'ALT-KP494', 'Phantom Peraga Pelatihan Pemasangan dan Pencabutan IUD', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(627, 1, 'ALT-KP164', 'Phantom Perawatan Colostomi dan Pemasangan NGT Bayi', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(628, 1, 'ALT-KP410', 'Phantom Perawatan payudara (kain)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(629, 1, 'ALT-KP213', 'Phantom Perawatan payudara (karet)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(630, 1, 'ALT-KP766', 'Phantom Persalinan / Advanced Childbirth Simulator', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(631, 1, 'ALT-KP183', 'Phantom Prostate Examination Simulator', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(632, 1, 'ALT-KP551', 'Phantom Rectum Reservoir', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(633, 1, 'ALT-KP241', 'Phantom Resusitasi Bayi', NULL, 'pcs', 11, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(634, 1, 'ALT-KP578', 'Phantom RJP Laerdal', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(635, 1, 'ALT-KP326', 'Phantom Simulator Intravenous Arm II Full Set', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(636, 1, 'ALT-KP479', 'Phantom Utuh / Patient Care Simulator Sakura II', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(637, 1, 'ALT-KP203', 'Pinset Anatomis / Forceps Dressing', NULL, 'pcs', 86, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(638, 1, 'ALT-KP928', 'Pinset siku', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(639, 1, 'ALT-KP605', 'Pinset Sirugis / Forceps Tissue', NULL, 'pcs', 116, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(640, 1, 'ALT-KP067', 'Pispot / Urinal laki-laki', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(641, 1, 'ALT-KP104', 'Pispot / Urinal perempuan', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(642, 1, 'ALT-KP932', 'Pispot Anak / Potty', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(643, 1, 'ALT-KP904', 'Pneumothorax Trainer', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(644, 1, 'ALT-KP886', 'Popok bayi', NULL, 'pcs', 31, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(645, 1, 'ALT-KP209', 'Poster - Poster', NULL, 'pcs', 13, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(646, 1, 'ALT-KP961', 'Reflek hammer', NULL, 'pcs', 23, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(647, 1, 'ALT-KP902', 'Restrain', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(648, 1, 'ALT-KP955', 'Safety Box', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(649, 1, 'ALT-KP350', 'Sarung bantal', NULL, 'pcs', 32, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(650, 1, 'ALT-KP720', 'Sarung bantal bayi', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(651, 1, 'ALT-KP840', 'Sarung guling bayi', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(652, 1, 'ALT-KP805', 'Sarung kaki bayi', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(653, 1, 'ALT-KP123', 'Sarung pasien kotak\"', NULL, 'pcs', 19, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(654, 1, 'ALT-KP187', 'Sarung tangan bayi', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(655, 1, 'ALT-KP323', 'Scalpel', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(656, 1, 'ALT-KP016', 'Scoop Strecher', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(657, 1, 'ALT-KP741', 'Selang / Kanul Nasal Anak', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(658, 1, 'ALT-KP748', 'Selang / Kanul Nasal Dewasa', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(659, 1, 'ALT-KP552', 'Selang penghubung sungkup', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(660, 1, 'ALT-KP064', 'Selimut bayi', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(661, 1, 'ALT-KP738', 'Selimut Lurik besar', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(662, 1, 'ALT-KP201', 'Selimut Lurik kecil', NULL, 'pcs', 22, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(663, 1, 'ALT-KP487', 'Selimut Wol Kembang', NULL, 'pcs', 16, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(664, 1, 'ALT-KP918', 'Sepatu Boot', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(665, 1, 'ALT-KP145', 'Set Curretage', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(666, 1, 'ALT-KP429', 'Set Implant (Pemasangan dan Pencabutan Implant)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(667, 1, 'ALT-KP076', 'Setengah kocher', NULL, 'pcs', 18, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(668, 1, 'ALT-KP084', 'Sikat', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(669, 1, 'ALT-KP933', 'Snellen Chart', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(670, 1, 'ALT-KP198', 'Sonde Uterus', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(671, 1, 'ALT-KP114', 'Spalk', NULL, 'pcs', 23, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(672, 1, 'ALT-KP709', 'Spekulum cusco ukuran M', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(673, 1, 'ALT-KP629', 'Spine Board', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(674, 1, 'ALT-KP266', 'Standar Infus bed', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(675, 1, 'ALT-KP415', 'Standar Infus mobile', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(676, 1, 'ALT-KP944', 'Stat Baby', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(677, 1, 'ALT-KP603', 'Sterilisator Listrik (basah)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(678, 1, 'ALT-KP617', 'Sterilisator Listrik (kering)', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(679, 1, 'ALT-KP832', 'Stetoskop Anak', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(680, 1, 'ALT-KP848', 'Stetoskop Bayi', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(681, 1, 'ALT-KP824', 'Stetoskop Dewasa Double / Stetoskop Pendidikan', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(682, 1, 'ALT-KP571', 'Stetoskop Dewasa Mono', NULL, 'pcs', 16, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(683, 1, 'ALT-KP760', 'Stetoskop Dewasa Mono (Cardiology Stehoscope)', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(684, 1, 'ALT-KP794', 'Stetoskop Dewasa Mono (Classic Stehoscope)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(685, 1, 'ALT-KP446', 'Stik Laken', NULL, 'pcs', 22, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(686, 1, 'ALT-KP835', 'Stik Laken Bayi', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(687, 1, 'ALT-KP108', 'Stoma Care Torso/Ostomy Nursing Model', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(688, 1, 'ALT-KP152', 'Tabung Oksigen', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(689, 1, 'ALT-KP796', 'Tali Karamantel Besar', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(690, 1, 'ALT-KP800', 'Tali Karamantel Kecil', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(691, 1, 'ALT-KP397', 'Tangga untuk naik ke bed', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(692, 1, 'ALT-KP280', 'Tas Emergency', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(693, 1, 'ALT-KP545', 'Tas PHN KIT besar', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(694, 1, 'ALT-KP842', 'Tas PHN Kit kecil', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(695, 1, 'ALT-KP916', 'Tempat air untuk cuci tangan', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(696, 1, 'ALT-KP833', 'Tempat kapas alkohol dengan tutup', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(697, 1, 'ALT-KP968', 'Tempat Korentang', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(698, 1, 'ALT-KP497', 'Tempat sabun batang', NULL, 'pcs', 9, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(699, 1, 'ALT-KP504', 'Tempat sampah injak', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(700, 1, 'ALT-KP761', 'Tempat sampah plastik', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(701, 1, 'ALT-KP142', 'Tempat tidur / boks bayi', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(702, 1, 'ALT-KP850', 'Tempat tidur anak', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(703, 1, 'ALT-KP688', 'Tempat tidur biasa', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(704, 1, 'ALT-KP512', 'Tempat tidur dengan pengaturan putar', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(705, 1, 'ALT-KP740', 'Tempat tidur elektrik', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(706, 1, 'ALT-KP901', 'Tempat tidur gynekologi / Gynecological Examination Table', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(707, 1, 'ALT-KP775', 'Tempat Tissu (bulat)', NULL, 'pcs', 16, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(708, 1, 'ALT-KP610', 'Tenakulum / Kogeltang', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(709, 1, 'ALT-KP324', 'Tensimeter Air Raksa', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(710, 1, 'ALT-KP207', 'Tensimeter Air Raksa mobile / Mobile Sphygmomanometer', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(711, 1, 'ALT-KP870', 'Tensimeter Anaeroid (jarum) / Aneroid Sphygmomanometer', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(712, 1, 'ALT-KP737', 'Tensimeter Anak', NULL, 'pcs', 8, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(713, 1, 'ALT-KP329', 'Termometer air', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(714, 1, 'ALT-KP474', 'Termometer air raksa', NULL, 'pcs', 25, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(715, 1, 'ALT-KP141', 'Termometer digital', NULL, 'pcs', 13, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(716, 1, 'ALT-KP583', 'Termos Imunisasi Besar / Cool box', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(717, 1, 'ALT-KP368', 'Termos Imunisasi Kecil', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(718, 1, 'ALT-KP265', 'Timbangan Bayi', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(719, 1, 'ALT-KP211', 'Timbangan BB kotak', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(720, 1, 'ALT-KP467', 'Timbangan Emas', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(721, 1, 'ALT-KP354', 'Tongkat dengan ujung karet', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(722, 1, 'ALT-KP028', 'Tongue spatel', NULL, 'pcs', 57, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(723, 1, 'ALT-KP668', 'Topi bayi', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(724, 1, 'ALT-KP296', 'Topi ICU', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(725, 1, 'ALT-KP172', 'Tourniquet', NULL, 'pcs', 26, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(726, 1, 'ALT-KP137', 'Tracheostomy', NULL, 'pcs', 3, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(727, 1, 'ALT-KP813', 'Trauma Manikin', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(728, 1, 'ALT-KP102', 'Trauma Manikin/Ultimate Hurt', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(729, 1, 'ALT-KP328', 'Trauma Manikin/Ultimate Hurtfull Body', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(730, 1, 'ALT-KP481', 'Trocart IUD', NULL, 'pcs', 10, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(731, 1, 'ALT-KP671', 'Troli', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(732, 1, 'ALT-KP608', 'Troli + standar baskom double / Trolley Dressing With Drawer', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(733, 1, 'ALT-KP949', 'Troli dengan laci susun didalam / Medicine Trolley', NULL, 'pcs', 6, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(734, 1, 'ALT-KP711', 'Troli Emergency', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(735, 1, 'ALT-KP939', 'Tromol Kapas', NULL, 'pcs', 4, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(736, 1, 'ALT-KP908', 'Tromol Kassa', NULL, 'pcs', 7, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(737, 1, 'ALT-KP385', 'Tutup Gelas Stainles', NULL, 'pcs', 17, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(738, 1, 'ALT-KP596', 'Urinal tertutup (plastik)', NULL, 'pcs', 2, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(739, 1, 'ALT-KP588', 'Urinal tertutup (stainles)', NULL, 'pcs', 5, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(740, 1, 'ALT-KP500', 'Vacuum Extractor', NULL, 'pcs', 1, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(741, 1, 'ALT-KP425', 'Wound Closure Pad Light', NULL, 'pcs', 12, 0, 1, '2025-10-20 01:56:12', '2025-10-20 01:56:12'),
(742, 1, 'ALT-KP-970', 'Test alat', 'test', 'pcs', 44, 1, 1, '2025-10-20 02:01:53', '2025-10-20 02:01:53'),
(743, 3, 'BHN-KP-996', 'Alcohol 70% (1L)', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(744, 3, 'BHN-KP-624', 'Alcohol swab', NULL, 'pcs', 7100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(745, 3, 'BHN-KP-730', 'Alginate dressing', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(746, 3, 'BHN-KP-119', 'Aquabidest 25ml', NULL, 'pcs', 63, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(747, 3, 'BHN-KP-120', 'Aquadest 500ml', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(748, 3, 'BHN-KP-331', 'Arm Spling L', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(749, 3, 'BHN-KP-739', 'Arm Spling M', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(750, 3, 'BHN-KP-217', 'Baby oil', NULL, 'pcs', 22, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(751, 3, 'BHN-KP-039', 'Baju Hazmat', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(752, 3, 'BHN-KP-831', 'Baju Pasien', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(753, 3, 'BHN-KP-431', 'Balok yoga', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(754, 3, 'BHN-KP-063', 'Baterai 9 volt', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(755, 3, 'BHN-KP-512', 'Baterai size AAA', NULL, 'pcs', 38, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(757, 3, 'BHN-KP-030', 'Bayclin 1L', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(758, 3, 'BHN-KP-586', 'Benang jahit catgut chromic with needle', NULL, 'pcs', 11, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(759, 3, 'BHN-KP-576', 'Benang Jahit Silk Braided with needle', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(760, 3, 'BHN-KP-151', 'Betadine Cair', NULL, 'pcs', 15, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(761, 3, 'BHN-KP-198', 'Betadine Cair 1L', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(762, 3, 'BHN-KP-582', 'Betadine mothwash 190ml', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(763, 3, 'BHN-KP-246', 'Betadine salep', NULL, 'pcs', 13, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(764, 3, 'BHN-KP-032', 'Bib celemek', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(765, 3, 'BHN-KP-631', 'blood cholesterol test strip / stick kolesterol (Family Dr)', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(766, 3, 'BHN-KP-143', 'blood glucose test strip / stick gula darah (easy touch)', NULL, 'pcs', 50, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(767, 3, 'BHN-KP-002', 'blood Hemoglobin (HB) / stick hemoglobin family dr', NULL, 'pcs', 100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(768, 3, 'BHN-KP-369', 'Blood lancet', NULL, 'pcs', 700, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(769, 3, 'BHN-KP-878', 'blood uric acid / stick asam urat test strip easy touch', NULL, 'pcs', 100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(770, 3, 'BHN-KP-928', 'Bola', NULL, 'pcs', 24, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(771, 3, 'BHN-KP-042', 'Boneka tangan', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(772, 3, 'BHN-KP-756', 'Buku Notebook', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(773, 3, 'BHN-KP-685', 'Buku Tulis', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(774, 3, 'BHN-KP-633', 'Cakram kalender kehamilan', NULL, 'pcs', 16, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(775, 3, 'BHN-KP-264', 'Catheter 3 way no 18', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(776, 3, 'BHN-KP-414', 'Catheter 3 way no 20', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(777, 3, 'BHN-KP-047', 'Catheter no.10', NULL, 'pcs', 23, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(778, 3, 'BHN-KP-902', 'Catheter no.12', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(779, 3, 'BHN-KP-720', 'Catheter no.14', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(780, 3, 'BHN-KP-574', 'Catheter no.16', NULL, 'pcs', 95, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(781, 3, 'BHN-KP-942', 'Catheter no.20', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(782, 3, 'BHN-KP-267', 'Catheter No.6', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(783, 3, 'BHN-KP-746', 'Catheter no.8', NULL, 'pcs', 29, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(784, 3, 'BHN-KP-049', 'Celana dalam', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(785, 3, 'BHN-KP-416', 'Colostomy bag / Kantong kolostomi anak', NULL, 'pcs', 100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(786, 3, 'BHN-KP-884', 'Colostomy bag / Kantong kolostomi dewasa', NULL, 'pcs', 54, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(787, 3, 'BHN-KP-882', 'Colostomy clamp', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(788, 3, 'BHN-KP-788', 'Corong', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(789, 3, 'BHN-KP-050', 'Cotton Bud', NULL, 'pcs', 85, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(790, 3, 'BHN-KP-308', 'Cuka/asam acetat', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(791, 3, 'BHN-KP-947', 'Cup feeding', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(792, 3, 'BHN-KP-012', 'Daryantulle / Sofratulle', NULL, 'pcs', 13, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(793, 3, 'BHN-KP-962', 'Docare keramas instant', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(794, 3, 'BHN-KP-390', 'Dot', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(795, 3, 'BHN-KP-895', 'Duk Lubang', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(796, 3, 'BHN-KP-933', 'Esensial oil', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(797, 3, 'BHN-KP-701', 'ETT (Endotracheal Tube) no. 6,5', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(798, 3, 'BHN-KP-161', 'ETT (Endotracheal Tube) no. 7', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(799, 3, 'BHN-KP-241', 'ETT (Endotracheal Tube) no. 7,5', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(800, 3, 'BHN-KP-342', 'Face Mask / masker', NULL, 'pcs', 745, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(801, 3, 'BHN-KP-359', 'Face shield', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(802, 3, 'BHN-KP-317', 'Gel Kompres/Gel pack', NULL, 'pcs', 11, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18');
INSERT INTO `barang` (`id_barang`, `id_sub_kategori`, `kode_barang`, `nama_barang`, `deskripsi`, `satuan`, `stok`, `stok_minimum`, `is_active`, `created_at`, `updated_at`) VALUES
(803, 3, 'BHN-KP-852', 'Gelang pasien biru', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(804, 3, 'BHN-KP-397', 'Gelang pasien kuning', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(805, 3, 'BHN-KP-247', 'Gelang pasien merah', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(806, 3, 'BHN-KP-828', 'Gelang pasien pink', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(807, 3, 'BHN-KP-672', 'Gelang pasien putih', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(808, 3, 'BHN-KP-810', 'Gelas ukur obat', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(809, 3, 'BHN-KP-016', 'Gliserin 100 ml', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(810, 3, 'BHN-KP-867', 'GOM (Boraks Gliserin) 8ml', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(811, 3, 'BHN-KP-628', 'Gunting Kuku', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(812, 3, 'BHN-KP-436', 'Hand body lotion', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(813, 3, 'BHN-KP-277', 'Hand body lotion serum 300', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(814, 3, 'BHN-KP-066', 'Hands coen disposible uk.L', NULL, 'pcs', 800, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(815, 3, 'BHN-KP-378', 'Hands coen disposible uk.M', NULL, 'pcs', 1750, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(816, 3, 'BHN-KP-989', 'Hands coen disposible uk.S', NULL, 'pcs', 850, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(817, 3, 'BHN-KP-199', 'Hands coen disposible uk.XL', NULL, 'pcs', 50, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(818, 3, 'BHN-KP-075', 'Hands coen RT', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(819, 3, 'BHN-KP-181', 'Hands coen steril uk. 6,5', NULL, 'pcs', 416, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(820, 3, 'BHN-KP-226', 'Hands coen steril uk. 7', NULL, 'pcs', 677, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(821, 3, 'BHN-KP-425', 'Hands coen steril uk. 8', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(822, 3, 'BHN-KP-411', 'Hands coen steril uk.7,5', NULL, 'pcs', 399, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(823, 3, 'BHN-KP-665', 'Handsanitizer 500ml', NULL, 'pcs', 34, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(824, 3, 'BHN-KP-200', 'Handscoen kain', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(825, 3, 'BHN-KP-784', 'Handuk baju', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(826, 3, 'BHN-KP-173', 'Handuk besar', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(827, 3, 'BHN-KP-938', 'Handuk kerja cuci tangan', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(828, 3, 'BHN-KP-580', 'Handuk rambut', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(829, 3, 'BHN-KP-629', 'HCG Urine pregnancy test', NULL, 'pcs', 250, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(830, 3, 'BHN-KP-417', 'HCl 0,1', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(831, 3, 'BHN-KP-233', 'Head cap', NULL, 'pcs', 247, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(832, 3, 'BHN-KP-859', 'Hibiscrub 500 ml', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(833, 3, 'BHN-KP-174', 'Hydrogel dressing', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(834, 3, 'BHN-KP-747', 'Infus set 20 drops', NULL, 'pcs', 117, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(835, 3, 'BHN-KP-487', 'Infus set Blood Tranfusi set', NULL, 'pcs', 69, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(836, 3, 'BHN-KP-003', 'Infus set microdrip', NULL, 'pcs', 42, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(837, 3, 'BHN-KP-906', 'Infus set steril with buret 100 ml type : pediatric 60 drops / ml', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(838, 3, 'BHN-KP-139', 'IV Catheter 20 G', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(839, 3, 'BHN-KP-389', 'IV Catheter 22 G', NULL, 'pcs', 183, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(840, 3, 'BHN-KP-105', 'IV Catheter 24 G', NULL, 'pcs', 37, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(841, 3, 'BHN-KP-305', 'IV Catheter 26 G', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(842, 3, 'BHN-KP-594', 'IV extension tubing 3 way', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(843, 3, 'BHN-KP-313', 'Jarum kulit no.10', NULL, 'pcs', 24, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(844, 3, 'BHN-KP-656', 'Jarum kulit no.11', NULL, 'pcs', 24, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(845, 3, 'BHN-KP-351', 'Jarum kulit no.12', NULL, 'pcs', 48, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(846, 3, 'BHN-KP-191', 'Jarum kulit no.8', NULL, 'pcs', 12, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(847, 3, 'BHN-KP-205', 'Jarum otot no.11', NULL, 'pcs', 36, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(848, 3, 'BHN-KP-258', 'Jarum otot no.12', NULL, 'pcs', 36, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(849, 3, 'BHN-KP-801', 'Jarum otot no.8', NULL, 'pcs', 12, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(850, 3, 'BHN-KP-555', 'Jelly', NULL, 'pcs', 21, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(851, 3, 'BHN-KP-190', 'Kacamata Google', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(852, 3, 'BHN-KP-558', 'Kantong ASI', NULL, 'pcs', 90, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(853, 3, 'BHN-KP-182', 'Kantong plastik hitam (sedang)', NULL, 'pcs', 30, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(854, 3, 'BHN-KP-846', 'Kantong plastik kuning (besar)', NULL, 'pcs', 310, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(855, 3, 'BHN-KP-712', 'Kantong plastik kuning (kecil)', NULL, 'pcs', 800, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(856, 3, 'BHN-KP-721', 'Kantong Plastik kuning (sedang)', NULL, 'pcs', 199, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(857, 3, 'BHN-KP-295', 'Kantong Plastik Merah (kecil)', NULL, 'pcs', 40, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(858, 3, 'BHN-KP-008', 'Kantong Plastik ungu (besar)', NULL, 'pcs', 40, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(859, 3, 'BHN-KP-693', 'Kapas wajah', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(860, 3, 'BHN-KP-165', 'Kartu triage', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(861, 3, 'BHN-KP-333', 'Kassa gulung besar 80 cm', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(862, 3, 'BHN-KP-157', 'Kassa steril', NULL, 'pcs', 68, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(863, 3, 'BHN-KP-044', 'Kassa steril 5x5', NULL, 'pcs', 28, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(864, 3, 'BHN-KP-609', 'Kertas EKG Fukuda 63mm', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(865, 3, 'BHN-KP-367', 'Kertas EKG kotak 80x90mm', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(866, 3, 'BHN-KP-840', 'kertas EKG roll 30mm', NULL, 'pcs', 9, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(867, 3, 'BHN-KP-076', 'kertas EKG roll 80mm', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(868, 3, 'BHN-KP-175', 'Kertas Goldar', NULL, 'pcs', 97, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(869, 3, 'BHN-KP-334', 'Kondom kateter', NULL, 'pcs', 19, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(870, 3, 'BHN-KP-051', 'Kondom laki-laki', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(871, 3, 'BHN-KP-343', 'LCD writing table', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(872, 3, 'BHN-KP-027', 'Lidi kapas kambium', NULL, 'pcs', 347, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(873, 3, 'BHN-KP-396', 'Lidi kapas steril', NULL, 'pcs', 167, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(874, 3, 'BHN-KP-365', 'Lilin Aroma terapi', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(875, 3, 'BHN-KP-786', 'Lipbalm', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(876, 3, 'BHN-KP-349', 'Masker KN95', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(877, 3, 'BHN-KP-449', 'Masker N95', NULL, 'pcs', 12, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(878, 3, 'BHN-KP-097', 'Matras Yoga', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(879, 3, 'BHN-KP-812', 'Mayo / Gudel / OPA (dewasa)', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(880, 3, 'BHN-KP-114', 'Medisoft cotton ball / kapas bola', NULL, 'pcs', 4540, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(881, 3, 'BHN-KP-479', 'Metline', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(882, 3, 'BHN-KP-865', 'Minyak kayu putih', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(883, 3, 'BHN-KP-977', 'Minyak telon', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(884, 3, 'BHN-KP-601', 'Mitella disposible', NULL, 'pcs', 24, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(885, 3, 'BHN-KP-917', 'Nacl 500ml', NULL, 'pcs', 32, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(886, 3, 'BHN-KP-959', 'Needle 23G', NULL, 'pcs', 22, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(887, 3, 'BHN-KP-229', 'Needle 24G', NULL, 'pcs', 37, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(888, 3, 'BHN-KP-686', 'Needle 25G', NULL, 'pcs', 19, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(889, 3, 'BHN-KP-062', 'Needle 26G', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(890, 3, 'BHN-KP-298', 'NGT No.10 Fr', NULL, 'pcs', 28, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(891, 3, 'BHN-KP-224', 'NGT No.12 Fr', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(892, 3, 'BHN-KP-014', 'NGT No.16 Fr', NULL, 'pcs', 133, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(893, 3, 'BHN-KP-778', 'NGT No.3,5 Fr', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(894, 3, 'BHN-KP-703', 'NGT No.5 Fr', NULL, 'pcs', 136, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(895, 3, 'BHN-KP-324', 'NGT No.6 Fr', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(896, 3, 'BHN-KP-688', 'NGT No.8 Fr', NULL, 'pcs', 26, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(897, 3, 'BHN-KP-373', 'No Pain spray', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(898, 3, 'BHN-KP-443', 'Notebook', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(899, 3, 'BHN-KP-155', 'Obat Amoxicillin serbuk sirup 125mg / 5ml', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(900, 3, 'BHN-KP-517', 'Obat Amoxicillin tablet', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(901, 3, 'BHN-KP-567', 'Obat Antasida Doen', NULL, 'pcs', 57, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(902, 3, 'BHN-KP-897', 'Obat gel Bioplacenton 15 gr', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(903, 3, 'BHN-KP-994', 'Obat injeksi ampul Ketorolac', NULL, 'pcs', 15, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(904, 3, 'BHN-KP-130', 'Obat injeksi ampul Lidocain', NULL, 'pcs', 26, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(905, 3, 'BHN-KP-336', 'Obat injeksi furosemid', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(906, 3, 'BHN-KP-301', 'Obat injeksi insulin', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(907, 3, 'BHN-KP-099', 'Obat injeksi Phytomenadione', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(908, 3, 'BHN-KP-227', 'Obat injeksi Ranitidine', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(909, 3, 'BHN-KP-749', 'Obat injeksi vial cyanocobalamine / Vit B20', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(910, 3, 'BHN-KP-362', 'Obat kapsul Cefadroxil', NULL, 'pcs', 79, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(911, 3, 'BHN-KP-078', 'Obat KB Implant', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(912, 3, 'BHN-KP-932', 'Obat KB injeksi', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(913, 3, 'BHN-KP-984', 'Obat KB IUD', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(914, 3, 'BHN-KP-655', 'Obat KB pil', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(915, 3, 'BHN-KP-767', 'Obat kumur Listerine', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(916, 3, 'BHN-KP-457', 'Obat Metered Dose Inhalers (MDI)', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(917, 3, 'BHN-KP-312', 'Obat nebu Ventolin / combivent nebules', NULL, 'pcs', 15, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(918, 3, 'BHN-KP-270', 'Obat salep gentamicin', NULL, 'pcs', 13, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(919, 3, 'BHN-KP-352', 'Obat Salep Intracite', NULL, 'pcs', 11, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(920, 3, 'BHN-KP-869', 'Obat salep mederma', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(921, 3, 'BHN-KP-557', 'Obat Salep Metcovazine', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(922, 3, 'BHN-KP-613', 'Obat Salep Miconazole', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(923, 3, 'BHN-KP-197', 'Obat salp hydrocortisone cream', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(924, 3, 'BHN-KP-983', 'Obat salp mata', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(925, 3, 'BHN-KP-332', 'Obat Sanmol /contrexin drops', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(926, 3, 'BHN-KP-281', 'Obat serbuk Nebacetin Serbuk', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(927, 3, 'BHN-KP-764', 'Obat sirup OBH', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(928, 3, 'BHN-KP-552', 'Obat sublingual Isosorbid Dinitrate (ISDN) 5mg', NULL, 'pcs', 40, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(929, 3, 'BHN-KP-774', 'Obat suppositoria Microlax', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(930, 3, 'BHN-KP-783', 'Obat Suppositoria Superrhoid', NULL, 'pcs', 12, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(931, 3, 'BHN-KP-540', 'Obat tablet Cefadroxil', NULL, 'pcs', 79, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(932, 3, 'BHN-KP-021', 'Obat tablet Diatab', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(933, 3, 'BHN-KP-210', 'Obat tablet Paracetamol 500 mg', NULL, 'pcs', 72, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(934, 3, 'BHN-KP-413', 'Obat tablet vaginal Nystatin', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(935, 3, 'BHN-KP-476', 'Obat tetes hidung (dengan alat spray) / avamy\'s', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(936, 3, 'BHN-KP-913', 'Obat tetes hidung Breathy', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(937, 3, 'BHN-KP-600', 'Obat tetes mata', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(938, 3, 'BHN-KP-213', 'Obat tetes telinga', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(939, 3, 'BHN-KP-415', 'Obat vial Cefotaxime', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(940, 3, 'BHN-KP-196', 'Pampers bayi', NULL, 'pcs', 44, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(941, 3, 'BHN-KP-310', 'Pampers Dewasa', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(942, 3, 'BHN-KP-704', 'Papan tulis tablet', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(943, 3, 'BHN-KP-926', 'Parfum', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(944, 3, 'BHN-KP-954', 'Pasta gigi anak', NULL, 'pcs', 21, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(945, 3, 'BHN-KP-544', 'Pasta gigi dewasa', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(946, 3, 'BHN-KP-348', 'Peluit', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(947, 3, 'BHN-KP-929', 'Pembalut biasa', NULL, 'pcs', 80, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(948, 3, 'BHN-KP-729', 'Pembalut maternity', NULL, 'pcs', 45, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(949, 3, 'BHN-KP-158', 'Pemotong ampul', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(950, 3, 'BHN-KP-985', 'Pemotong tablet', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(951, 3, 'BHN-KP-627', 'Penampung ASI (silicon)', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(952, 3, 'BHN-KP-894', 'Pencukur rambut (gillete)', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(953, 3, 'BHN-KP-973', 'Penggaris luka', NULL, 'pcs', 278, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(954, 3, 'BHN-KP-508', 'Peniti', NULL, 'pcs', 132, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(955, 3, 'BHN-KP-607', 'Penlight', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(956, 3, 'BHN-KP-606', 'Perban elastis 10 cm x 4,5m', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(957, 3, 'BHN-KP-617', 'perban elastis 15cm x 4,5m', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(958, 3, 'BHN-KP-453', 'Perban elastis 7,5cm x 4,5m', NULL, 'pcs', 13, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(959, 3, 'BHN-KP-379', 'perban / kassa gulung panjang (15cm)', NULL, 'pcs', 74, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(960, 3, 'BHN-KP-950', 'perban / kassa gulung pendek (5cm)', NULL, 'pcs', 280, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(961, 3, 'BHN-KP-124', 'perban / kassa gulung sedang (10cm)', NULL, 'pcs', 55, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(962, 3, 'BHN-KP-125', 'Pipet Obat', NULL, 'pcs', 11, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(963, 3, 'BHN-KP-491', 'Plester Dermafix 10 x 20', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(964, 3, 'BHN-KP-424', 'Plester Dermafix 10x12cm', NULL, 'pcs', 40, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(965, 3, 'BHN-KP-185', 'Plester Dermafix 5x7cm', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(966, 3, 'BHN-KP-966', 'Plester Hypafix (10 cm x 5m)', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(967, 3, 'BHN-KP-857', 'Plester Hypafix (5cm x 5m)', NULL, 'pcs', 30, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(968, 3, 'BHN-KP-807', 'Plester IV Dressing uk.6x7cm', NULL, 'pcs', 191, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(969, 3, 'BHN-KP-209', 'Plester Kompres Demam', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(970, 3, 'BHN-KP-850', 'Plester micropore 1,25cm', NULL, 'pcs', 46, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(971, 3, 'BHN-KP-257', 'Plester micropore 2,5cm', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(972, 3, 'BHN-KP-430', 'Plester tegaderm 10 x 12', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(973, 3, 'BHN-KP-717', 'Plester transparant dressing roll 10cm x 2m', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(974, 3, 'BHN-KP-094', 'Plester transparant dressing roll 5cm', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(975, 3, 'BHN-KP-916', 'pot feses', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(976, 3, 'BHN-KP-335', 'pot Sputum', NULL, 'pcs', 11, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(977, 3, 'BHN-KP-971', 'Pot urine', NULL, 'pcs', 35, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(978, 3, 'BHN-KP-001', 'Pouch Sterilisator', NULL, 'pcs', 397, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(979, 3, 'BHN-KP-684', 'Puzzle', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(980, 3, 'BHN-KP-845', 'Ransel Verban', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(981, 3, 'BHN-KP-338', 'Reagen goldar antigen A', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(982, 3, 'BHN-KP-965', 'Reagen goldar antigen AB', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(983, 3, 'BHN-KP-824', 'Reagen goldar antigen B', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(984, 3, 'BHN-KP-262', 'Reagen goldar antigen D', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(985, 3, 'BHN-KP-071', 'Ringer laktat 500 ml', NULL, 'pcs', 19, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(986, 3, 'BHN-KP-419', 'Sabun cuci cream', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(987, 3, 'BHN-KP-093', 'Sabun handwash', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(988, 3, 'BHN-KP-038', 'Sabun handwash refill', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(989, 3, 'BHN-KP-466', 'Sabun mandi cair', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(990, 3, 'BHN-KP-615', 'Sabun mandi cair 220', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(991, 3, 'BHN-KP-781', 'Sedotan putih', NULL, 'pcs', 25, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(992, 3, 'BHN-KP-890', 'Sedotan warna', NULL, 'pcs', 291, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(993, 3, 'BHN-KP-079', 'Selang oksigen Nasal kanul anak', NULL, 'pcs', 16, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(994, 3, 'BHN-KP-569', 'Selang oksigen Nasal kanul dewasa', NULL, 'pcs', 35, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(995, 3, 'BHN-KP-563', 'Selang oksigen NRM Dewasa', NULL, 'pcs', 13, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(996, 3, 'BHN-KP-652', 'Selang oksigen symple mask anak', NULL, 'pcs', 6, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(997, 3, 'BHN-KP-309', 'Selang oksigen symple mask bayi', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(998, 3, 'BHN-KP-963', 'Selang oksigen symple mask dewasa', NULL, 'pcs', 53, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(999, 3, 'BHN-KP-740', 'Selang suction 10G', NULL, 'pcs', 61, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1000, 3, 'BHN-KP-184', 'Selang suction 12G', NULL, 'pcs', 36, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1001, 3, 'BHN-KP-400', 'Selang suction 6G', NULL, 'pcs', 16, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1002, 3, 'BHN-KP-040', 'Selang Suction 8G', NULL, 'pcs', 10, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1003, 3, 'BHN-KP-108', 'Sendok plastik putih', NULL, 'pcs', 57, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1004, 3, 'BHN-KP-898', 'Sendok plastik warna', NULL, 'pcs', 9, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1005, 3, 'BHN-KP-896', 'Sendok takar obat', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1006, 3, 'BHN-KP-822', 'Senter LED', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1007, 3, 'BHN-KP-340', 'Shampoo botol', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1008, 3, 'BHN-KP-967', 'Sikat cuci tangan (Spone cuci tangan)', NULL, 'pcs', 7, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1009, 3, 'BHN-KP-238', 'Sikat gigi anak', NULL, 'pcs', 20, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1010, 3, 'BHN-KP-058', 'Sikat gigi dewasa', NULL, 'pcs', 17, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1011, 3, 'BHN-KP-384', 'Sikat Kuku', NULL, 'pcs', 9, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1012, 3, 'BHN-KP-172', 'Silicon penampung ASI', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1013, 3, 'BHN-KP-847', 'Sisir bayi', NULL, 'pcs', 1, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1014, 3, 'BHN-KP-961', 'Sisir rambut', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1015, 3, 'BHN-KP-530', 'Snellen Chart', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1016, 3, 'BHN-KP-842', 'Spalk Bayi/Anak', NULL, 'pcs', 15, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1017, 3, 'BHN-KP-768', 'Spalk/Bidai 50cm', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1018, 3, 'BHN-KP-467', 'Spalk/Bidai 70cm', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1019, 3, 'BHN-KP-357', 'Spone Tepid Water', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1020, 3, 'BHN-KP-632', 'Spuit 0,05ml', NULL, 'pcs', 64, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1021, 3, 'BHN-KP-142', 'Spuit 0,5ml', NULL, 'pcs', 132, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1022, 3, 'BHN-KP-176', 'Spuit 10ml', NULL, 'pcs', 278, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1023, 3, 'BHN-KP-019', 'Spuit 1ml tuberkulin', NULL, 'pcs', 287, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1024, 3, 'BHN-KP-475', 'Spuit 20ml', NULL, 'pcs', 160, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1025, 3, 'BHN-KP-826', 'Spuit 3ml', NULL, 'pcs', 396, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1026, 3, 'BHN-KP-432', 'Spuit 50ml biru', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1027, 3, 'BHN-KP-350', 'Spuit 50ml hijau / Catheter Tip', NULL, 'pcs', 183, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1028, 3, 'BHN-KP-318', 'Spuit 5ml', NULL, 'pcs', 100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1029, 3, 'BHN-KP-127', 'Spuit insulin 0,5ml', NULL, 'pcs', 100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1030, 3, 'BHN-KP-478', 'Stik es krim', NULL, 'pcs', 458, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1031, 3, 'BHN-KP-297', 'Stik pedicure', NULL, 'pcs', 8, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1032, 3, 'BHN-KP-273', 'Tabung darah besar', NULL, 'pcs', 23, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1033, 3, 'BHN-KP-225', 'Tabung darah kecil', NULL, 'pcs', 21, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1034, 3, 'BHN-KP-383', 'Talk bayi', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1035, 3, 'BHN-KP-654', 'Talk bayi herocyn 200gr', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1036, 3, 'BHN-KP-514', 'Tasbih', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1037, 3, 'BHN-KP-635', 'Termometer digital', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1038, 3, 'BHN-KP-524', 'Termometer infrared', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1039, 3, 'BHN-KP-035', 'Three way stopcock (JMS) panjang', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1040, 3, 'BHN-KP-545', 'Three way stopcock (JMS) pendek', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1041, 3, 'BHN-KP-513', 'Tissu gulung', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1042, 3, 'BHN-KP-643', 'Tisu pengesat (Tesa) soft hand towel', NULL, 'pcs', 11, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1043, 3, 'BHN-KP-418', 'Tisu wajah', NULL, 'pcs', 57, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1044, 3, 'BHN-KP-291', 'Tisu wajah kecil', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1045, 3, 'BHN-KP-549', 'Tongue Spatel steril kayu', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1046, 3, 'BHN-KP-401', 'Tracheostomy retainer', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1047, 3, 'BHN-KP-758', 'Transofix', NULL, 'pcs', 14, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1048, 3, 'BHN-KP-956', 'Tusuk gigi', NULL, 'pcs', 200, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1049, 3, 'BHN-KP-642', 'Umbilical clamp / Klem Tali pusat', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1050, 3, 'BHN-KP-345', 'Underpad dewasa', NULL, 'pcs', 25, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1051, 3, 'BHN-KP-976', 'Urinalisis', NULL, 'pcs', 100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1052, 3, 'BHN-KP-285', 'Urine bag', NULL, 'pcs', 113, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1053, 3, 'BHN-KP-017', 'Vaginal Spatula', NULL, 'pcs', 100, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1054, 3, 'BHN-KP-192', 'Vaksin Hepatitis B (Hb0)', NULL, 'pcs', 4, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1055, 3, 'BHN-KP-509', 'Vaksin TT', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1056, 3, 'BHN-KP-086', 'Wash bensin (1L)', NULL, 'pcs', 5, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1057, 3, 'BHN-KP-444', 'Waslap', NULL, 'pcs', 54, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1058, 3, 'BHN-KP-923', 'Wing needle 23 G', NULL, 'pcs', 3, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1059, 3, 'BHN-KP-645', 'Wing needle 25G', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18'),
(1060, 3, 'BHN-KP-488', 'Wing needle 27 G', NULL, 'pcs', 2, 0, 1, '2025-10-20 02:09:18', '2025-10-20 02:09:18');

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
(36, 373, 'peminjaman', 'PJM-20251018-0001', 'keluar', 1, 'Disetujui', '2025-10-18 07:09:55'),
(37, 373, 'peminjaman', 'PJM-20251018-0001', 'masuk', 1, 'Dikembalikan', '2025-10-18 07:31:52'),
(38, 373, 'peminjaman', 'PJM-20251020-0001', 'keluar', 2, 'Disetujui', '2025-10-20 07:21:19'),
(39, 373, 'peminjaman', 'PJM-20251020-0001', 'masuk', 2, 'Dikembalikan', '2025-10-20 07:53:04'),
(40, 374, 'peminjaman', 'PJM-20251020-0004', 'keluar', 1, 'Disetujui', '2025-10-20 09:19:47'),
(41, 376, 'peminjaman', 'PJM-20251020-0005', 'keluar', 1, 'Disetujui', '2025-10-20 09:19:58'),
(42, 376, 'peminjaman', 'PJM-20251020-0005', 'masuk', 1, 'Dikembalikan', '2025-10-20 09:21:13'),
(43, 377, 'peminjaman', 'PJM-20251020-0006', 'keluar', 1, 'Disetujui', '2025-10-20 09:26:19'),
(44, 377, 'peminjaman', 'PJM-20251020-0008', 'keluar', 10, 'Disetujui', '2025-10-20 09:30:09'),
(45, 381, 'peminjaman', 'PJM-20251020-0010', 'keluar', 2, 'Disetujui', '2025-10-20 09:34:04');

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
(43, 56, 376, 'Airway Training Model', 1, 'coba'),
(44, 57, 377, 'Alas Baki', 1, '14'),
(45, 58, 378, 'Alas Kasur', 1, '5'),
(46, 59, 377, 'Alas Baki', 10, 'test'),
(47, 60, 377, 'Alas Baki', 1, '10'),
(48, 61, 381, 'Alat Peraga Sistem Reproduksi Pria', 2, 'test');

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
(35, 2, 'Peminjaman dengan kode <b>PJM-20251020-0001</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 08:12:34'),
(36, 2, 'Peminjaman dengan kode <b>PJM-20251020-0002</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 08:15:17'),
(37, 2, 'Peminjaman dengan kode <b>PJM-20251020-0003</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'dibaca', '2025-10-20 08:16:32'),
(38, 2, 'Peminjaman dengan kode <b>PJM-20251020-0001</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-10-20 09:21:19'),
(39, 2, 'Peminjaman dengan kode <b>PJM-20251020-0002</b> telah <span class=\'text-red-600 font-semibold\'>ditolak</span>.', 'belum_dibaca', '2025-10-20 09:43:18'),
(40, 2, 'Peminjaman dengan kode <b>PJM-20251020-0004</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 11:12:53'),
(41, 2, 'Peminjaman dengan kode <b>PJM-20251020-0005</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 11:19:03'),
(42, 2, 'Peminjaman dengan kode <b>PJM-20251020-0004</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-10-20 11:19:47'),
(43, 2, 'Peminjaman dengan kode <b>PJM-20251020-0005</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-10-20 11:19:58'),
(44, 8, 'Peminjaman dengan kode <b>PJM-20251020-0006</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 11:24:34'),
(45, 8, 'Peminjaman dengan kode <b>PJM-20251020-0007</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 11:25:25'),
(46, 8, 'Peminjaman dengan kode <b>PJM-20251020-0006</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-10-20 11:26:19'),
(47, 8, 'Peminjaman dengan kode <b>PJM-20251020-0007</b> telah <span class=\'text-red-600 font-semibold\'>ditolak</span>.', 'belum_dibaca', '2025-10-20 11:26:52'),
(48, 2, 'Peminjaman dengan kode <b>PJM-20251020-0008</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 11:29:24'),
(49, 2, 'Peminjaman dengan kode <b>PJM-20251020-0008</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-10-20 11:30:09'),
(50, 8, 'Peminjaman dengan kode <b>PJM-20251020-0009</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 11:32:07'),
(51, 8, 'Peminjaman dengan kode <b>PJM-20251020-0010</b> sedang <span class=\'text-yellow-600 font-semibold\'>menunggu persetujuan admin</span>.', 'belum_dibaca', '2025-10-20 11:33:44'),
(52, 8, 'Peminjaman dengan kode <b>PJM-20251020-0010</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-10-20 11:34:04'),
(53, 8, 'Peminjaman dengan kode <b>PJM-20251020-0009</b> telah <span class=\'text-red-600 font-semibold\'>ditolak</span>.', 'belum_dibaca', '2025-10-20 11:35:17'),
(54, 8, 'Peminjaman dengan kode <b>PJM-20251015-0008</b> telah <span class=\'text-green-600 font-semibold\'>disetujui</span>.', 'belum_dibaca', '2025-10-20 11:38:09');

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
(56, 'PJM-20251020-0005', 2, 'EraserHead', '08991345659', 'test', 'TI-3C', 'Airway Training Model', '2025-10-20', '2025-10-30', '2025-10-20 11:19:58', '2025-10-20 00:00:00', 'lab test', 'dikembalikan', 'okee', '2025-10-20 09:19:03', '2025-10-20 09:21:13'),
(57, 'PJM-20251020-0006', 8, 'Rodri', '08991345659', 'test2', 'TI-3B', 'Alas Baki', '2025-09-20', '2025-10-30', '2025-10-20 11:26:19', NULL, 'lab test2', 'disetujui', 'test', '2025-10-20 09:24:34', '2025-10-20 09:26:19'),
(58, 'PJM-20251020-0007', 8, 'Bakugo', '08991345657', 'test3', 'TI-3C', 'Alas Kasur', '2025-11-20', '2025-11-26', NULL, NULL, 'lab test2', 'ditolak', 'test', '2025-10-20 09:25:25', '2025-10-20 09:26:52'),
(59, 'PJM-20251020-0008', 2, 'Toga', '08991345688', 'test2', 'TI-3C', 'Alas Baki', '2025-10-20', '2025-10-30', '2025-10-20 11:30:09', NULL, 'lab test', 'disetujui', 'test', '2025-10-20 09:29:24', '2025-10-20 09:30:09'),
(60, 'PJM-20251020-0009', 8, 'Endeavour', '08991345688', 'test3', 'TI-3C', 'Alas Baki', '2025-12-02', '2025-12-04', NULL, NULL, 'lab test2', 'ditolak', 'coba', '2025-10-20 09:32:07', '2025-10-20 09:35:17'),
(61, 'PJM-20251020-0010', 8, 'Endeavour', '08991345688', 'test2', 'TI-3C', 'Alat Peraga Sistem Reproduksi Pria', '2025-10-20', '2025-10-30', '2025-10-20 11:34:04', NULL, 'lab test2', 'disetujui', 'test', '2025-10-20 09:33:44', '2025-10-20 09:34:04'),
(63, 'PJM-20251015-0008', 8, 'Hawk', '08991345657', 'RMIK', 'A', 'test jatuh tempo', '2025-10-01', '2025-10-30', '2025-10-20 11:38:09', NULL, 'test jatuh tempo', 'disetujui', 'test jatuh tempo', '2025-10-20 09:37:56', '2025-10-20 09:38:09'),
(64, 'PJM-20251015-0009', 8, 'Luffy', '08991345688', 'test', 'test', 'test', '2025-10-01', '2025-10-02', '2025-10-01 16:38:20', NULL, 'test', 'disetujui', 'test', '2025-10-20 09:40:47', NULL);

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
(35, 56, 3, 'setujui', NULL, '2025-10-20 09:19:58'),
(36, 57, 3, 'setujui', NULL, '2025-10-20 09:26:19'),
(37, 58, 3, 'tolak', NULL, '2025-10-20 09:26:52'),
(38, 59, 3, 'setujui', NULL, '2025-10-20 09:30:09'),
(39, 61, 3, 'setujui', NULL, '2025-10-20 09:34:04'),
(40, 60, 3, 'tolak', NULL, '2025-10-20 09:35:17'),
(41, 63, 3, 'setujui', NULL, '2025-10-20 09:38:09');

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
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `email`, `password`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'skay', 'sky', 'sky@test.com', '$2y$10$C1P.EjZ/VSy.Nz94iV.vP.rGJBP.BltgYQQKDm8VwZVGyvnQKHXKq', 'user', 1, '2025-09-03 09:54:15', '2025-10-20 02:44:35'),
(3, 'admin1', 'admin1', 'admin@test.com', '$2y$10$cD0EQ93UvVs0eOfEcHPEAeoVn1alibdQQa3bfq30gyjt6YqcuTyBi', 'admin', 1, '2025-09-03 09:54:15', '2025-10-20 09:42:34'),
(8, 'user', 'user', 'user@gmail.com', '$2y$10$weqiVO.d/efFG61/40cWL.pKvU25uoPMvKUiMQyRAyZSMOtETjVES', 'user', 1, '2025-10-20 09:23:06', NULL);

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
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman_verifikasi_log`
--
ALTER TABLE `peminjaman_verifikasi_log`
  MODIFY `id_log` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  MODIFY `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
