CREATE DATABASE `getjob` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `users` (
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `getjobs_groups` (
  `getjobs_group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  `group_leader` varchar(45) NOT NULL,
  `group_description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`getjobs_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 CREATE TABLE `getjob_users` (
  `getjob_usersid` int unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(45) NOT NULL,
  `user_fname` varchar(45) NOT NULL,
  `user_lname` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  `user_education` varchar(300) DEFAULT NULL,
  `user_description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`getjob_usersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `getjob_employers` (
  `idgetjob_employers` int NOT NULL AUTO_INCREMENT,
  `employer_name` varchar(45) NOT NULL,
  `employer_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idgetjob_employers`),
  UNIQUE KEY `idgetjob_employers_UNIQUE` (`idgetjob_employers`),
  UNIQUE KEY `employer_name_UNIQUE` (`employer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `jobs` (
  `idjobs` int NOT NULL AUTO_INCREMENT,
  `job_title` varchar(45) NOT NULL,
  `job_expdate` varchar(45) NOT NULL,
  `job_salary` varchar(45) DEFAULT NULL,
  `job_employer` varchar(45) NOT NULL,
  `job_description` varchar(10000) DEFAULT NULL,
  `job_type` varchar(45) NOT NULL,
  PRIMARY KEY (`idjobs`),
  UNIQUE KEY `idjobs_UNIQUE` (`idjobs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
