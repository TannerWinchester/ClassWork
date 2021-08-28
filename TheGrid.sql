#************************************************************************
# Script to create The Grid database and add test data.
# Name		Date		Description
# Tanner	8/27/21	Initial deployment.
#
#************************************************************************
DROP DATABASE IF EXISTS thegrid;
CREATE DATABASE thegrid;
USE thegrid;
# create objects
CREATE TABLE IF NOT EXISTS employee
(
	employee_id	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	first_name	VARCHAR(255) NOT NULL,
	last_name	VARCHAR(255) NOT NULL,
	email_address VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS contactMSG
(
	msg_id		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	first_name	VARCHAR(255) NOT NULL,
	last_name	VARCHAR(255) NOT NULL,
	email_address	VARCHAR(255) NOT NULL UNIQUE,
	phone_num	VARCHAR(255) NOT NULL,
	msg_reason	VARCHAR(255) NULL,
	referral_src	VARCHAR(10) NULL,
	question	VARCHAR(255) NULL,
	employee_id	INT NOT NULL,
	FOREIGN key (employee_id) REFERENCES employee(employee_id)
);

# Insert statements for employee table
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Hunter', 'Jared', 'hunter@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Mace', 'Windu', 'Mwindu@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Harry', 'Potter', 'hp@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Jon','Snow','Jsnow@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Percy','Jackson','pjackson@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Ron', 'Weasley','Ronw@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Hermione','Granger','GrangerH@gmail.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Draco','Malfoy','MalfoyManor@mail.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Neville','Longbottom','NevilleL@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Jared','Mayer','JaredMayer@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Hunter','Winchester','Hw@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Joe','wilder','Joel@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Hope','Lee','HopeL@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Avatar','Aang','Avatar@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Socca','Ofwater','Socca@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Zuko','Fire','FireNation@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Luna','Lovegood','LunaL@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Lily','Potter','Lily@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Lord','Vader','DeathStar@mtn.com');
INSERT INTO employee
	(first_name, last_name, email_address)
VALUES
	('Obiwan','Kenobi','Jedi@mtn.com');

# 20 total rows
	
	
	
	
	
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Luke', 'Skywalker', 'sky@me.com', 2088996552, 'E-Sports Team','1', 'Can i join?', 1);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Leia', 'Skywalker', 'skyW@me.com', 2088996553, 'Hyper-Reality','2', '', 2);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Hunter', 'Lee', 'skype@me.com', 2088996532, 'E-Sports Team','1', 'How big is the team?', 3);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Ninja', 'Gamer', 'Ninja@me.com', 2088396552, 'E-Sports Team','3', 'Salary?', 4);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Tom', 'walker', 'Tommy@me.com', 2088992352, 'Arcade Games','4', '', 5);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Teryn', 'Benson', 'Awesome@me.com', 2065296552, 'E-Sports Team','1', 'Can i join?', 6);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Ben', 'Gates', 'BenG@me.com', 2088996352, 'Members access','3', 'Monthly rate?', 7);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Anakin', 'Skywalker', 'skywalker@me.com', 2083496552, 'E-Sports Team','1', 'Can i join?', 8);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Rey', 'Skywalker', 'nosky@me.com', 2088996562, 'E-Sports Team','1', 'Can i join?', 9);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Lee', 'Roy', 'Jenkins@me.com', 2088996554, 'E-Sports Team','1', 'Skill level?', 10);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Jaedyn', 'Cook', 'JCook@me.com', 208855278, 'E-Sports Team','4', 'Can i join?', 11);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('John', 'Winchester', 'Jw@me.com', 2023596552, 'Hyper-Reality','1', 'What equipment?', 12);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Robin', 'Winchester', 'RW@me.com', 2088965552, 'E-Sports Team','1', 'Can i join?', 13);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Mike', 'Doe', 'professional@me.com', 2088996552, 'Arcade Games','1', 'What games?', 14);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Percival', 'One', 'gamer@me.com', 2088995852, 'Hyper-Reality','1', 'Where is it?', 15);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Tom', 'Riddle', 'DeathEater@me.com', 2088994552, 'E-Sports Team','1', '', 16);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Master', 'Yoda', 'Council@me.com', 2088996352, 'Members Access','2', 'Join I can', 17);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Jon', 'Jones', 'JJ@me.com', 2088987452, 'E-Sports Team','5', '', 18);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Max', 'Holloway', 'skyper@me.com', 2088346552, 'Hyper-Reality','2', '', 19);
INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, msg_reason, referral_src, question, employee_id)
VALUES
	('Darth', 'Maul', 'Sith@me.com', 2088996551, 'Members Access','4', '', 20);


# 20 total rows
	
	
	
	
	
