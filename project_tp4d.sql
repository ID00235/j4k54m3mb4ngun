-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2018 at 09:29 PM
-- Server version: 5.7.20-0ubuntu0.17.04.1
-- PHP Version: 7.1.9-1+ubuntu17.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_tp4d`
--

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id_instansi` int(12) NOT NULL,
  `nama_instansi` varchar(120) DEFAULT NULL,
  `jenis` enum('opd','desa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `nama_instansi`, `jenis`) VALUES
(1, 'Dinas PUPR', 'opd');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_proyek`
--

CREATE TABLE `jenis_proyek` (
  `id_jenis_proyek` int(12) NOT NULL,
  `nama_jenis_proyek` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_proyek`
--

INSERT INTO `jenis_proyek` (`id_jenis_proyek`, `nama_jenis_proyek`) VALUES
(1, 'Pekerjaan Konstruksi'),
(2, 'Pengadaan Barang'),
(3, 'Jasa Konsultansi Badan Usaha'),
(4, 'Jasa Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `konsultan`
--

CREATE TABLE `konsultan` (
  `id_konsultan` int(12) NOT NULL,
  `nama_konsultan` varchar(120) DEFAULT NULL,
  `telepon` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(120) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `group_menu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `url`, `icon`, `group_menu`) VALUES
(1, 'Data Proyek', 'manajemen-proyek', 'la la-building', 'Menu'),
(2, 'Perkembangan Proyek', 'status-proyek', 'la la-area-chart', 'Menu'),
(3, 'Warning Proyek', 'warning-proyek', 'la la-bell', 'Menu'),
(4, 'Konsultasi', 'konsultasi', 'la la-comment', 'Menu'),
(5, 'Instansi', 'instansi', 'la la-bank', 'Setting'),
(6, 'Akun Pengguna', 'pengguna', 'la la-users', 'Setting'),
(7, 'Setting Dokumen', 'setting-dokumen', 'la la-briefcase', 'Setting');

-- --------------------------------------------------------

--
-- Table structure for table `pelaksana_proyek`
--

CREATE TABLE `pelaksana_proyek` (
  `id_pelaksana_proyek` int(12) NOT NULL,
  `id_proyek` int(12) DEFAULT NULL,
  `id_rekanan` int(12) DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '1=>Aktif, 2=>Diganti',
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengawas_proyek`
--

CREATE TABLE `pengawas_proyek` (
  `id_konsultan_proyek` int(12) NOT NULL,
  `id_proyek` int(12) DEFAULT NULL,
  `id_konsultan` int(12) DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '1=>Aktif, 2=>Diganti',
  `keterangan` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proyek`
--

CREATE TABLE `proyek` (
  `id_proyek` int(12) NOT NULL,
  `nomor_proyek` varchar(4) DEFAULT NULL,
  `nama_proyek` varchar(120) DEFAULT NULL,
  `nama_pekerjaan` varchar(255) DEFAULT NULL,
  `id_jenis_proyek` int(12) DEFAULT NULL,
  `tahun_anggaran` int(4) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `jumlah_hari` int(12) DEFAULT NULL COMMENT 'Dalam Kalender',
  `id_sumber_dana` int(12) DEFAULT NULL,
  `nilai_proyek` decimal(18,2) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lokasi_pekerjaan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rekanan`
--

CREATE TABLE `rekanan` (
  `id_rekanan` int(12) NOT NULL,
  `nama_perusahaan` varchar(120) DEFAULT NULL,
  `nama_direktur` varchar(120) DEFAULT NULL,
  `telepon` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekanan`
--

INSERT INTO `rekanan` (`id_rekanan`, `nama_perusahaan`, `nama_direktur`, `telepon`, `email`) VALUES
(1, 'CV Angin Ribut', 'Imam Guntur', '0751-09893520', 'anginribut@gmail.com'),
(2, 'CV Putra Petir', 'Wahid Gunawan', '0751-0982925', ''),
(3, 'CV Ahmandin', 'Ahamad', NULL, NULL),
(4, 'CV Joko Susanto', 'Joko Susanto', NULL, NULL),
(5, 'CV Jonatan', NULL, NULL, NULL),
(6, 'CV Rahayu', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_role` int(12) NOT NULL,
  `nama_role` varchar(120) DEFAULT NULL,
  `scope_instansi` enum('semua','semua_opd','semua_desa','opd','desa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_role`, `nama_role`, `scope_instansi`) VALUES
(1, 'Administrator', 'semua'),
(2, 'PPTK OPD', 'opd'),
(3, 'PPTK Desa', 'desa'),
(4, 'Rekanan', 'semua'),
(5, 'Konsultan Pengawas', 'semua'),
(6, 'Monitoring', 'semua'),
(7, 'PA OPD', 'opd'),
(8, 'PA Desa', 'desa');

-- --------------------------------------------------------

--
-- Table structure for table `role_menu`
--

CREATE TABLE `role_menu` (
  `id_role_menu` int(12) NOT NULL,
  `id_role` int(12) DEFAULT NULL,
  `id_menu` int(12) DEFAULT NULL,
  `a_create` int(1) DEFAULT NULL,
  `a_update` int(1) DEFAULT NULL,
  `a_delete` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_menu`
--

INSERT INTO `role_menu` (`id_role_menu`, `id_role`, `id_menu`, `a_create`, `a_update`, `a_delete`) VALUES
(1, 1, 1, 0, 0, 0),
(2, 1, 2, 0, 0, 0),
(3, 1, 3, 0, 0, 0),
(4, 1, 4, 1, 1, 1),
(5, 1, 5, 1, 1, 1),
(6, 1, 6, 1, 1, 1),
(7, 1, 7, 1, 1, 1),
(8, 1, 8, 1, 1, 1),
(9, 2, 1, 1, 1, 1),
(10, 2, 2, 0, 0, 0),
(11, 2, 3, 0, 0, 0),
(12, 2, 4, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status_tahapan`
--

CREATE TABLE `status_tahapan` (
  `id_status_tahapan` int(12) NOT NULL,
  `nama_status_tahapan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sumber_dana`
--

CREATE TABLE `sumber_dana` (
  `id_sumber_dana` int(12) NOT NULL,
  `nama_sumber_dana` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sumber_dana`
--

INSERT INTO `sumber_dana` (`id_sumber_dana`, `nama_sumber_dana`) VALUES
(1, 'APBD'),
(2, 'DAK'),
(3, 'ADD');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nama` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `remember_token` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$SFLF.AxVD5D0xH.jNazTUe1dHtSxcnpp5.k4IoTittwbADZQmHO.m', 'Adminsitrator', NULL, '', '2018-02-05 11:38:07', '0000-00-00 00:00:00'),
(2, 'opd001', '$2y$10$SFLF.AxVD5D0xH.jNazTUe1dHtSxcnpp5.k4IoTittwbADZQmHO.m', 'Dinas Pekerjaan Umum', NULL, '', '2018-02-05 11:41:41', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_instansi`
--

CREATE TABLE `user_instansi` (
  `id_user_instansi` int(12) NOT NULL,
  `id_user` int(12) DEFAULT NULL,
  `id_instansi` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_instansi`
--

INSERT INTO `user_instansi` (`id_user_instansi`, `id_user`, `id_instansi`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_konsultan`
--

CREATE TABLE `user_konsultan` (
  `id_user_rekanan` int(12) NOT NULL,
  `id_user` int(12) DEFAULT NULL,
  `id_konsultan` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_rekanan`
--

CREATE TABLE `user_rekanan` (
  `id_user_rekanan` int(12) NOT NULL,
  `id_user` int(12) DEFAULT NULL,
  `id_rekanan` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id_user_role` int(12) NOT NULL,
  `id_user` int(12) DEFAULT NULL,
  `id_role` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id_user_role`, `id_user`, `id_role`) VALUES
(1, 1, 1),
(2, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indexes for table `jenis_proyek`
--
ALTER TABLE `jenis_proyek`
  ADD PRIMARY KEY (`id_jenis_proyek`);

--
-- Indexes for table `konsultan`
--
ALTER TABLE `konsultan`
  ADD PRIMARY KEY (`id_konsultan`) USING BTREE;

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pelaksana_proyek`
--
ALTER TABLE `pelaksana_proyek`
  ADD PRIMARY KEY (`id_pelaksana_proyek`),
  ADD UNIQUE KEY `id_proyek_2` (`id_proyek`,`id_rekanan`),
  ADD KEY `id_proyek` (`id_proyek`),
  ADD KEY `id_rekanan` (`id_rekanan`);

--
-- Indexes for table `pengawas_proyek`
--
ALTER TABLE `pengawas_proyek`
  ADD PRIMARY KEY (`id_konsultan_proyek`),
  ADD UNIQUE KEY `id_proyek_2` (`id_proyek`,`id_konsultan`),
  ADD KEY `id_proyek` (`id_proyek`),
  ADD KEY `id_konsultan` (`id_konsultan`);

--
-- Indexes for table `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`id_proyek`);

--
-- Indexes for table `rekanan`
--
ALTER TABLE `rekanan`
  ADD PRIMARY KEY (`id_rekanan`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`id_role_menu`),
  ADD KEY `id_roles` (`id_role`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `status_tahapan`
--
ALTER TABLE `status_tahapan`
  ADD PRIMARY KEY (`id_status_tahapan`);

--
-- Indexes for table `sumber_dana`
--
ALTER TABLE `sumber_dana`
  ADD PRIMARY KEY (`id_sumber_dana`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_instansi`
--
ALTER TABLE `user_instansi`
  ADD PRIMARY KEY (`id_user_instansi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_instansi` (`id_instansi`);

--
-- Indexes for table `user_konsultan`
--
ALTER TABLE `user_konsultan`
  ADD PRIMARY KEY (`id_user_rekanan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_rekanan` (`id_konsultan`);

--
-- Indexes for table `user_rekanan`
--
ALTER TABLE `user_rekanan`
  ADD PRIMARY KEY (`id_user_rekanan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_rekanan` (`id_rekanan`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_user_role`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jenis_proyek`
--
ALTER TABLE `jenis_proyek`
  MODIFY `id_jenis_proyek` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `konsultan`
--
ALTER TABLE `konsultan`
  MODIFY `id_konsultan` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pelaksana_proyek`
--
ALTER TABLE `pelaksana_proyek`
  MODIFY `id_pelaksana_proyek` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengawas_proyek`
--
ALTER TABLE `pengawas_proyek`
  MODIFY `id_konsultan_proyek` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proyek`
--
ALTER TABLE `proyek`
  MODIFY `id_proyek` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rekanan`
--
ALTER TABLE `rekanan`
  MODIFY `id_rekanan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `role_menu`
--
ALTER TABLE `role_menu`
  MODIFY `id_role_menu` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `status_tahapan`
--
ALTER TABLE `status_tahapan`
  MODIFY `id_status_tahapan` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sumber_dana`
--
ALTER TABLE `sumber_dana`
  MODIFY `id_sumber_dana` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_instansi`
--
ALTER TABLE `user_instansi`
  MODIFY `id_user_instansi` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_konsultan`
--
ALTER TABLE `user_konsultan`
  MODIFY `id_user_rekanan` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_rekanan`
--
ALTER TABLE `user_rekanan`
  MODIFY `id_user_rekanan` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_user_role` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
