/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL-LOCAL
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost:3306
 Source Schema         : project_tp4d

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 15/02/2018 19:49:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for instansi
-- ----------------------------
DROP TABLE IF EXISTS `instansi`;
CREATE TABLE `instansi`  (
  `id_instansi` int(12) NOT NULL AUTO_INCREMENT,
  `nama_instansi` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis` enum('opd','desa') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_instansi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of instansi
-- ----------------------------
INSERT INTO `instansi` VALUES (1, 'Dinas PUPR', 'opd');

-- ----------------------------
-- Table structure for jenis_proyek
-- ----------------------------
DROP TABLE IF EXISTS `jenis_proyek`;
CREATE TABLE `jenis_proyek`  (
  `id_jenis_proyek` int(12) NOT NULL AUTO_INCREMENT,
  `nama_jenis_proyek` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_proyek`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_proyek
-- ----------------------------
INSERT INTO `jenis_proyek` VALUES (1, 'Pekerjaan Konstruksi');
INSERT INTO `jenis_proyek` VALUES (2, 'Pengadaan Barang');
INSERT INTO `jenis_proyek` VALUES (3, 'Jasa Konsultansi Badan Usaha');
INSERT INTO `jenis_proyek` VALUES (4, 'Jasa Lainnya');

-- ----------------------------
-- Table structure for konsultan
-- ----------------------------
DROP TABLE IF EXISTS `konsultan`;
CREATE TABLE `konsultan`  (
  `id_konsultan` int(12) NOT NULL AUTO_INCREMENT,
  `nama_konsultan` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telepon` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_konsultan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `url` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `group_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Data Proyek', 'manajemen-proyek', 'la la-building', 'Menu');
INSERT INTO `menu` VALUES (2, 'Perkembangan Proyek', 'status-proyek', 'la la-area-chart', 'Menu');
INSERT INTO `menu` VALUES (3, 'Warning Proyek', 'warning-proyek', 'la la-bell', 'Menu');
INSERT INTO `menu` VALUES (4, 'Konsultasi', 'konsultasi', 'la la-comment', 'Menu');
INSERT INTO `menu` VALUES (5, 'Instansi', 'instansi', 'la la-bank', 'Setting');
INSERT INTO `menu` VALUES (6, 'Akun Pengguna', 'pengguna', 'la la-users', 'Setting');
INSERT INTO `menu` VALUES (7, 'Setting Dokumen', 'setting-dokumen', 'la la-briefcase', 'Setting');

-- ----------------------------
-- Table structure for pelaksana_proyek
-- ----------------------------
DROP TABLE IF EXISTS `pelaksana_proyek`;
CREATE TABLE `pelaksana_proyek`  (
  `id_pelaksana_proyek` int(12) NOT NULL AUTO_INCREMENT,
  `id_proyek` int(12) NULL DEFAULT NULL,
  `id_rekanan` int(12) NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL COMMENT '1=>Aktif, 2=>Diganti',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pelaksana_proyek`) USING BTREE,
  UNIQUE INDEX `id_proyek_2`(`id_proyek`, `id_rekanan`) USING BTREE,
  INDEX `id_proyek`(`id_proyek`) USING BTREE,
  INDEX `id_rekanan`(`id_rekanan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengawas_proyek
-- ----------------------------
DROP TABLE IF EXISTS `pengawas_proyek`;
CREATE TABLE `pengawas_proyek`  (
  `id_konsultan_proyek` int(12) NOT NULL AUTO_INCREMENT,
  `id_proyek` int(12) NULL DEFAULT NULL,
  `id_konsultan` int(12) NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL COMMENT '1=>Aktif, 2=>Diganti',
  `keterangan` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_konsultan_proyek`) USING BTREE,
  UNIQUE INDEX `id_proyek_2`(`id_proyek`, `id_konsultan`) USING BTREE,
  INDEX `id_proyek`(`id_proyek`) USING BTREE,
  INDEX `id_konsultan`(`id_konsultan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for proyek
-- ----------------------------
DROP TABLE IF EXISTS `proyek`;
CREATE TABLE `proyek`  (
  `id_proyek` int(12) NOT NULL AUTO_INCREMENT,
  `nomor_proyek` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_proyek` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_pekerjaan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_jenis_proyek` int(12) NULL DEFAULT NULL,
  `tahun_anggaran` int(4) NULL DEFAULT NULL,
  `tgl_mulai` date NULL DEFAULT NULL,
  `tgl_selesai` date NULL DEFAULT NULL,
  `jumlah_hari` int(12) NULL DEFAULT NULL COMMENT 'Dalam Kalender',
  `id_sumber_dana` int(12) NULL DEFAULT NULL,
  `nilai_proyek` decimal(18, 2) NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi_pekerjaan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_proyek`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rekanan
-- ----------------------------
DROP TABLE IF EXISTS `rekanan`;
CREATE TABLE `rekanan`  (
  `id_rekanan` int(12) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_direktur` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telepon` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_rekanan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rekanan
-- ----------------------------
INSERT INTO `rekanan` VALUES (1, 'CV Angin Ribut', 'Imam Guntur', '0751-09893520', 'anginribut@gmail.com');
INSERT INTO `rekanan` VALUES (2, 'CV Putra Petir', 'Wahid Gunawan', '0751-0982925', '');
INSERT INTO `rekanan` VALUES (3, 'CV Ahmandin', 'Ahamad', NULL, NULL);
INSERT INTO `rekanan` VALUES (4, 'CV Joko Susanto', 'Joko Susanto', NULL, NULL);
INSERT INTO `rekanan` VALUES (5, 'CV Jonatan', NULL, NULL, NULL);
INSERT INTO `rekanan` VALUES (6, 'CV Rahayu', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id_role_menu` int(12) NOT NULL AUTO_INCREMENT,
  `id_role` int(12) NULL DEFAULT NULL,
  `id_menu` int(12) NULL DEFAULT NULL,
  `a_create` int(1) NULL DEFAULT NULL,
  `a_update` int(1) NULL DEFAULT NULL,
  `a_delete` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_role_menu`) USING BTREE,
  INDEX `id_roles`(`id_role`) USING BTREE,
  INDEX `id_menu`(`id_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 1, 0, 0, 0);
INSERT INTO `role_menu` VALUES (2, 1, 2, 0, 0, 0);
INSERT INTO `role_menu` VALUES (3, 1, 3, 0, 0, 0);
INSERT INTO `role_menu` VALUES (4, 1, 4, 1, 1, 1);
INSERT INTO `role_menu` VALUES (5, 1, 5, 1, 1, 1);
INSERT INTO `role_menu` VALUES (6, 1, 6, 1, 1, 1);
INSERT INTO `role_menu` VALUES (7, 1, 7, 1, 1, 1);
INSERT INTO `role_menu` VALUES (8, 1, 8, 1, 1, 1);
INSERT INTO `role_menu` VALUES (9, 2, 1, 1, 1, 1);
INSERT INTO `role_menu` VALUES (10, 2, 2, 0, 0, 0);
INSERT INTO `role_menu` VALUES (11, 2, 3, 0, 0, 0);
INSERT INTO `role_menu` VALUES (12, 2, 4, 1, 1, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id_role` int(12) NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `scope_instansi` enum('semua','semua_opd','semua_desa','opd','desa') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrator', 'semua');
INSERT INTO `roles` VALUES (2, 'PPTK OPD', 'opd');
INSERT INTO `roles` VALUES (3, 'PPTK Desa', 'desa');
INSERT INTO `roles` VALUES (4, 'Rekanan', 'semua');
INSERT INTO `roles` VALUES (5, 'Konsultan Pengawas', 'semua');
INSERT INTO `roles` VALUES (6, 'Monitoring', 'semua');
INSERT INTO `roles` VALUES (7, 'PA OPD', 'opd');
INSERT INTO `roles` VALUES (8, 'PA Desa', 'desa');

-- ----------------------------
-- Table structure for status_tahapan
-- ----------------------------
DROP TABLE IF EXISTS `status_tahapan`;
CREATE TABLE `status_tahapan`  (
  `id_status_tahapan` int(12) NOT NULL AUTO_INCREMENT,
  `nama_status_tahapan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_tahapan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sumber_dana
-- ----------------------------
DROP TABLE IF EXISTS `sumber_dana`;
CREATE TABLE `sumber_dana`  (
  `id_sumber_dana` int(12) NOT NULL AUTO_INCREMENT,
  `nama_sumber_dana` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_sumber_dana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sumber_dana
-- ----------------------------
INSERT INTO `sumber_dana` VALUES (1, 'APBD');
INSERT INTO `sumber_dana` VALUES (2, 'DAK');
INSERT INTO `sumber_dana` VALUES (3, 'ADD');

-- ----------------------------
-- Table structure for user_instansi
-- ----------------------------
DROP TABLE IF EXISTS `user_instansi`;
CREATE TABLE `user_instansi`  (
  `id_user_instansi` int(12) NOT NULL AUTO_INCREMENT,
  `id_user` int(12) NULL DEFAULT NULL,
  `id_instansi` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user_instansi`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_instansi`(`id_instansi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_instansi
-- ----------------------------
INSERT INTO `user_instansi` VALUES (1, 2, 1);

-- ----------------------------
-- Table structure for user_konsultan
-- ----------------------------
DROP TABLE IF EXISTS `user_konsultan`;
CREATE TABLE `user_konsultan`  (
  `id_user_konsultan` int(12) NOT NULL AUTO_INCREMENT,
  `id_user` int(12) NULL DEFAULT NULL,
  `id_konsultan` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user_konsultan`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_rekanan`(`id_konsultan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_rekanan
-- ----------------------------
DROP TABLE IF EXISTS `user_rekanan`;
CREATE TABLE `user_rekanan`  (
  `id_user_rekanan` int(12) NOT NULL AUTO_INCREMENT,
  `id_user` int(12) NULL DEFAULT NULL,
  `id_rekanan` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user_rekanan`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_rekanan`(`id_rekanan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id_user_role` int(12) NOT NULL AUTO_INCREMENT,
  `id_user` int(12) NULL DEFAULT NULL,
  `id_role` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user_role`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_role`(`id_role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `remember_token` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2y$10$SFLF.AxVD5D0xH.jNazTUe1dHtSxcnpp5.k4IoTittwbADZQmHO.m', 'Adminsitrator', NULL, '', '2018-02-05 11:38:07', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES (2, 'opd001', '$2y$10$SFLF.AxVD5D0xH.jNazTUe1dHtSxcnpp5.k4IoTittwbADZQmHO.m', 'Dinas Pekerjaan Umum', NULL, '', '2018-02-05 11:41:41', '0000-00-00 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
