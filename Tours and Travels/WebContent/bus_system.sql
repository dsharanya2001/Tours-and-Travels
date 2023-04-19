
CREATE TABLE `ADMIN` (
  `ADMIN_ID` varchar(10) PRIMARY KEY,
  `ADMIN_NAME` varchar(50),
  `ADMIN_PWD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `ADMIN` (`ADMIN_ID`, `ADMIN_NAME`, `ADMIN_PWD`) VALUES
('A1', 'Sameer', 'admin1');



CREATE TABLE `USERS` (
  `USER_ID` varchar(10) PRIMARY KEY,
  `USER_NAME` varchar(50) NOT NULL,
  `USER_PWD` varchar(20) DEFAULT NULL,
  `USER_DOB` DATE,
  `USER_EMAIL` varchar(50),
  `USER_MOBILE` varchar(10)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `USERS` (`USER_ID`, `USER_NAME`, `USER_PWD`, `USER_DOB`, `USER_EMAIL`) VALUES
('U1', 'Sameer', 'sam123', '2000-06-13', 'srinivasaddepalli13@gmail.com');



CREATE TABLE `BUSES` (
  `BUS_ID` varchar(10) PRIMARY KEY,
  `BUS_REGNUM` varchar(10) NOT NULL,
  `SOURCE` varchar(50) NOT NULL,
  `DESTINATION` varchar(50) NOT NULL,
  `FARE` int DEFAULT NULL,
  `DISTANCE` int DEFAULT NULL,
  `START_TIME` TIME,
  `END_TIME` TIME,
  `DURATION` TIME,
  `MAX_CAPACITY` int(10) NOT NULL,
  `REMAINING_SEATS` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `BUSES` (`BUS_ID`, `BUS_REGNUM`, `SOURCE`, `DESTINATION`, `FARE`,`DISTANCE`, `START_TIME`, `END_TIME`, `DURATION`, `MAX_CAPACITY`, `REMAINING_SEATS`) VALUES
('B01','REG-NO1', 'Bristol', 'Liverpool', 80, 180, '07:00:00', '10:00:00', '03:00:00', 20, 20),
('B02','REG-NO2', 'London', 'Cambridge', 30, 64, '09:00:00', '11:00:00', '02:00:00', 20, 20),
('B03','REG-NO3', 'Southampton', 'Nottingham', 78, 167, '16:45:00', '19:45:00', '03:00:00', 20, 20),
('B04','REG-NO4', 'Oxford', 'Manchester', 75, 163, '15:30:00', '18:30:00', '03:00:00', 20, 20),
('B05','REG-NO5', 'Eidenburg', 'Glasgow', 20, 46, '17:30:00', '18:30:00', '01:00:00', 20, 20),
('B06','REG-NO6', 'Liverpool', 'Cambridge', 87, 195, '08:00:00', '11:30:00', '03:30:00', 20, 20),
('B07','REG-NO7', 'Nottingham', 'London', 66, 128, '12:35:00', '15:35:00', '03:00:00', 20, 20),
('B08','REG-NO8', 'Manchester', 'Liverpool', 17, 35, '07:30:00', '08:30:00', '01:00:00', 20, 20),
('B09','REG-NO9', 'Oxford', 'Southampton', 27, 59 , '10:00:00', '11:00:00', '01:00:00', 20, 20),
('B10','REG-NO10', 'Lincoln', 'Liverpool', 50, 102, '11:25:00', '14:25:00', '03:00:00', 20, 20),
('B11','REG-NO11', 'Birmingham', 'Lincoln', 35, 76 , '14:00:00', '16:00:00', '02:00:00', 20, 20),
('B12','REG-NO12', 'Blackpool', 'Birmingham', 65, 125, '21:00:00', '23:00:00', '02:00:00', 20, 20);



CREATE TABLE `TICKET_BOOKINGS` (
  `TICKET_ID` INT(10) PRIMARY KEY AUTO_INCREMENT,
  `USER_ID` varchar(10),
  `JOURNEY_DATE` date DEFAULT NULL,
  `BUS_ID` varchar(10),
  `SOURCE` VARCHAR(50),
  `DESTINATION` VARCHAR(50),
  `DISTANCE` INT(10),
  `START_TIME` TIME,
  `END_TIME` TIME ,
  `DURATION` TIME,
  `NO_OF_TICKETS` int(10) DEFAULT NULL,
  `TOTAL_FARE` int,
  `DATE_OF_BOOKING` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(10) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


COMMIT;
