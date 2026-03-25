CREATE DATABASE  IF NOT EXISTS `projemp`;
USE `projemp`;

DROP TABLE IF EXISTS `works`;
DROP TABLE IF EXISTS `emp`;
DROP TABLE IF EXISTS `dept`;
DROP TABLE IF EXISTS `proj`;


--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `dno` char(3) NOT NULL,
  `dname` char(15) DEFAULT NULL,
  `location` char(15) DEFAULT NULL,
  PRIMARY KEY (`dno`)
);

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dno`, `dname`, `location`) VALUES
('d1','information','newry'),
('d2','service','belfast'),
('d3','engineering','belfast'),
('d4','personnel','belfast');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE IF NOT EXISTS `emp` (
  `eno` char(3) NOT NULL,
  `ename` char(15) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  `supno` char(3) DEFAULT NULL,
  `dno` char(3) NOT NULL,
  PRIMARY KEY (`eno`)
);

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`eno`, `ename`, `salary`, `age`, `supno`, `dno`) VALUES
('e1','armstrong',50000,56,NULL,'d1'),
('e10','jones',48000,49,'e1','d3'),
('e11','kelly',28000,36,'e7','d2'),
('e12','mccoy',33000,29,'e3','d2'),
('e13','neeson',48000,36,'e19','d1'),
('e14','oliver',26000,35,'e17','d3'),
('e15','pearse',20000,28,'e21','d1'),
('e16','quinn',33000,54,'e2','d1'),
('e17','roberts',21000,27,'e4','d3'),
('e18','smyth',33000,34,'e21','d3'),
('e19','trainor',35000,39,'e7','d1'),
('e2','breen',17000,21,'e4','d3'),
('e20','urquhart',19000,22,'e11','d3'),
('e21','vance',15000,19,'e10','d1'),
('e3','carroll',18000,31,'e10','d3'),
('e4','deehan',50000,48,'e1','d1'),
('e5','evans',38000,45,'e11','d1'),
('e6','flynn',24000,30,'e17','d2'),
('e7','greer',16000,24,'e1','d2'),
('e8','hamill',25000,38,'e3','d1'),
('e9','irwin',23000,48,'e2','d2');

-- --------------------------------------------------------

--
-- Table structure for table `proj`
--

CREATE TABLE IF NOT EXISTS `proj` (
  `pno` char(3) NOT NULL,
  `pname` char(15) DEFAULT NULL,
  `ptype` char(15) DEFAULT NULL,
  `budget` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`pno`)
);

--
-- Dumping data for table `proj`
--

INSERT INTO `proj` (`pno`, `pname`, `ptype`, `budget`) VALUES
('p13','payroll','access',520000),
('p15','database','access',540000),
('p19','graphics','c',650000),
('p23','registration','access',790000),
('p26','examination','c',690000),
('p31','warehouse','php',30000);

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE IF NOT EXISTS `works` (
  `eno` char(3) NOT NULL,
  `pno` char(3) NOT NULL,
  `role` char(15) DEFAULT NULL,
  `duration` tinyint DEFAULT NULL,
  PRIMARY KEY (`eno`,`pno`)
);

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`eno`, `pno`, `role`, `duration`) VALUES
('e1','p19','consultant',6),
('e1','p23','consultant',6),
('e10','p15','manager',4),
('e11','p19','administrator',10),
('e12','p23','consultant',6),
('e12','p26','administrator',8),
('e13','p23','manager',12),
('e14','p23','engineer',8),
('e14','p26','analyst',5),
('e15','p13','programmer',7),
('e15','p19','programmer',8),
('e15','p23','programmer',4),
('e16','p19','manager',6),
('e16','p23','manager',10),
('e17','p13','analyst',8),
('e17','p19','programmer',4),
('e18','p13','consultant',6),
('e18','p23','analyst',5),
('e18','p26','consultant',8),
('e19','p15','analyst',9),
('e19','p19','consultant',5),
('e2','p15','engineer',6),
('e20','p15','engineer',8),
('e20','p19','engineer',6),
('e21','p13','programmer',8),
('e21','p23','programmer',7),
('e21','p26','programmer',10),
('e3','p19','programmer',8),
('e3','p26','engineer',4),
('e4','p26','manager',6),
('e5','p13','manager',11),
('e6','p19','consultant',9),
('e6','p26','analyst',5),
('e7','p13','administrator',8),
('e7','p15','administrator',7),
('e8','p13','programmer',12),
('e8','p23','analyst',4),
('e9','p13','programmer',6),
('e9','p19','consultant',9);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `dept` (`dno`);

--
-- Constraints for table `works`
--
ALTER TABLE `works`
  ADD CONSTRAINT `works_ibfk_1` FOREIGN KEY (`eno`) REFERENCES `emp` (`eno`),
  ADD CONSTRAINT `works_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `proj` (`pno`);


