/*
 Navicat Premium Data Transfer

 Source Server         : MyConnection
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : classrecord

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 09/03/2020 15:39:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_devs
-- ----------------------------
DROP TABLE IF EXISTS `admin_devs`;
CREATE TABLE `admin_devs`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `firstname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_devs
-- ----------------------------
INSERT INTO `admin_devs` VALUES (3, 'gab04', 'gabjen@gmail.com', 'Jennelyn', 'Gabriel', 'University of Mindanao', '$2y$10$LO6HCiZUkLhRAJdLTiJeveXvifSxcW/bX8gJD/aB5TlzLqWKYpYWS');

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `administrator_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_devs_id` int(11) NULL DEFAULT NULL,
  `school_id` int(50) NOT NULL,
  `firstname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sex` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `birthdate` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`administrator_id`) USING BTREE,
  INDEX `administrator_ibfk_1`(`school_id`) USING BTREE,
  INDEX `administrator_ibfk_2`(`admin_devs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 3, 1, 'Gabriel', 'Nieve', 'Male', '1997-05-13', 'Lim del Rosario St., Digos City, Davao del Sur', 'gnieve13@gmail.com', '0');
INSERT INTO `administrator` VALUES (2, 3, 1, 'test', 'test', 'Male', '1999-05-13', 'Lim del Rosario St., Digos City, Davao del Sur', 'test@test.test', '0');
INSERT INTO `administrator` VALUES (3, 3, 1, 'test', 'test', 'Male', '2020-02-06', 'Lim del Rosario St., Digos City, Davao del Sur', 'gnieve13@gmail.com', '0');
INSERT INTO `administrator` VALUES (4, 3, 1, 'Gabriel', 'Nieve', 'Female', '', 'Lim del Rosario St., Digos City, Davao del Sur', 'gnieve13@gmail.com', '0');
INSERT INTO `administrator` VALUES (5, 3, 1, 'Gabriel', 'Nieve', 'Male', '', 'Lim del Rosario St., Digos City, Davao del Sur', 'gnieve13@gmail.com', '0');
INSERT INTO `administrator` VALUES (6, 3, 1, 'test', 'test', 'Female', '1997-05-13', 'Lim del Rosario St., Digos City, Davao del Sur', 'test@gmail.com', '0');
INSERT INTO `administrator` VALUES (7, 3, 1, 'hahha', 'hahaha', 'Male', '1997-05-13', 'asdf', 'haha@haha.haha', '0');

-- ----------------------------
-- Table structure for administrator_reg
-- ----------------------------
DROP TABLE IF EXISTS `administrator_reg`;
CREATE TABLE `administrator_reg`  (
  `administrator_reg_id` int(255) NOT NULL AUTO_INCREMENT,
  `administrator_id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `admin_devs_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`administrator_reg_id`) USING BTREE,
  INDEX `admin_devs_id`(`admin_devs_id`) USING BTREE,
  CONSTRAINT `administrator_reg_ibfk_1` FOREIGN KEY (`admin_devs_id`) REFERENCES `admin_devs` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of administrator_reg
-- ----------------------------
INSERT INTO `administrator_reg` VALUES (12, 11, 'administrator', '$2y$10$yaFVym.3d8A/zWR43CNpjOMTzxd4TXyRLrkc9/usKEqlop0cAeRZi', NULL, 3);
INSERT INTO `administrator_reg` VALUES (13, 1, 'administrator', '$2y$10$YdS8E2aqu27FUOxR678DQeOG2r0O1KygBOoakZSLMXrVZAgUQT4Hi', NULL, 3);

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NULL DEFAULT NULL,
  `classroom` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classroom_id`) USING BTREE,
  INDEX `school_id`(`school_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES (1, 1, 'C1');
INSERT INTO `classroom` VALUES (2, 1, 'C2');
INSERT INTO `classroom` VALUES (3, 1, 'C3');
INSERT INTO `classroom` VALUES (8, 1, 'C4');

-- ----------------------------
-- Table structure for department_head
-- ----------------------------
DROP TABLE IF EXISTS `department_head`;
CREATE TABLE `department_head`  (
  `department_head_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`department_head_id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `department_head_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for enkai
-- ----------------------------
DROP TABLE IF EXISTS `enkai`;
CREATE TABLE `enkai`  (
  `enkai_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `gsa_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `academic_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tvl_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sport_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `arts_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `first_choice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `occupational_interest` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`enkai_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of enkai
-- ----------------------------
INSERT INTO `enkai` VALUES (1, 1, '78', '80', '83', '85', '92', '83', '34');
INSERT INTO `enkai` VALUES (2, 2, '78', '80', '83', '85', '92', '83', '2');
INSERT INTO `enkai` VALUES (3, 3, '78', '80', '83', '85', '92', '83', '3');

-- ----------------------------
-- Table structure for guidance
-- ----------------------------
DROP TABLE IF EXISTS `guidance`;
CREATE TABLE `guidance`  (
  `guidance_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `id_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sex` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `birthdate` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`guidance_id`, `admin_id`) USING BTREE,
  UNIQUE INDEX `id_number`(`id_number`) USING BTREE,
  INDEX `school_id`(`school_id`) USING BTREE,
  INDEX `teacher_id`(`guidance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guidance
-- ----------------------------
INSERT INTO `guidance` VALUES (24, 0, 1, '45923', 'Nieve (Teacher)', 'Gabriel', 'Male', '10-10-1997', NULL);
INSERT INTO `guidance` VALUES (25, 0, 1, '21352', 'Nieve III', 'Armando Emmanuel', 'Male', '2020-01-15', '');
INSERT INTO `guidance` VALUES (27, 0, 1, '2352123', 'Blala', 'Miss Fernandez', 'Male', '2020-01-20', 'Lim-Del Rosario Sts., Digos City, Davao del Sur');
INSERT INTO `guidance` VALUES (28, 1, 1, '2345', 'Nieve', 'Armando Gabriel IV', 'Male', '12351235', 'Lim del Rosario St., Digos City, Davao del Sur');

-- ----------------------------
-- Table structure for guidance_reg
-- ----------------------------
DROP TABLE IF EXISTS `guidance_reg`;
CREATE TABLE `guidance_reg`  (
  `guidance_reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`guidance_reg_id`) USING BTREE,
  UNIQUE INDEX `id_number`(`id_number`) USING BTREE,
  CONSTRAINT `guidance_reg_ibfk_1` FOREIGN KEY (`id_number`) REFERENCES `teacher` (`id_number`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guidance_reg
-- ----------------------------
INSERT INTO `guidance_reg` VALUES (3, '45923', 'teacher', 'gnieve13@gmail.com', '$2y$10$jBBOhFcLsZLOgtcllZ/YmeMObHeRDzNRAQrEm8xcKqoelsEM9vG0q');
INSERT INTO `guidance_reg` VALUES (6, '21352', 'teacher', 'test@gmail.com', '$2y$10$VYiD9iVmVxuA/luq7YOrz.ay/ZlqmNIgHRwk9CJ2gGY601aoq2kLq');

-- ----------------------------
-- Table structure for occupational_interest
-- ----------------------------
DROP TABLE IF EXISTS `occupational_interest`;
CREATE TABLE `occupational_interest`  (
  `occupational_interest_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`occupational_interest_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of occupational_interest
-- ----------------------------
INSERT INTO `occupational_interest` VALUES (1, 'Science', 'Medicine', 'A1', 'Optometrist');
INSERT INTO `occupational_interest` VALUES (2, 'Science', 'Medicine', 'A2', 'Doctor of Medicine / Cardiologist / Oncologist / Radiologist / Orthopedic Surgeon');
INSERT INTO `occupational_interest` VALUES (3, 'Science', 'Medicine', 'A3', 'Surgeon (all fields)');
INSERT INTO `occupational_interest` VALUES (4, 'Science', 'Medicine', 'A4', 'Dermatologist');
INSERT INTO `occupational_interest` VALUES (5, 'Science', 'Medicine', 'A5', 'Dentist');
INSERT INTO `occupational_interest` VALUES (6, 'Science', 'Medicine', 'A6', 'Veterinary Medicine');
INSERT INTO `occupational_interest` VALUES (7, 'Science', 'Medicine', 'A7', 'Forensic Analyst');
INSERT INTO `occupational_interest` VALUES (8, 'Science', 'Allied Medicine', 'A8', 'Speech Pathologist/ Physical Therapist / Occupational Therapist');
INSERT INTO `occupational_interest` VALUES (9, 'Science', 'Allied Health Professions', 'A9', 'Nurse');
INSERT INTO `occupational_interest` VALUES (10, 'Science', 'Allied Health', 'A10', 'Medical Technologist');
INSERT INTO `occupational_interest` VALUES (11, 'Science', 'Allied Health Professions', 'A11', 'Geneticist/DNA Analyst');
INSERT INTO `occupational_interest` VALUES (12, 'Science', 'Allied Health Professions', 'A12', 'Pharmacist');
INSERT INTO `occupational_interest` VALUES (13, 'Science', 'Allied Health Professions', 'A13', 'Food Technologist');
INSERT INTO `occupational_interest` VALUES (14, 'Science', 'Hospital Administration', 'A14', 'Hospital Manager');
INSERT INTO `occupational_interest` VALUES (15, 'Science', 'Hospital Administration', 'A15', 'Medical Supervisor');
INSERT INTO `occupational_interest` VALUES (16, 'Science', 'Health & Wellness Support Staff', 'A16', 'Therapy Assistant');
INSERT INTO `occupational_interest` VALUES (17, 'Science', 'Health & Wellness Support Staff', 'A17', 'Nursing Aide/ Caregiver');
INSERT INTO `occupational_interest` VALUES (18, 'Science', 'Health & Wellness Support Staff', 'A18', 'Laboratory Aide');
INSERT INTO `occupational_interest` VALUES (19, 'Science', 'Health & Wellness Support Staff', 'A19', 'Optical Aide');
INSERT INTO `occupational_interest` VALUES (20, 'Science', 'Health & Wellness Support Staff', 'A20', 'Laboratory Encoder/ X-ray Technician/ Laboratory Technician');
INSERT INTO `occupational_interest` VALUES (21, 'Science', 'Health & Wellness Support Staff', 'A21', 'Medical Transcriptionist');
INSERT INTO `occupational_interest` VALUES (22, 'Science', 'Health & Wellness Support Staff', 'A22', 'Medical Secretary');
INSERT INTO `occupational_interest` VALUES (23, 'Science', 'Health & Wellness Support Staff', 'A23', 'Medical Sales Representative/ Medical Advertising Representative');
INSERT INTO `occupational_interest` VALUES (24, 'Science', 'Health & Wellness Support Staff', 'A24', 'Hospital Utility Worker');
INSERT INTO `occupational_interest` VALUES (25, 'Science', 'Health & Wellness Support Staff', 'A25', 'Gym Instructor');
INSERT INTO `occupational_interest` VALUES (26, 'Science', 'Health & Wellness Support Staff', 'A26', 'Spa Aide');
INSERT INTO `occupational_interest` VALUES (27, 'Natural Science', 'Specialized Areas', 'B1', 'Biologist');
INSERT INTO `occupational_interest` VALUES (28, 'Natural Science', 'Specialized Areas', 'B2', 'Botanist');
INSERT INTO `occupational_interest` VALUES (29, 'Natural Science', 'Specialized Areas', 'B3', 'Zoologist');
INSERT INTO `occupational_interest` VALUES (30, 'Natural Science', 'Specialized Areas', 'B4', 'Chemist');
INSERT INTO `occupational_interest` VALUES (31, 'Natural Science', 'Specialized Areas', 'B5', 'Geologist');
INSERT INTO `occupational_interest` VALUES (32, 'Natural Science', 'Specialized', 'B6', 'Geographer');
INSERT INTO `occupational_interest` VALUES (33, 'Natural Science', 'Specialized Areas', 'B7', 'Volcanologist/ Seismologist');
INSERT INTO `occupational_interest` VALUES (34, 'Aquaculture/ Agriculture & Forestry', 'Specialized Areas', 'C1', 'Aquaculturist');
INSERT INTO `occupational_interest` VALUES (35, 'Aquaculture/ Agriculture & Forestry', 'Specialized Areas', 'C2', 'Agriculturist');
INSERT INTO `occupational_interest` VALUES (36, 'Aquaculture/ Agriculture & Forestry', 'Specialized Areas', 'C3', 'Forest Ranger');
INSERT INTO `occupational_interest` VALUES (37, 'Aquaculture/ Agriculture & Forestry', 'Specialized Areas', 'C4', 'Floriculturist');
INSERT INTO `occupational_interest` VALUES (38, 'Aquaculture/ Agriculture & Forestry', 'Specialized Areas', 'C5', 'Herbologist');
INSERT INTO `occupational_interest` VALUES (39, 'Aquaculture/ Agriculture & Forestry', 'Support Staff', 'C6', 'Fishing Boat Captain');
INSERT INTO `occupational_interest` VALUES (40, 'Aquaculture/ Agriculture & Forestry', 'Support Staff', 'C7', 'Fishing Crew');
INSERT INTO `occupational_interest` VALUES (41, 'Aquaculture/ Agriculture & Forestry', 'Support Staff', 'C8', 'Forester');
INSERT INTO `occupational_interest` VALUES (42, 'Aquaculture/ Agriculture & Forestry', 'Support Staff', 'C9', 'Farmer');
INSERT INTO `occupational_interest` VALUES (43, 'Aquaculture/ Agriculture & Forestry', 'Support Staff', 'C10', 'Canning Worker');
INSERT INTO `occupational_interest` VALUES (44, 'Aquaculture/ Agriculture & Forestry', 'Support Staff', 'C11', 'Plant Hobbyist');
INSERT INTO `occupational_interest` VALUES (45, 'Engineering', 'Specialized Areas', 'D1', 'Mechanical Engineer');
INSERT INTO `occupational_interest` VALUES (46, 'Engineering', 'Specialized Areas', 'D2', 'Biological Engineer');
INSERT INTO `occupational_interest` VALUES (47, 'Engineering', 'Specialized Areas', 'D3', 'Civil Engineer');
INSERT INTO `occupational_interest` VALUES (48, 'Engineering', 'Specialized Areas', 'D4', 'Safety Engineer');
INSERT INTO `occupational_interest` VALUES (49, 'Engineering', 'Specialized Areas', 'D5', 'Mining Engineer');
INSERT INTO `occupational_interest` VALUES (50, 'Engineering', 'Specialized Areas', 'D6', 'Electrical Engineer');
INSERT INTO `occupational_interest` VALUES (51, 'Engineering', 'Specialized Areas', 'D7', 'Agricultural Engineer');
INSERT INTO `occupational_interest` VALUES (52, 'Engineering', 'Specialized Areas', 'D8', 'Chemical Engineer');
INSERT INTO `occupational_interest` VALUES (53, 'Engineering', 'Specialized Areas', 'D9', 'Geodetic Engineer');
INSERT INTO `occupational_interest` VALUES (54, 'Engineering', 'Specialized Areas', 'D10', 'Marine Engineer');
INSERT INTO `occupational_interest` VALUES (55, 'Engineering', 'Specialized Areas', 'D11', 'Structural Engineer');
INSERT INTO `occupational_interest` VALUES (56, 'Engineering', 'Support Staff', 'D12', 'CP - Radio Technician/ Electronic Technician/ Air-con Technician');
INSERT INTO `occupational_interest` VALUES (57, 'Engineering', 'Support Staff', 'D13', 'Car-Auto Machinist (Mechanic)');
INSERT INTO `occupational_interest` VALUES (58, 'Business and Finance/ Commerce', 'Finance', 'E1', 'Economist');
INSERT INTO `occupational_interest` VALUES (59, 'Business and Finance/ Commerce', 'Finance', 'E2', 'Banker');
INSERT INTO `occupational_interest` VALUES (60, 'Business and Finance/ Commerce', 'Finance', 'E3', 'Financial Analyst');
INSERT INTO `occupational_interest` VALUES (61, 'Business and Finance/ Commerce', 'Finance', 'E4', 'Accountant');
INSERT INTO `occupational_interest` VALUES (62, 'Business and Finance/ Commerce', 'Finance', 'E5', 'Budget Officer');
INSERT INTO `occupational_interest` VALUES (63, 'Business and Finance/ Commerce', 'Finance', 'E6', 'Bookkeeper');
INSERT INTO `occupational_interest` VALUES (64, 'Business and Finance/ Commerce', 'Business', 'E7', 'HR Manager');
INSERT INTO `occupational_interest` VALUES (65, 'Business and Finance/ Commerce', 'Business', 'E8', 'Sales Manager');
INSERT INTO `occupational_interest` VALUES (66, 'Business and Finance/ Commerce', 'Business', 'E9', 'Warehouse Supervisor/ Stock Room Supervisor');
INSERT INTO `occupational_interest` VALUES (67, 'Business and Finance/ Commerce', 'Business', 'E10', 'Marketing Officer');
INSERT INTO `occupational_interest` VALUES (68, 'Business and Finance/ Commerce', 'Business', 'E11', 'Advertising Executive');
INSERT INTO `occupational_interest` VALUES (69, 'Business and Finance/ Commerce', 'Business', 'E12', 'Statistician/ Actuarial Mathematician');
INSERT INTO `occupational_interest` VALUES (70, 'Business and Finance/ Commerce', 'Business', 'E13', 'Real Estate Broker');
INSERT INTO `occupational_interest` VALUES (71, 'Business and Finance/ Commerce', 'Support Staff', 'E14', 'On-line Sales Agent');
INSERT INTO `occupational_interest` VALUES (72, 'Business and Finance/ Commerce', 'Support Staff', 'E15', 'Call Center Agent');
INSERT INTO `occupational_interest` VALUES (73, 'Business and Finance/ Commerce', 'Support Staff', 'E16', 'Sales Clerk');
INSERT INTO `occupational_interest` VALUES (74, 'Business and Finance/ Commerce', 'Support Staff', 'E17', 'Sales Representative');
INSERT INTO `occupational_interest` VALUES (75, 'Business and Finance/ Commerce', 'Support Staff', 'E18', 'Stone Keeper');
INSERT INTO `occupational_interest` VALUES (76, 'Business and Finance/ Commerce', 'Support Staff', 'E19', 'Cashier');
INSERT INTO `occupational_interest` VALUES (77, 'Business and Finance/ Commerce', 'Support Staff', 'E20', 'Sales Record Keeper');
INSERT INTO `occupational_interest` VALUES (78, 'Business and Finance/ Commerce', 'Support Staff', 'E21', 'Office Clerk');
INSERT INTO `occupational_interest` VALUES (79, 'Business and Finance/ Commerce', 'Support Staff', 'E22', 'Sales Promote/Promo Merchandiser');
INSERT INTO `occupational_interest` VALUES (80, 'Business and Finance/ Commerce', 'Support Staff', 'E23', 'Small Scale Store Owner');
INSERT INTO `occupational_interest` VALUES (81, 'Business and Finance/ Commerce', 'Support Staff', 'E24', 'Security Guard');
INSERT INTO `occupational_interest` VALUES (82, 'Professional Services', 'Specialized Area: Law - The Court', 'F1', 'Judge');
INSERT INTO `occupational_interest` VALUES (83, 'Professional Services', 'Specialized Area: Law - The Court', 'F2', 'Lawyer');
INSERT INTO `occupational_interest` VALUES (84, 'Professional Services', 'Specialized Area: Law - The Court', 'F3', 'Legal Associate');
INSERT INTO `occupational_interest` VALUES (85, 'Professional Services', 'Specialized Area: Law - The Court', 'F4', 'Clerk of Court');
INSERT INTO `occupational_interest` VALUES (86, 'Professional Services', 'Specialized Area: Law - The Court', 'F5', 'Legal Secretary/ Legal Clerk');
INSERT INTO `occupational_interest` VALUES (87, 'Professional Services', 'Specialized Area: Education - Teaching', 'F6', 'Pre-school Teacher');
INSERT INTO `occupational_interest` VALUES (88, 'Professional Services', 'Specialized Area: Education - Teaching', 'F7', 'Elementary Teacher');
INSERT INTO `occupational_interest` VALUES (89, 'Professional Services', 'Specialized Area: Education - Teaching', 'F8', 'High School Teacher');
INSERT INTO `occupational_interest` VALUES (90, 'Professional Services', 'Specialized Area: Education - Teaching', 'F9', 'College Professor');
INSERT INTO `occupational_interest` VALUES (91, 'Professional Services', 'Specialized Area: Education - Teaching', 'F10', '(Post) Professor in Graduate School, Master\'s or Ph D. Courses');
INSERT INTO `occupational_interest` VALUES (92, 'Professional Services', 'School Administrator', 'F11', 'School Head');
INSERT INTO `occupational_interest` VALUES (93, 'Professional Services', 'School Administrator', 'F12', 'Registrar');
INSERT INTO `occupational_interest` VALUES (94, 'Professional Services', 'Guidance and Counselling', 'F13', 'Guidance Councelor');
INSERT INTO `occupational_interest` VALUES (95, 'Professional Services', 'Support Staff', 'F14', 'Librarian');
INSERT INTO `occupational_interest` VALUES (96, 'Professional Services', 'Support Staff', 'F15', 'Teacher/Aide/School Aide');
INSERT INTO `occupational_interest` VALUES (97, 'Professional Services', 'Support Staff', 'F16', 'Technical-Vocational Aide');
INSERT INTO `occupational_interest` VALUES (98, 'Professional Services', 'Support Staff', 'F17', 'School Clerk');
INSERT INTO `occupational_interest` VALUES (99, 'Professional Services', 'Support Staff', 'F18', 'School Janitor');
INSERT INTO `occupational_interest` VALUES (100, 'Professional Services', 'Support Staff', 'F19', 'School Canteen Helper');
INSERT INTO `occupational_interest` VALUES (101, 'Professional Services', 'Support Staff', 'F20', 'School Security Officer');
INSERT INTO `occupational_interest` VALUES (102, 'Personal Services', 'Transportation and Travel - Specialize Area', 'G1', 'Aviation - Pilot');
INSERT INTO `occupational_interest` VALUES (103, 'Personal Services', 'Transportation and Travel - Specialize Area', 'G2', 'Air Tower Comptroller');
INSERT INTO `occupational_interest` VALUES (104, 'Personal Services', 'Transportation and Travel - Specialize Area', 'G3', 'Air Radio Comptroller');
INSERT INTO `occupational_interest` VALUES (105, 'Personal Services', 'Personal Services', 'G4', 'Marine Ship Captain');
INSERT INTO `occupational_interest` VALUES (106, 'Personal Services', 'Personal Services', 'G5', 'Chief Mate');
INSERT INTO `occupational_interest` VALUES (107, 'Personal Services', 'Support Staff', 'G6', 'Flight Attendant');
INSERT INTO `occupational_interest` VALUES (108, 'Personal Services', 'Support Staff', 'G7', 'Aircraft Technician');
INSERT INTO `occupational_interest` VALUES (109, 'Personal Services', 'Support Staff', 'G8', 'Airline Ground Crew');
INSERT INTO `occupational_interest` VALUES (110, 'Personal Services', 'Support Staff', 'G9', 'Seaman');
INSERT INTO `occupational_interest` VALUES (111, 'Personal Services', 'Support Staff', 'G10', 'Messman/Cook');
INSERT INTO `occupational_interest` VALUES (112, 'Personal Services', 'Support Staff', 'G11', 'Driver');
INSERT INTO `occupational_interest` VALUES (113, 'Personal Services', 'Support Staff', 'G12', 'Ticketing Clerk');
INSERT INTO `occupational_interest` VALUES (114, 'Personal Services', 'Support Staff', 'G13', 'Hotel and HR Manager');
INSERT INTO `occupational_interest` VALUES (115, 'Personal Services', 'Support Staff', 'G14', 'HR Supervisor');
INSERT INTO `occupational_interest` VALUES (116, 'Personal Services', 'Support Staff', 'G15', 'Hotel/Building Maintenance Supervisor');
INSERT INTO `occupational_interest` VALUES (117, 'Personal Services', 'Hotel Support Staff', 'G16', 'Front Desk Clerk');
INSERT INTO `occupational_interest` VALUES (118, 'Personal Services', 'Hotel Support Staff', 'G17', 'Chef/Pastry/Bread Maker');
INSERT INTO `occupational_interest` VALUES (119, 'Personal Services', 'Hotel Support Staff', 'G18', 'Barista');
INSERT INTO `occupational_interest` VALUES (120, 'Personal Services', 'Hotel Support Staff', 'G19', 'Hotel Attendant');
INSERT INTO `occupational_interest` VALUES (121, 'Personal Services', 'Hotel Support Staff', 'G20', 'Elevator Attendant');
INSERT INTO `occupational_interest` VALUES (122, 'Personal Services', 'Hotel Support Staff', 'G21', 'Chambermaid');
INSERT INTO `occupational_interest` VALUES (123, 'Personal Services', 'Tourism Support Staff', 'G22', 'Travel Agent');
INSERT INTO `occupational_interest` VALUES (124, 'Personal Services', 'Tourism Support Staff', 'G23', 'Tour Guide');
INSERT INTO `occupational_interest` VALUES (125, 'Computers and Technology', 'IT and Cyber Services', 'H1', 'Web Designer');
INSERT INTO `occupational_interest` VALUES (126, 'Computers and Technology', 'IT and Cyber Services', 'H2', 'Web Analyst');
INSERT INTO `occupational_interest` VALUES (127, 'Computers and Technology', 'IT and Cyber Services', 'H3', 'Web Programmer/ Software Programmer');
INSERT INTO `occupational_interest` VALUES (128, 'Computers and Technology', 'IT and Cyber Services', 'H4', 'Computer Games Programmer');
INSERT INTO `occupational_interest` VALUES (129, 'Computers and Technology', 'IT and Cyber Services', 'H5', 'IT Instructor');
INSERT INTO `occupational_interest` VALUES (130, 'Computers and Technology', 'IT and Cyber Services', 'H6', 'Database Analyst');
INSERT INTO `occupational_interest` VALUES (131, 'Computers and Technology', 'Support Staff', 'H7', 'Animator/Cartoonist');
INSERT INTO `occupational_interest` VALUES (132, 'Computers and Technology', 'Support Staff', 'H8', 'Date Encoder');
INSERT INTO `occupational_interest` VALUES (133, 'Computers and Technology', 'Support Staff', 'H9', 'Computer Repairman/ Technician');
INSERT INTO `occupational_interest` VALUES (134, 'Computers and Technology', 'Computers and Technology', 'H10', 'Computer Clerk');
INSERT INTO `occupational_interest` VALUES (135, 'Computers and Technology', 'Computers and Technology', 'H11', 'Computer Aide');
INSERT INTO `occupational_interest` VALUES (136, 'Computers and Technology', 'Computers and Technology', 'H12', 'Computer Drafter');
INSERT INTO `occupational_interest` VALUES (137, 'Computers and Technology', 'Computers and Technology', 'H13', 'IT Sales Clerk');
INSERT INTO `occupational_interest` VALUES (138, 'Media and Communication', 'Communication and Broadcasting Specialist', 'I1', 'Mass Communication Journalist');
INSERT INTO `occupational_interest` VALUES (139, 'Media and Communication', 'Communication and Broadcasting Specialist', 'I2', 'Newscaster');
INSERT INTO `occupational_interest` VALUES (140, 'Media and Communication', 'Communication and Broadcasting Specialist', 'I3', 'News Editor');
INSERT INTO `occupational_interest` VALUES (141, 'Media and Communication', 'Communication and Broadcasting Specialist', 'I4', 'Radio Announcer');
INSERT INTO `occupational_interest` VALUES (142, 'Media and Communication', 'Communication and Broadcasting Specialist', 'I5', 'Sound Engineer');
INSERT INTO `occupational_interest` VALUES (143, 'Media and Communication', 'Support Staff', 'I6', 'TV Operator');
INSERT INTO `occupational_interest` VALUES (144, 'Media and Communication', 'Support Staff', 'I7', 'Cameraman');
INSERT INTO `occupational_interest` VALUES (145, 'Media and Communication', 'Support Staff', 'I8', 'Radio Technician');
INSERT INTO `occupational_interest` VALUES (146, 'Media and Communication', 'Support Staff', 'I9', 'Dubber');
INSERT INTO `occupational_interest` VALUES (147, 'Media and Communication', 'Support Staff', 'I10', 'Voice Over Talent');
INSERT INTO `occupational_interest` VALUES (148, 'Media and Communication', 'Support Staff', 'I11', 'Proof Reader');
INSERT INTO `occupational_interest` VALUES (149, 'Media and Communication', 'Support Staff', 'I12', 'Carcaturist');
INSERT INTO `occupational_interest` VALUES (150, 'Media and Communication', 'Support Staff', 'I13', 'Comics Illustrator');
INSERT INTO `occupational_interest` VALUES (151, 'Media and Communication', 'Support Staff', 'I14', 'Photographer');
INSERT INTO `occupational_interest` VALUES (152, 'Community Services', 'Community Governance, Administration and Specialized Services', 'J1', 'Barangay Officer');
INSERT INTO `occupational_interest` VALUES (153, 'Community Services', 'Community Governance, Administration and Specialized Services', 'J2', 'Barangay Health Official');
INSERT INTO `occupational_interest` VALUES (154, 'Community Services', 'Community Governance, Administration and Specialized Services', 'J3', 'Social Worker');
INSERT INTO `occupational_interest` VALUES (155, 'Community Services', 'Community Support Staff', 'J4', 'Barangay Cleaners');
INSERT INTO `occupational_interest` VALUES (156, 'Community Services', 'Community Support Staff', 'J5', 'Barangay Clerk');
INSERT INTO `occupational_interest` VALUES (157, 'Community Services', 'Community Support Staff', 'J6', 'Barangay Aide');
INSERT INTO `occupational_interest` VALUES (158, 'Community Services', 'Community Support Staff', 'J7', 'Rescue Volunteer');
INSERT INTO `occupational_interest` VALUES (159, 'Architecture and Construction', 'Professional Services', 'K1', 'Building Architect/ Architect');
INSERT INTO `occupational_interest` VALUES (160, 'Architecture and Construction', 'Professional Services', 'K2', 'Landscape Architect');
INSERT INTO `occupational_interest` VALUES (161, 'Architecture and Construction', 'Professional Services', 'K3', 'Interior Designer');
INSERT INTO `occupational_interest` VALUES (162, 'Architecture and Construction', 'Professional Services', 'K4', 'Surveyor');
INSERT INTO `occupational_interest` VALUES (163, 'Architecture and Construction', 'Professional Services', 'K5', 'Real Estate Developer');
INSERT INTO `occupational_interest` VALUES (164, 'Architecture and Construction', 'Construction Service and Support Staff', 'K6', 'Foreman');
INSERT INTO `occupational_interest` VALUES (165, 'Architecture and Construction', 'Construction Service and Support Staff', 'K7', 'Mason');
INSERT INTO `occupational_interest` VALUES (166, 'Architecture and Construction', 'Construction Service and Support Staff', 'K8', 'Pipe Welder');
INSERT INTO `occupational_interest` VALUES (167, 'Architecture and Construction', 'Construction Service and Support Staff', 'K9', 'Painter');
INSERT INTO `occupational_interest` VALUES (168, 'Architecture and Construction', 'Construction Service and Support Staff', 'K10', 'Wood Carver');
INSERT INTO `occupational_interest` VALUES (169, 'Architecture and Construction', 'Construction Service and Support Staff', 'K11', 'Iron Grill Welder');
INSERT INTO `occupational_interest` VALUES (170, 'Architecture and Construction', 'Construction Service and Support Staff', 'K12', 'Pottery Maker');
INSERT INTO `occupational_interest` VALUES (171, 'Architecture and Construction', 'Construction Service and Support Staff', 'K13', 'Building Aide');
INSERT INTO `occupational_interest` VALUES (172, 'Architecture and Construction', 'Construction Service and Support Staff', 'K14', 'Landscaper');
INSERT INTO `occupational_interest` VALUES (173, 'Architecture and Construction', 'Construction Service and Support Staff', 'K15', 'Carpenter');
INSERT INTO `occupational_interest` VALUES (174, 'The Arts', 'The performing Arts Theater, Movies and Television Program, Theater/ Movie Professionals', 'L1', 'Director');
INSERT INTO `occupational_interest` VALUES (175, 'The Arts', 'The performing Arts Theater, Movies and Television Program, Theater/ Movie Professionals', 'L2', 'Artist/Actor');
INSERT INTO `occupational_interest` VALUES (176, 'The Arts', 'The performing Arts Theater, Movies and Television Program, Theater/ Movie Professionals', 'L3', 'Film Maker');
INSERT INTO `occupational_interest` VALUES (177, 'The Arts', 'The performing Arts Theater, Movies and Television Program, Theater/ Movie Professionals', 'L4', 'Entertainer');
INSERT INTO `occupational_interest` VALUES (178, 'The Arts', 'Theater and Movie Support Staff', 'L5', 'Set Designer');
INSERT INTO `occupational_interest` VALUES (179, 'The Arts', 'Theater and Movie Support Staff', 'L6', 'Lights Designer');
INSERT INTO `occupational_interest` VALUES (180, 'The Arts', 'Theater and Movie Support Staff', 'L7', 'Costume Designer');
INSERT INTO `occupational_interest` VALUES (181, 'The Arts', 'Other Artistic Areas: Painting , Music and Literary Works', 'L8', 'Musical Composer or Arranger');
INSERT INTO `occupational_interest` VALUES (182, 'The Arts', 'Other Artistic Areas: Painting , Music and Literary Works', 'L9', 'Book Author');
INSERT INTO `occupational_interest` VALUES (183, 'The Arts', 'Other Artistic Areas: Painting , Music and Literary Works', 'L10', 'Water Color Painter');
INSERT INTO `occupational_interest` VALUES (184, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Garments, Liners, and Textile Industry', 'M1', 'Fashion Designer\\');
INSERT INTO `occupational_interest` VALUES (185, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Garments, Liners, and Textile Industry', 'M2', 'Master Cutter');
INSERT INTO `occupational_interest` VALUES (186, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Garments, Liners, and Textile Industry', 'M3', 'T-shirt Designer');
INSERT INTO `occupational_interest` VALUES (187, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M4', 'Silk Screen Maker');
INSERT INTO `occupational_interest` VALUES (188, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M5', 'Textile Technician');
INSERT INTO `occupational_interest` VALUES (189, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M6', 'Fabric Wholesaler');
INSERT INTO `occupational_interest` VALUES (190, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M7', 'Curtains/Beddings Sewer');
INSERT INTO `occupational_interest` VALUES (191, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Hairstyle, Cosmetics and other Parlor Services', 'M8', 'Make-up Artist');
INSERT INTO `occupational_interest` VALUES (192, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Hairstyle, Cosmetics and other Parlor Services', 'M9', 'Hair Style');
INSERT INTO `occupational_interest` VALUES (193, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Hairstyle, Cosmetics and other Parlor Services', 'M10', 'Hair Cutter');
INSERT INTO `occupational_interest` VALUES (194, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M11', 'Hair Spa Aide');
INSERT INTO `occupational_interest` VALUES (195, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M12', 'Manicurist');
INSERT INTO `occupational_interest` VALUES (196, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Jewelry and Fashion Accessories', 'M13', 'Jewelry Maker/Goldsmith');
INSERT INTO `occupational_interest` VALUES (197, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Jewelry and Fashion Accessories', 'M14', 'Beadworks Maker');
INSERT INTO `occupational_interest` VALUES (198, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M15', 'Shoe Maker');
INSERT INTO `occupational_interest` VALUES (199, 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'Fashion: Garments/ Hairstyle/ Cosmetics/ Parlor Services/ Jewelry and Accessories', 'M16', 'Bag Maker');
INSERT INTO `occupational_interest` VALUES (200, 'Military and Law Enforcement', 'Military Services', 'N1', 'Military Officer');
INSERT INTO `occupational_interest` VALUES (201, 'Military and Law Enforcement', 'Military Services', 'N2', 'Air Force Officer');
INSERT INTO `occupational_interest` VALUES (202, 'Military and Law Enforcement', 'Military Services', 'N3', 'Military Training Officer');
INSERT INTO `occupational_interest` VALUES (203, 'Military and Law Enforcement', 'Military Services', 'N4', 'Camp Strategist');
INSERT INTO `occupational_interest` VALUES (204, 'Military and Law Enforcement', 'Law Enforcement', 'N5', 'Police Officer');
INSERT INTO `occupational_interest` VALUES (205, 'Military and Law Enforcement', 'Military and Law Enforcement', 'N6', 'Prison Warden');
INSERT INTO `occupational_interest` VALUES (206, 'Military and Law Enforcement', 'Military and Law Enforcement', 'N7', 'Police Desk Officer');
INSERT INTO `occupational_interest` VALUES (207, 'Military and Law Enforcement', 'Military and Law Enforcement', 'N8', 'Investigator');
INSERT INTO `occupational_interest` VALUES (208, 'Military and Law Enforcement', 'Military and Law Enforcement', 'N9', 'Police Aide');
INSERT INTO `occupational_interest` VALUES (209, 'Military and Law Enforcement', 'Military and Law Enforcement', 'N10', 'Traffice Enfocer');
INSERT INTO `occupational_interest` VALUES (210, 'Military and Law Enforcement', 'Military and Law Enforcement', 'N11', 'Criminologist');
INSERT INTO `occupational_interest` VALUES (211, 'Military and Law Enforcement', 'Military and Law Enforcement', 'N12', 'Fingerprint Analyst');
INSERT INTO `occupational_interest` VALUES (212, 'Spiritual Vocation', 'Spiritual Vocation', 'O1', 'Priest/Pastor/Imam');
INSERT INTO `occupational_interest` VALUES (213, 'Spiritual Vocation', 'Spiritual Vocation', '02', 'Spiritual Counselor/Nun');
INSERT INTO `occupational_interest` VALUES (214, 'Spiritual Vocation', 'Spiritual Vocation', '03', 'Charity Worker');

-- ----------------------------
-- Table structure for performance_task
-- ----------------------------
DROP TABLE IF EXISTS `performance_task`;
CREATE TABLE `performance_task`  (
  `performance_task_id` int(11) NOT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `max_score` int(255) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `period` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`performance_task_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `subject_id`(`subject_id`) USING BTREE,
  CONSTRAINT `performance_task_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `performance_task_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for performance_task_result
-- ----------------------------
DROP TABLE IF EXISTS `performance_task_result`;
CREATE TABLE `performance_task_result`  (
  `performance_task_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`performance_task_result_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of performance_task_result
-- ----------------------------
INSERT INTO `performance_task_result` VALUES (1, 3, 5, '25');
INSERT INTO `performance_task_result` VALUES (2, 3, 1, '25');
INSERT INTO `performance_task_result` VALUES (3, 3, 2, '25');

-- ----------------------------
-- Table structure for performance_task_topic
-- ----------------------------
DROP TABLE IF EXISTS `performance_task_topic`;
CREATE TABLE `performance_task_topic`  (
  `performance_task_topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NULL DEFAULT NULL,
  `subject_id` int(11) NULL DEFAULT NULL,
  `topic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `max_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `period_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`performance_task_topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of performance_task_topic
-- ----------------------------
INSERT INTO `performance_task_topic` VALUES (1, 40, 2, 'Topic 1', '30', '20-03-01', 2);
INSERT INTO `performance_task_topic` VALUES (2, 40, 2, 'Topic 4', '20', '20-03-01', 2);
INSERT INTO `performance_task_topic` VALUES (3, 40, 2, 'Topic 1', '30', '20-03-01', 2);

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES (1, '1st Period');
INSERT INTO `period` VALUES (2, '2nd Period');
INSERT INTO `period` VALUES (3, '3rd Period');
INSERT INTO `period` VALUES (4, '4th Period');

-- ----------------------------
-- Table structure for period_setting
-- ----------------------------
DROP TABLE IF EXISTS `period_setting`;
CREATE TABLE `period_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `admin_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of period_setting
-- ----------------------------
INSERT INTO `period_setting` VALUES (1, 1, '2020-02-28 00:00:00', 1);
INSERT INTO `period_setting` VALUES (2, 2, '2020-02-28 00:00:00', 1);
INSERT INTO `period_setting` VALUES (3, 1, '2020-02-28 00:00:00', 1);
INSERT INTO `period_setting` VALUES (4, 2, '2020-02-28 00:00:00', 1);
INSERT INTO `period_setting` VALUES (5, 1, '2020-02-28 00:00:00', 1);
INSERT INTO `period_setting` VALUES (6, 1, '2020-02-28 00:00:00', 1);
INSERT INTO `period_setting` VALUES (7, 2, '2020-03-01 00:00:00', NULL);

-- ----------------------------
-- Table structure for quarterly_assessment
-- ----------------------------
DROP TABLE IF EXISTS `quarterly_assessment`;
CREATE TABLE `quarterly_assessment`  (
  `quarterly_assessment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `max_score` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `period` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`quarterly_assessment_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `subject_id`(`subject_id`) USING BTREE,
  CONSTRAINT `quarterly_assessment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quarterly_assessment_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for quarterly_assessment_result
-- ----------------------------
DROP TABLE IF EXISTS `quarterly_assessment_result`;
CREATE TABLE `quarterly_assessment_result`  (
  `quarterly_assessment_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`quarterly_assessment_result_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for quarterly_assessment_topic
-- ----------------------------
DROP TABLE IF EXISTS `quarterly_assessment_topic`;
CREATE TABLE `quarterly_assessment_topic`  (
  `quarterly_assessment_topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NULL DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `topic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `max_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `period_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`quarterly_assessment_topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quarterly_assessment_topic
-- ----------------------------
INSERT INTO `quarterly_assessment_topic` VALUES (1, 40, 2, 'Topic 4', '30', '20-03-01', 2);
INSERT INTO `quarterly_assessment_topic` VALUES (2, 40, 2, '12345', '30', '20-03-01', 2);

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_devs_id` int(11) NULL DEFAULT NULL,
  `no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`school_id`) USING BTREE,
  INDEX `admin_devs_id`(`admin_devs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, 3, '12363267', 'Digos City National High School', 'Rizal Avenue St., Digos City, Davao del Sur');
INSERT INTO `school` VALUES (2, 3, '1235', 'test', 'Lim del Rosario St., Digos City, Davao del Sur');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`  (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `adviser_id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `section` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`section_id`) USING BTREE,
  INDEX `school_id`(`school_id`) USING BTREE,
  INDEX `adviser_id`(`adviser_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES (40, 9, 24, 1, 7, 'Gumamela');
INSERT INTO `section` VALUES (43, 1, 28, 2, 9, 'Aquino');
INSERT INTO `section` VALUES (44, 1, 25, 1, 9, 'New Section');
INSERT INTO `section` VALUES (45, 1, 27, 1, 7, 'Another Section');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NULL DEFAULT NULL,
  `id_number` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sex` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `birthdate` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `school_id`(`school_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 1, '45923', 'Gabriel update', 'Nieve', 'Male', '2020-01-13', 7, 'Lim del Rosario St., Digos City');
INSERT INTO `student` VALUES (2, 1, '2345', 'Test', 'Nieve', 'Male', '2020-01-14', 9, 'Lim-Del Rosario Sts., Digos City, Davao del Sur');
INSERT INTO `student` VALUES (3, 1, '2352', 'new', 'new', 'Female', '2020-01-22', 9, 'Lim-Del Rosario Sts., Digos City, Davao del Sur');
INSERT INTO `student` VALUES (4, 1, '1436123', 'test', 'test', 'Male', '', 9, 'Lim-Del Rosario Sts., Digos City, Davao del Sur');
INSERT INTO `student` VALUES (5, 1, '745234', 'asfda', 'asfd', 'Female', '', 7, 'Lim del Rosario St., Digos City, Davao del Sur');

-- ----------------------------
-- Table structure for student_section
-- ----------------------------
DROP TABLE IF EXISTS `student_section`;
CREATE TABLE `student_section`  (
  `student_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `section_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`student_section_id`) USING BTREE,
  INDEX `section_id`(`section_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `student_section_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_section_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_section
-- ----------------------------
INSERT INTO `student_section` VALUES (1, 3, 43);
INSERT INTO `student_section` VALUES (2, 2, 40);
INSERT INTO `student_section` VALUES (3, 1, 40);
INSERT INTO `student_section` VALUES (4, 5, 40);
INSERT INTO `student_section` VALUES (5, 4, 43);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, 'EPP/TLE');
INSERT INTO `subject` VALUES (2, 'MAPEH');
INSERT INTO `subject` VALUES (3, 'Math');
INSERT INTO `subject` VALUES (4, 'Science');
INSERT INTO `subject` VALUES (5, 'EsP');
INSERT INTO `subject` VALUES (6, 'AP');
INSERT INTO `subject` VALUES (7, 'Language');

-- ----------------------------
-- Table structure for subject_teacher
-- ----------------------------
DROP TABLE IF EXISTS `subject_teacher`;
CREATE TABLE `subject_teacher`  (
  `subject_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_teacher_id`) USING BTREE,
  INDEX `section_id`(`section_id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  INDEX `subject_id`(`subject_id`) USING BTREE,
  CONSTRAINT `subject_teacher_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `subject_teacher_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `subject_teacher_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of subject_teacher
-- ----------------------------
INSERT INTO `subject_teacher` VALUES (11, 45, 28, 1);
INSERT INTO `subject_teacher` VALUES (12, 45, 24, 2);
INSERT INTO `subject_teacher` VALUES (13, 45, 27, 3);
INSERT INTO `subject_teacher` VALUES (14, 44, 25, 4);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `id_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sex` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `birthdate` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`, `admin_id`) USING BTREE,
  UNIQUE INDEX `id_number`(`id_number`) USING BTREE,
  INDEX `school_id`(`school_id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (24, 0, 1, 2, '45923', 'Nieve (Teacher)', 'Gabriel', 'Male', '10-10-1997', NULL);
INSERT INTO `teacher` VALUES (25, 0, 1, 4, '21352', 'Nieve III', 'Armando Emmanuel', 'Male', '2020-01-15', '');
INSERT INTO `teacher` VALUES (27, 0, 1, 3, '2352123', 'Blala', 'Miss Fernandez', 'Male', '2020-01-20', 'Lim-Del Rosario Sts., Digos City, Davao del Sur');
INSERT INTO `teacher` VALUES (28, 1, 1, 1, '2345', 'Nieve', 'Armando Gabriel IV', 'Male', '12351235', 'Lim del Rosario St., Digos City, Davao del Sur');

-- ----------------------------
-- Table structure for teacher_reg
-- ----------------------------
DROP TABLE IF EXISTS `teacher_reg`;
CREATE TABLE `teacher_reg`  (
  `teacher_reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`teacher_reg_id`) USING BTREE,
  UNIQUE INDEX `id_number`(`id_number`) USING BTREE,
  CONSTRAINT `teacher_reg_ibfk_1` FOREIGN KEY (`id_number`) REFERENCES `teacher` (`id_number`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_reg
-- ----------------------------
INSERT INTO `teacher_reg` VALUES (3, '45923', 'teacher', 'gnieve13@gmail.com', '$2y$10$jBBOhFcLsZLOgtcllZ/YmeMObHeRDzNRAQrEm8xcKqoelsEM9vG0q');
INSERT INTO `teacher_reg` VALUES (6, '21352', 'teacher', 'test@gmail.com', '$2y$10$VYiD9iVmVxuA/luq7YOrz.ay/ZlqmNIgHRwk9CJ2gGY601aoq2kLq');

-- ----------------------------
-- Table structure for written_work_result
-- ----------------------------
DROP TABLE IF EXISTS `written_work_result`;
CREATE TABLE `written_work_result`  (
  `written_work_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`written_work_result_id`) USING BTREE,
  INDEX `topic_id`(`topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of written_work_result
-- ----------------------------
INSERT INTO `written_work_result` VALUES (1, 2, 5, '25');
INSERT INTO `written_work_result` VALUES (2, 2, 1, '25');
INSERT INTO `written_work_result` VALUES (3, 2, 2, '25');
INSERT INTO `written_work_result` VALUES (4, 3, 5, '20');
INSERT INTO `written_work_result` VALUES (5, 3, 1, '20');
INSERT INTO `written_work_result` VALUES (6, 4, 2, '15');

-- ----------------------------
-- Table structure for written_work_topic
-- ----------------------------
DROP TABLE IF EXISTS `written_work_topic`;
CREATE TABLE `written_work_topic`  (
  `written_work_topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NULL DEFAULT NULL,
  `subject_id` int(11) NULL DEFAULT NULL,
  `topic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `max_score` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `period_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`written_work_topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of written_work_topic
-- ----------------------------
INSERT INTO `written_work_topic` VALUES (1, 40, 2, 'Topic 1', '30', '20-03-01', 2);
INSERT INTO `written_work_topic` VALUES (2, 40, 2, 'Topic 1', '30', '20-03-01', 2);
INSERT INTO `written_work_topic` VALUES (3, 40, 2, 'Topic 4', '50', '20-03-01', 2);

-- ----------------------------
-- View structure for vw_administrator
-- ----------------------------
DROP VIEW IF EXISTS `vw_administrator`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_administrator` AS SELECT
 administrator.admin_devs_id,
 administrator.administrator_id,
 administrator.firstname,
 administrator.lastname,
 concat(administrator.lastname,', ', administrator.firstname) as `admin_name`,
 administrator.sex,
 administrator.birthdate,
 administrator.address,
 administrator.school_id,
 administrator.email,
 administrator.`status`,
 school.address as `sch_address`,
 school.name as `sch_name`
  
FROM
	administrator
	INNER JOIN school ON administrator.school_id = school.school_id ;

-- ----------------------------
-- View structure for vw_administrator_login
-- ----------------------------
DROP VIEW IF EXISTS `vw_administrator_login`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_administrator_login` AS SELECT
	administrator_reg_id,
	administrator_reg.administrator_id,
	firstname,
	lastname,
	username,
	email,
	school_id,
	`password`
FROM
	administrator
	INNER JOIN administrator_reg ON administrator.administrator_id = administrator_reg.administrator_id ;

-- ----------------------------
-- View structure for vw_administrator_validation
-- ----------------------------
DROP VIEW IF EXISTS `vw_administrator_validation`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_administrator_validation` AS select * from administrator where administrator_id not in (select administrator_id from administrator_reg) ;

-- ----------------------------
-- View structure for vw_adviser
-- ----------------------------
DROP VIEW IF EXISTS `vw_adviser`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_adviser` AS SELECT
	section_id,
	section.school_id,
	adviser_id,
	section.classroom_id,
	level,
	section,
	classroom,
(select concat(lastname,', ',firstname) as `teacher_name` from teacher where teacher.teacher_id = adviser_id) as `teacher_name`

FROM
	section inner join classroom on section.classroom_id = classroom.classroom_id ;

-- ----------------------------
-- View structure for vw_adviser_select
-- ----------------------------
DROP VIEW IF EXISTS `vw_adviser_select`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_adviser_select` AS select
teacher.teacher_id,
teacher.school_id,
teacher.subject_id,
teacher.id_number,
teacher.firstname,
teacher.lastname,
concat(lastname, ', ', firstname) as `teacher_name`,
teacher.sex,
teacher.birthdate,
teacher.address,
subject.subject,
school.name
from teacher join subject on teacher.subject_id = subject.subject_id
join school on teacher.school_id = school.school_id 
where teacher.teacher_id not in (select adviser_id from section) ;

-- ----------------------------
-- View structure for vw_classroom
-- ----------------------------
DROP VIEW IF EXISTS `vw_classroom`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_classroom` AS SELECT
	`classroom`.`classroom_id` AS `classroom_id`,
	`classroom`.`school_id` AS `school_id`,
	`classroom`.`classroom` AS `classroom` ,
	school.name
FROM
	`classroom` inner join school on classroom.school_id = school.school_id ;

-- ----------------------------
-- View structure for vw_enkai
-- ----------------------------
DROP VIEW IF EXISTS `vw_enkai`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_enkai` AS SELECT
enkai.enkai_id,
enkai.student_id,
student.school_id,
enkai.gsa_score,
enkai.academic_score,
enkai.tvl_score,
enkai.sport_score,
enkai.arts_score,
enkai.first_choice,
enkai.occupational_interest,
student.lastname,
student.firstname,
CONCAT(lastname, ", ", firstname) AS student_name,
occupational_interest.description
FROM
enkai
INNER JOIN student ON enkai.student_id = student.student_id
INNER JOIN occupational_interest ON enkai.occupational_interest = occupational_interest.occupational_interest_id ;

-- ----------------------------
-- View structure for vw_get_ww_total
-- ----------------------------
DROP VIEW IF EXISTS `vw_get_ww_total`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_get_ww_total` AS select sum(max_score) as total from written_work_topic ;

-- ----------------------------
-- View structure for vw_guidance_reg
-- ----------------------------
DROP VIEW IF EXISTS `vw_guidance_reg`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_guidance_reg` AS SELECT
	guidance_reg_id,
	guidance_reg.id_number,
	username,
	email,
	`password`,
	guidance_id,
	guidance.school_id,
	lastname,
	firstname,
	sex,
	birthdate,
	address
FROM
	guidance_reg
	INNER JOIN guidance ON guidance_reg.id_number = guidance.id_number ;

-- ----------------------------
-- View structure for vw_performance_task_result
-- ----------------------------
DROP VIEW IF EXISTS `vw_performance_task_result`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_performance_task_result` AS SELECT
	performance_task_result_id,
	topic_id,
	performance_task_result.student_id,
	score,
	performance_task_topic_id,
	section_id,
	subject_id,
	topic,
	max_score,
	date,
	school_id,
	firstname,
	lastname,
	concat(lastname, ', ', firstname) as `student_name`,
	sex,
	birthdate,
	`level`,
	address
FROM
	performance_task_result
	INNER JOIN performance_task_topic ON performance_task_result.topic_id = performance_task_topic.performance_task_topic_id
	INNER JOIN student ON performance_task_result.student_id = student.student_id ;

-- ----------------------------
-- View structure for vw_performance_task_topic
-- ----------------------------
DROP VIEW IF EXISTS `vw_performance_task_topic`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_performance_task_topic` AS select * from performance_task_topic ;

-- ----------------------------
-- View structure for vw_performance_task_topic_select
-- ----------------------------
DROP VIEW IF EXISTS `vw_performance_task_topic_select`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_performance_task_topic_select` AS SELECT
	*,
	concat( lastname, ', ', firstname ) AS student_name ,
	(select section_id from student_section where student.student_id = student_id) as `section_id`
FROM
	student ;

-- ----------------------------
-- View structure for vw_period_updated
-- ----------------------------
DROP VIEW IF EXISTS `vw_period_updated`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_period_updated` AS select period_setting.id, period_id, period, date, admin_id from period_setting inner join period on period_setting.period_id = period.id order by id desc limit 1 ;

-- ----------------------------
-- View structure for vw_quarterly_assessment_result
-- ----------------------------
DROP VIEW IF EXISTS `vw_quarterly_assessment_result`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_quarterly_assessment_result` AS SELECT
	quarterly_assessment_result_id,
	topic_id,
	quarterly_assessment_result.student_id,
	score,
	quarterly_assessment_topic_id,
	section_id,
	subject_id,
	topic,
	max_score,
	date,
	school_id,
	firstname,
	lastname,
	concat(lastname, ', ', firstname) as `student_name`,
	sex,
	birthdate,
	`level`,
	address
FROM
	quarterly_assessment_result
	INNER JOIN quarterly_assessment_topic ON quarterly_assessment_result.topic_id = quarterly_assessment_topic.quarterly_assessment_topic_id
	INNER JOIN student ON quarterly_assessment_result.student_id = student.student_id ;

-- ----------------------------
-- View structure for vw_quarterly_assessment_topic
-- ----------------------------
DROP VIEW IF EXISTS `vw_quarterly_assessment_topic`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_quarterly_assessment_topic` AS select * from quarterly_assessment_topic ;

-- ----------------------------
-- View structure for vw_quarterly_assessment_topic_select
-- ----------------------------
DROP VIEW IF EXISTS `vw_quarterly_assessment_topic_select`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_quarterly_assessment_topic_select` AS SELECT
	*,
	concat( lastname, ', ', firstname ) AS student_name ,
	(select section_id from student_section where student.student_id = student_id) as `section_id`
FROM
	student ;

-- ----------------------------
-- View structure for vw_school
-- ----------------------------
DROP VIEW IF EXISTS `vw_school`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_school` AS SELECT * FROM  school ;

-- ----------------------------
-- View structure for vw_section
-- ----------------------------
DROP VIEW IF EXISTS `vw_section`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_section` AS select
section.section_id,
section.school_id,
section.adviser_id,
section.classroom_id,
section.level,
section.section,
classroom.classroom,
school.name,
teacher.firstname,
teacher.lastname,
concat(teacher.lastname, ', ', teacher.firstname) as `adviser`

from section join classroom on section.classroom_id = classroom.classroom_id
join teacher on section.adviser_id = teacher.teacher_id
join school on section.school_id = school.school_id ;

-- ----------------------------
-- View structure for vw_student
-- ----------------------------
DROP VIEW IF EXISTS `vw_student`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student` AS SELECT
	student_id,
	school_id,
	id_number,
	firstname,
	lastname,
	sex,
	birthdate,
	`level`,
	address,
	concat( lastname, ', ', firstname ) AS `student_name` 
FROM
	student ;

-- ----------------------------
-- View structure for vw_student_pt
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_pt`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student_pt` AS SELECT
	student_id,
	firstname,
	lastname,
	concat(lastname,", ", firstname) as `student_name`,
	ifnull((select sum(score) from performance_task where student_id = student.student_id),0) as `score`,
	ifnull((select sum(max_score) from performance_task where student_id = student.student_id),0) as `max_score`
FROM
	student ;

-- ----------------------------
-- View structure for vw_student_qa
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_qa`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student_qa` AS SELECT
	student_id,
	firstname,
	lastname,
	concat(lastname,", ", firstname) as `student_name`,
	ifnull((select sum(score) from quarterly_assessment where student_id = student.student_id),0) as `score`,
	ifnull((select sum(max_score) from quarterly_assessment where student_id = student.student_id),0) as `max_score`
FROM
	student ;

-- ----------------------------
-- View structure for vw_student_section
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_section`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student_section` AS SELECT
	student_section.student_section_id,
	student_section.section_id,
	student_section.student_id,
	student.firstname,
	student.lastname,
	student.`level`,
	student.`sex`,
	student.school_id,
	concat( lastname, ', ', firstname ) AS `student_name`,
	section,
	adviser_id 
FROM
	student_section
	INNER JOIN student ON student_section.student_id = student.student_id
	INNER JOIN section ON student_section.section_id = section.section_id ;

-- ----------------------------
-- View structure for vw_student_select
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_select`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student_select` AS SELECT
	`student_id`,
	`school_id`,
	`id_number`,
	`firstname`,
	`lastname`,
	`sex`,
	`birthdate`,
  `level`,
	`address`,
	concat(lastname, ', ',firstname) as student_name
FROM
	student 
WHERE
	student_id NOT IN ( SELECT student_id FROM student_section ) ;

-- ----------------------------
-- View structure for vw_student_selection
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_selection`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student_selection` AS SELECT
	student_section.student_id, 
	section.school_id,
	student.id_number,
	firstname,
	lastname,
	sex,
	birthdate,
	student.`level`,
	address,
	concat(student.lastname, ', ', student.firstname) as student_name,
	section,
	adviser_id
	
FROM
	student_section
	INNER JOIN student ON student_section.student_id = student.student_id
	INNER JOIN section ON student_section.section_id = section.section_id ;

-- ----------------------------
-- View structure for vw_subject
-- ----------------------------
DROP VIEW IF EXISTS `vw_subject`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_subject` AS SELECT
	`subject`.`subject_id` AS `subject_id`,
	`subject`.`subject` AS `subject` 
FROM
	`subject` ;

-- ----------------------------
-- View structure for vw_subject_select
-- ----------------------------
DROP VIEW IF EXISTS `vw_subject_select`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_subject_select` AS SELECT
	`subject`.`subject_id` AS `subject_id`,
	`subject`.`subject` AS `subject` 
FROM
	`subject` where subject_id not in (select subject_id from subject_teacher) ;

-- ----------------------------
-- View structure for vw_subject_teacher
-- ----------------------------
DROP VIEW IF EXISTS `vw_subject_teacher`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_subject_teacher` AS SELECT
	subject_teacher.subject_teacher_id,
	subject_teacher.section_id,
	subject_teacher.teacher_id,
	section.school_id,
	section.classroom_id,
	section.level,
	section.section,
	section.adviser_id,
	classroom.classroom,
	teacher.firstname,
	teacher.lastname,
	teacher.sex,
	concat(lastname,", ", firstname) as `teacher_name`,
	teacher.subject_id,
	subject,
	(select concat(lastname, ", ", firstname) from teacher where teacher_id = section.adviser_id) as `adviser_name`
FROM
	subject_teacher
	INNER JOIN section ON subject_teacher.section_id = section.section_id
	inner join classroom on section.classroom_id = classroom.classroom_id
	inner join teacher on subject_teacher.teacher_id = teacher.teacher_id 
	inner join subject on teacher.subject_id = subject.subject_id ;

-- ----------------------------
-- View structure for vw_teacher
-- ----------------------------
DROP VIEW IF EXISTS `vw_teacher`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_teacher` AS select
teacher.teacher_id,
teacher.school_id,
teacher.subject_id,
teacher.id_number,
teacher.firstname,
teacher.lastname,
concat(lastname, ', ', firstname) as `teacher_name`,
teacher.sex,
teacher.birthdate,
teacher.address,
subject.subject,
school.name
from teacher join subject on teacher.subject_id = subject.subject_id
join school on teacher.school_id = school.school_id ;

-- ----------------------------
-- View structure for vw_teacher_reg
-- ----------------------------
DROP VIEW IF EXISTS `vw_teacher_reg`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_teacher_reg` AS SELECT
	teacher_reg_id,
	teacher_reg.id_number,
	username,
	email,
	`password`,
	teacher_id,
	teacher.school_id,
	subject_id,
	lastname,
	firstname,
	sex,
	birthdate,
	address,
	(select adviser_id from section where adviser_id = teacher.teacher_id) as `adviser_id`
FROM
	teacher_reg
	INNER JOIN teacher ON teacher_reg.id_number = teacher.id_number ;

-- ----------------------------
-- View structure for vw_updated_period
-- ----------------------------
DROP VIEW IF EXISTS `vw_updated_period`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_updated_period` AS select * from period_setting  ORDER BY period_setting.id DESC limit 1 ;

-- ----------------------------
-- View structure for vw_written_work_result
-- ----------------------------
DROP VIEW IF EXISTS `vw_written_work_result`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_written_work_result` AS SELECT
	written_work_result_id,
	topic_id,
	written_work_result.student_id,
	score,
	written_work_topic_id,
	section_id,
	subject_id,
	topic,
	max_score,
	date,
	school_id,
	firstname,
	lastname,
	concat(lastname, ', ', firstname) as `student_name`,
	sex,
	birthdate,
	`level`,
	address
FROM
	written_work_result
	INNER JOIN written_work_topic ON written_work_result.topic_id = written_work_topic.written_work_topic_id
	INNER JOIN student ON written_work_result.student_id = student.student_id ;

-- ----------------------------
-- View structure for vw_written_work_topic
-- ----------------------------
DROP VIEW IF EXISTS `vw_written_work_topic`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_written_work_topic` AS select * from written_work_topic ;

-- ----------------------------
-- View structure for vw_written_work_topic_select
-- ----------------------------
DROP VIEW IF EXISTS `vw_written_work_topic_select`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_written_work_topic_select` AS SELECT
	*,
	concat( lastname, ', ', firstname ) AS student_name ,
	(select section_id from student_section where student.student_id = student_id) as `section_id`
FROM
	student ;

-- ----------------------------
-- View structure for vw_ww_get_student_total
-- ----------------------------
DROP VIEW IF EXISTS `vw_ww_get_student_total`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `vw_ww_get_student_total` AS SELECT
	sum(score) as student_score
FROM
	written_work_result 
WHERE
	topic_id IN ( SELECT written_work_topic_id FROM written_work_topic ) ;

SET FOREIGN_KEY_CHECKS = 1;
