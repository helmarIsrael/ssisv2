-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.25 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for student_database
CREATE DATABASE IF NOT EXISTS `student_database` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student_database`;

-- Dumping structure for table student_database.course
CREATE TABLE IF NOT EXISTS `course` (
  `Course Code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Course` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`Course Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table student_database.course: ~4 rows (approximately)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
REPLACE INTO `course` (`Course Code`, `Course`) VALUES
	('BSCA', 'BS in Computer Application'),
	('BSCS', 'BS in Computer Science'),
	('BSIS', 'BS in Information Systems'),
	('BSIT', 'BS in Information Technology');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- Dumping structure for table student_database.student_info
CREATE TABLE IF NOT EXISTS `student_info` (
  `Student ID` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Year Level` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Course` varchar(50) DEFAULT NULL,
  KEY `FK_student_info_course` (`Course`),
  CONSTRAINT `FK_student_info_course` FOREIGN KEY (`Course`) REFERENCES `course` (`Course Code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table student_database.student_info: ~50 rows (approximately)
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
REPLACE INTO `student_info` (`Student ID`, `Name`, `Year Level`, `Gender`, `Course`) VALUES
	('2020-1002', 'LOL R. asd', '1', 'M', 'BSCS'),
	('2020-1003', 'Mar R. Lo', '1', 'm', 'BSCA'),
	('2020-1004', 'Joal M. Adas', '1', 'M', 'BSCA'),
	('2020-1005', 'Asad G. Vase', '1', 'M', 'BSCS'),
	('2020-1006', 'Lorf O. Poda', '1', 'F', 'BSCS'),
	('2020-1007', 'Isoa P. Qker', '1', 'M', 'BSCS'),
	('2020-1008', 'Oppa I. Mafs', '1', 'F', 'BSCS'),
	('2020-1009', 'Fgee L. Dafs', '1', 'F', 'BSCS'),
	('2020-1010', 'Ialc S. Geqe', '1', 'M', 'BSCS'),
	('2020-1011', 'Mlla T. Fzzx', '1', 'F', 'BSCS'),
	('2020-1012', 'Ofmald T. Aczas', '1', 'M', 'BSCS'),
	('2020-1013', 'Seeasl N. Illas', '1', 'M', 'BSCS'),
	('2020-1014', 'Acccs P. Rtees', '1', 'F', 'BSCS'),
	('2020-1015', 'Dopos J. Awits', '1', 'F', 'BSCS'),
	('2020-1016', 'Lamfz R. Sod', '1', 'F', 'BSIS'),
	('2020-1017', 'Leeer M. Kills', '1', 'M', 'BSIS'),
	('2020-1018', 'Pssol C. Tras', '1', 'F', 'BSIT'),
	('2020-1019', 'Rlssa S. Plqqas', '1', 'M', 'BSIT'),
	('2020-1020', 'Teas L. Tris', '1', 'M', 'BSIT'),
	('2020-1021', 'Polot A. Amnbas', '1', 'F', 'BSIT'),
	('2020-1022', 'Tars T. Noods', '1', 'F', 'BSCA'),
	('2020-1023', 'Poord Y. Konks', '1', 'F', 'BSIT'),
	('2020-1024', 'Llard K. Stonms', '1', 'M', 'BSCS'),
	('2020-1025', 'Ioasi L. Pppl', '1', 'F', 'BSCS'),
	('2020-1026', 'Bvvxc P. Zzza', '1', 'F', 'BSCS'),
	('2020-1027', 'Locc S. Rod', '1', 'M', 'BSCS'),
	('2020-1028', 'Kaos E. Pard', '1', 'F', 'BSCS'),
	('2020-1029', 'Levei R. Meer', '1', 'M', 'BSCS'),
	('2020-1030', 'Hero S. Daaz', '1', 'M', 'BSCS'),
	('2020-1031', 'Korasl W. Jsoos', '1', 'F', 'BSCS'),
	('2020-1032', 'Pisak J. Xedns', '1', 'M', 'BSCS'),
	('2020-1033', 'Uhksa P. Loops', '1', 'M', 'BSCS'),
	('2020-1034', 'Mxaxc N. Ytter', '1', 'M', 'BSCS'),
	('2020-1035', 'Gyeads L. Erer', '1', 'F', 'BSCS'),
	('2020-1036', 'Purt I. Bccca', '1', 'M', 'BSCS'),
	('2020-1037', 'Ookal Q. Nadn', '1', 'M', 'BSCS'),
	('2020-1038', 'Josca Y. Boow', '1', 'F', 'BSCS'),
	('2020-1039', 'Klias M. Mdaoa', '1', 'M', 'BSCA'),
	('2020-1040', 'Ityrt C. Zdaf', '1', 'F', 'BSCA'),
	('2020-1041', 'Maras L. Kesas', '1', 'M', 'BSCA'),
	('2020-1042', 'Barlts H. Caazz', '1', 'M', 'BSCA'),
	('2020-1043', 'Pars L. Deees', '1', 'M', 'BSCA'),
	('2020-1044', 'Riot L. Miisss', '1', 'M', 'BSCA'),
	('2020-1045', 'Leet L. Orsa', '1', 'M', 'BSCA'),
	('2020-1046', 'Leers P. Zeena', '1', 'F', 'BSCA'),
	('2020-1047', 'Mdas Z. Loars', '1', 'F', 'BSCA'),
	('2020-1048', 'Helmar R. Israel', '1', 'F', 'BSCA'),
	('2020-1049', 'Equals M. Loars', '1', 'F', 'BSCA'),
	('2020-1050', 'Freos T. Loys', '1', 'F', 'BSCA'),
	('2020-1001', 'Marmarmar', '3', 'M', 'BSCS');
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
