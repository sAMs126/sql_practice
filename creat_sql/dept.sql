/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : new_coder

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 27/05/2019 16:34:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_emp
-- ----------------------------
DROP TABLE IF EXISTS `dept_emp`;
CREATE TABLE `dept_emp`  (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept_emp
-- ----------------------------
INSERT INTO `dept_emp` VALUES (10001, 'd001', '1986-06-26', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10002, 'd001', '1996-08-03', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10003, 'd004', '1995-12-03', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10004, 'd004', '1986-12-01', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10005, 'd003', '1989-09-12', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10006, 'd002', '1990-08-05', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10007, 'd005', '1989-02-10', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10008, 'd005', '1998-03-11', '2000-07-31');
INSERT INTO `dept_emp` VALUES (10009, 'd006', '1985-02-18', '9999-01-01');
INSERT INTO `dept_emp` VALUES (10010, 'd005', '1996-11-24', '2000-06-26');
INSERT INTO `dept_emp` VALUES (10010, 'd006', '2000-06-26', '9999-01-01');

-- ----------------------------
-- Table structure for dept_manager
-- ----------------------------
DROP TABLE IF EXISTS `dept_manager`;
CREATE TABLE `dept_manager`  (
  `dept_no` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_no` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept_manager
-- ----------------------------
INSERT INTO `dept_manager` VALUES ('d001', 10002, '1996-08-03', '9999-01-01');
INSERT INTO `dept_manager` VALUES ('d004', 10004, '1986-12-01', '9999-01-01');
INSERT INTO `dept_manager` VALUES ('d003', 10005, '1989-09-12', '9999-01-01');
INSERT INTO `dept_manager` VALUES ('d002', 10006, '1990-08-05', '9999-01-01');
INSERT INTO `dept_manager` VALUES ('d005', 10010, '1996-11-24', '2000-06-26');
INSERT INTO `dept_manager` VALUES ('d006', 10010, '2000-06-26', '9999-01-01');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');
INSERT INTO `employees` VALUES (10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21');
INSERT INTO `employees` VALUES (10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28');
INSERT INTO `employees` VALUES (10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01');
INSERT INTO `employees` VALUES (10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12');
INSERT INTO `employees` VALUES (10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1989-06-02');
INSERT INTO `employees` VALUES (10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', '1989-02-10');
INSERT INTO `employees` VALUES (10008, '1958-02-19', 'Saniya', 'Kalloufi', 'M', '1994-09-15');
INSERT INTO `employees` VALUES (10009, '1952-04-19', 'Sumant', 'Peac', 'F', '1985-02-18');
INSERT INTO `employees` VALUES (10010, '1963-06-01', 'Duangkaew', 'Piveteau', 'F', '1989-08-24');
INSERT INTO `employees` VALUES (10011, '1953-11-07', 'Mary', 'Sluis', 'F', '1990-01-22');

-- ----------------------------
-- Table structure for salaries
-- ----------------------------
DROP TABLE IF EXISTS `salaries`;
CREATE TABLE `salaries`  (
  `emp_no` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`, `from_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of salaries
-- ----------------------------
INSERT INTO `salaries` VALUES (10001, 60117, '1986-06-26', '1987-06-26');
INSERT INTO `salaries` VALUES (10001, 62102, '1987-06-26', '1988-06-25');
INSERT INTO `salaries` VALUES (10001, 66074, '1988-06-25', '1989-06-25');
INSERT INTO `salaries` VALUES (10001, 66596, '1989-06-25', '1990-06-25');
INSERT INTO `salaries` VALUES (10001, 66961, '1990-06-25', '1991-06-25');
INSERT INTO `salaries` VALUES (10001, 71046, '1991-06-25', '1992-06-24');
INSERT INTO `salaries` VALUES (10001, 74333, '1992-06-24', '1993-06-24');
INSERT INTO `salaries` VALUES (10001, 75286, '1993-06-24', '1994-06-24');
INSERT INTO `salaries` VALUES (10001, 75994, '1994-06-24', '1995-06-24');
INSERT INTO `salaries` VALUES (10001, 76884, '1995-06-24', '1996-06-23');
INSERT INTO `salaries` VALUES (10001, 80013, '1996-06-23', '1997-06-23');
INSERT INTO `salaries` VALUES (10001, 81025, '1997-06-23', '1998-06-23');
INSERT INTO `salaries` VALUES (10001, 81097, '1998-06-23', '1999-06-23');
INSERT INTO `salaries` VALUES (10001, 84917, '1999-06-23', '2000-06-22');
INSERT INTO `salaries` VALUES (10001, 85112, '2000-06-22', '2001-06-22');
INSERT INTO `salaries` VALUES (10001, 85097, '2001-06-22', '2002-06-22');
INSERT INTO `salaries` VALUES (10001, 88958, '2002-06-22', '9999-01-01');
INSERT INTO `salaries` VALUES (10002, 72527, '1996-08-03', '1997-08-03');
INSERT INTO `salaries` VALUES (10002, 72527, '1997-08-03', '1998-08-03');
INSERT INTO `salaries` VALUES (10002, 72527, '1998-08-03', '1999-08-03');
INSERT INTO `salaries` VALUES (10002, 72527, '1999-08-03', '2000-08-02');
INSERT INTO `salaries` VALUES (10002, 72527, '2000-08-02', '2001-08-02');
INSERT INTO `salaries` VALUES (10002, 72527, '2001-08-02', '9999-01-01');
INSERT INTO `salaries` VALUES (10003, 40006, '1995-12-03', '1996-12-02');
INSERT INTO `salaries` VALUES (10003, 43616, '1996-12-02', '1997-12-02');
INSERT INTO `salaries` VALUES (10003, 43466, '1997-12-02', '1998-12-02');
INSERT INTO `salaries` VALUES (10003, 43636, '1998-12-02', '1999-12-02');
INSERT INTO `salaries` VALUES (10003, 43478, '1999-12-02', '2000-12-01');
INSERT INTO `salaries` VALUES (10003, 43699, '2000-12-01', '2001-12-01');
INSERT INTO `salaries` VALUES (10003, 43311, '2001-12-01', '9999-01-01');
INSERT INTO `salaries` VALUES (10004, 40054, '1986-12-01', '1987-12-01');
INSERT INTO `salaries` VALUES (10004, 42283, '1987-12-01', '1988-11-30');
INSERT INTO `salaries` VALUES (10004, 42542, '1988-11-30', '1989-11-30');
INSERT INTO `salaries` VALUES (10004, 46065, '1989-11-30', '1990-11-30');
INSERT INTO `salaries` VALUES (10004, 48271, '1990-11-30', '1991-11-30');
INSERT INTO `salaries` VALUES (10004, 50594, '1991-11-30', '1992-11-29');
INSERT INTO `salaries` VALUES (10004, 52119, '1992-11-29', '1993-11-29');
INSERT INTO `salaries` VALUES (10004, 54693, '1993-11-29', '1994-11-29');
INSERT INTO `salaries` VALUES (10004, 58326, '1994-11-29', '1995-11-29');
INSERT INTO `salaries` VALUES (10004, 60770, '1995-11-29', '1996-11-28');
INSERT INTO `salaries` VALUES (10004, 62566, '1996-11-28', '1997-11-28');
INSERT INTO `salaries` VALUES (10004, 64340, '1997-11-28', '1998-11-28');
INSERT INTO `salaries` VALUES (10004, 67096, '1998-11-28', '1999-11-28');
INSERT INTO `salaries` VALUES (10004, 69722, '1999-11-28', '2000-11-27');
INSERT INTO `salaries` VALUES (10004, 70698, '2000-11-27', '2001-11-27');
INSERT INTO `salaries` VALUES (10004, 74057, '2001-11-27', '9999-01-01');
INSERT INTO `salaries` VALUES (10005, 78228, '1989-09-12', '1990-09-12');
INSERT INTO `salaries` VALUES (10005, 82621, '1990-09-12', '1991-09-12');
INSERT INTO `salaries` VALUES (10005, 83735, '1991-09-12', '1992-09-11');
INSERT INTO `salaries` VALUES (10005, 85572, '1992-09-11', '1993-09-11');
INSERT INTO `salaries` VALUES (10005, 85076, '1993-09-11', '1994-09-11');
INSERT INTO `salaries` VALUES (10005, 86050, '1994-09-11', '1995-09-11');
INSERT INTO `salaries` VALUES (10005, 88448, '1995-09-11', '1996-09-10');
INSERT INTO `salaries` VALUES (10005, 88063, '1996-09-10', '1997-09-10');
INSERT INTO `salaries` VALUES (10005, 89724, '1997-09-10', '1998-09-10');
INSERT INTO `salaries` VALUES (10005, 90392, '1998-09-10', '1999-09-10');
INSERT INTO `salaries` VALUES (10005, 90531, '1999-09-10', '2000-09-09');
INSERT INTO `salaries` VALUES (10005, 91453, '2000-09-09', '2001-09-09');
INSERT INTO `salaries` VALUES (10005, 94692, '2001-09-09', '9999-01-01');
INSERT INTO `salaries` VALUES (10006, 43311, '1990-08-05', '1991-08-05');
INSERT INTO `salaries` VALUES (10006, 43311, '1991-08-05', '1992-08-04');
INSERT INTO `salaries` VALUES (10006, 43311, '1992-08-04', '1993-08-04');
INSERT INTO `salaries` VALUES (10006, 43311, '1993-08-04', '1994-08-04');
INSERT INTO `salaries` VALUES (10006, 43311, '1994-08-04', '1995-08-04');
INSERT INTO `salaries` VALUES (10006, 43311, '1995-08-04', '1996-08-03');
INSERT INTO `salaries` VALUES (10006, 43311, '1996-08-03', '1997-08-03');
INSERT INTO `salaries` VALUES (10006, 43311, '1997-08-03', '1998-08-03');
INSERT INTO `salaries` VALUES (10006, 43311, '1998-08-03', '1999-08-03');
INSERT INTO `salaries` VALUES (10006, 43311, '1999-08-03', '2000-08-02');
INSERT INTO `salaries` VALUES (10006, 43311, '2000-08-02', '2001-08-02');
INSERT INTO `salaries` VALUES (10006, 43311, '2001-08-02', '9999-01-01');
INSERT INTO `salaries` VALUES (10007, 56724, '1989-02-10', '1990-02-10');
INSERT INTO `salaries` VALUES (10007, 60740, '1990-02-10', '1991-02-10');
INSERT INTO `salaries` VALUES (10007, 62745, '1991-02-10', '1992-02-10');
INSERT INTO `salaries` VALUES (10007, 63475, '1992-02-10', '1993-02-09');
INSERT INTO `salaries` VALUES (10007, 63208, '1993-02-09', '1994-02-09');
INSERT INTO `salaries` VALUES (10007, 64563, '1994-02-09', '1995-02-09');
INSERT INTO `salaries` VALUES (10007, 68833, '1995-02-09', '1996-02-09');
INSERT INTO `salaries` VALUES (10007, 70220, '1996-02-09', '1997-02-08');
INSERT INTO `salaries` VALUES (10007, 73362, '1997-02-08', '1998-02-08');
INSERT INTO `salaries` VALUES (10007, 75582, '1998-02-08', '1999-02-08');
INSERT INTO `salaries` VALUES (10007, 79513, '1999-02-08', '2000-02-08');
INSERT INTO `salaries` VALUES (10007, 80083, '2000-02-08', '2001-02-07');
INSERT INTO `salaries` VALUES (10007, 84456, '2001-02-07', '2002-02-07');
INSERT INTO `salaries` VALUES (10007, 88070, '2002-02-07', '9999-01-01');
INSERT INTO `salaries` VALUES (10008, 46671, '1998-03-11', '1999-03-11');
INSERT INTO `salaries` VALUES (10008, 48584, '1999-03-11', '2000-03-10');
INSERT INTO `salaries` VALUES (10008, 52668, '2000-03-10', '2000-07-31');
INSERT INTO `salaries` VALUES (10009, 60929, '1985-02-18', '1986-02-18');
INSERT INTO `salaries` VALUES (10009, 64604, '1986-02-18', '1987-02-18');
INSERT INTO `salaries` VALUES (10009, 64780, '1987-02-18', '1988-02-18');
INSERT INTO `salaries` VALUES (10009, 66302, '1988-02-18', '1989-02-17');
INSERT INTO `salaries` VALUES (10009, 69042, '1989-02-17', '1990-02-17');
INSERT INTO `salaries` VALUES (10009, 70889, '1990-02-17', '1991-02-17');
INSERT INTO `salaries` VALUES (10009, 71434, '1991-02-17', '1992-02-17');
INSERT INTO `salaries` VALUES (10009, 74612, '1992-02-17', '1993-02-16');
INSERT INTO `salaries` VALUES (10009, 76518, '1993-02-16', '1994-02-16');
INSERT INTO `salaries` VALUES (10009, 78335, '1994-02-16', '1995-02-16');
INSERT INTO `salaries` VALUES (10009, 80944, '1995-02-16', '1996-02-16');
INSERT INTO `salaries` VALUES (10009, 82507, '1996-02-16', '1997-02-15');
INSERT INTO `salaries` VALUES (10009, 85875, '1997-02-15', '1998-02-15');
INSERT INTO `salaries` VALUES (10009, 89324, '1998-02-15', '1999-02-15');
INSERT INTO `salaries` VALUES (10009, 90668, '1999-02-15', '2000-02-15');
INSERT INTO `salaries` VALUES (10009, 93507, '2000-02-15', '2001-02-14');
INSERT INTO `salaries` VALUES (10009, 94443, '2001-02-14', '2002-02-14');

SET FOREIGN_KEY_CHECKS = 1;
