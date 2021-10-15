/***************************************************************************************
* DATE			PROGRAMMER			DESCRIPTION
*--------		-----------			-----------
*10/8/2021		TANNER WINCHESTER	INITIAL IMPLEMENTATION OF DISK DB.
*10/13/2021		Tanner winchester	updated tables and added more memory to char data types.
*10/14/2021		Tanner Winchester	Added insert statements to populate db.
*10/15/2021		Tanner Winchester	finsished populating data.
****************************************************************************************/
-- drop and create db
USE master;

DROP DATABASE IF EXISTS disk_inventorytw;
go

CREATE DATABASE disk_inventorytw;
go

IF SUSER_ID('ProjectUserTW') IS NULL
		CREATE LOGIN ProjectUserTW WITH PASSWORD = 'MSPress#1',
		DEFAULT_DATABASE = disk_inventorytw;
go

USE disk_inventorytw;
go

CREATE USER ProjectUserTw;
go

--grant read-all to new user
ALTER ROLE db_datareader ADD MEMBER ProjectUserTW;
go

--create lookup tables disk_type, genre, artist_type
CREATE TABLE diskType
(diskTypeID		INT 		NOT NULL PRIMARY KEY IDENTITY,
description		char(10)	NOT NULL);
go

CREATE TABLE genreType
(genreID		INT 		NOT NULL PRIMARY KEY IDENTITY,
description		char(10)	NOT NULL);
go

CREATE TABLE artistType
(artistTypeID		INT 		NOT NULL PRIMARY KEY IDENTITY,
description		char(10)	NOT NULL);
go
select *
from artistType
-- create the rest of the tables
CREATE TABLE status
(statusID		INT 		NOT NULL PRIMARY KEY IDENTITY,
description		char(10)	NOT NULL);
go

CREATE TABLE borrower
(borrowerID			INT			NOT NULL PRIMARY KEY IDENTITY,
borrowerFName		CHAR(60)	NOT NULL,
borrowerLName		CHAR(60)	NOT NULL,
borrowerPhoneNum	CHAR(20)	NOT NULL
);

CREATE TABLE artist
(artistID		INT			NOT NULL PRIMARY KEY IDENTITY,	
artistName		NCHAR(60)	NOT NULL,
artistTypeID	INT			NOT NULL REFERENCES artistType(artistTypeID));


CREATE TABLE diskHasArtist
(diskArtist		INT	NOT NULL PRIMARY KEY IDENTITY,
artistID		INT			NOT NULL REFERENCES artist(artistID),
cdID			INT			NOT NULL);


CREATE TABLE disk
(cdID			INT			NOT NULL PRIMARY KEY IDENTITY,
cdName			CHAR(60)	NOT NULL,
releaseDate		DATE		NOT NULL, 
artistID		INT			NOT NULL REFERENCES artist(artistID),
genreID			INT			NOT NULL REFERENCES genreType(genreID),
statusID		INT			NOT NULL REFERENCES status(statusID),
diskTypeID		INT			NOT NULL REFERENCES diskType(diskTypeID));

CREATE TABLE diskHasBorrower
(diskBorrower	INT		NOT NULL PRIMARY KEY IDENTITY,
borrowerID		INT		NOT NULL REFERENCES borrower(borrowerID),
borrowedDate	DATE	NOT NULL,
returnedDate	DATE	NULL,
cdID			INT		NOT NULL REFERENCES Disk(cdID));

--populate tables in order  20 ROWS IN each except the lookup tables.
use disk_inventorytw
go
INSERT INTO diskType (description) --inserting types of cd's
VALUES
	('CD'),
	('Vinyl'),
	('8Track'),
	('Cassette'),
	('DVD');

select * 
from diskType

INSERT INTO genreType (description) --inserting genre data
VALUES
	('Pop'),
	('Rock'),
	('Country'),
	('Hip-Hop'),
	('Jazz'),
	('Metal'),
	('EDM');

INSERT INTO artistType (description) --inserting artist types
VALUES
	('Solo'),
	('Group');

INSERT INTO status (description) --giving status for cd's
VALUES
	('Available'),
	('On Loan'),
	('Damaged'),
	('Missing');

INSERT INTO borrower -- inserting customers who borrow the disks
	(borrowerFName, borrowerLName, borrowerPhoneNum)
VALUES
	('John', 'Doe', 2086586566),
	('Elon', 'Musk', 2086586565),
	('Bill', 'Gates', 2086586564),
	('Josh', 'Low', 2086586563),
	('Jen', 'Castro', 208658652),
	('Joe', 'Yunne', 2086586561),
	('Cam', 'Newton', 2086586560),
	('Bucky', 'Lanes', 2086586569),
	('Jim', 'Deer', 2086586568),
	('Donald', 'Trump', 2086586512),
	('Leerie', 'Lass', 2086586523),
	('Albert', 'Henry', 2086586534),
	('Lisa', 'Bendry', 2086586545),
	('Brady', 'Hacket', 2086586556),
	('Justin', 'Sun', 2086586567),
	('Satoshi', 'Nakomoto', 2086586578),
	('Jake', 'Lenneth', 2086586589),
	('Luke', 'Skywalker', 2086586598),
	('Ryan', 'Grands', 2086586587),
	('Lesly', 'Fennic', 2086586565);
select *
from borrower;

delete 
from borrower
where borrowerID = 22;


INSERT INTO artist -- populating artists and status
	(artistName, artistTypeID)
VALUES
	('Drake', 1),
	('Ariana Grande', 1),
	('Justin Bieber', 1),
	('AC/DC', 2),
	('The Beatles', 2),
	('21 Savage', 1),
	('Lord Huron', 2),
	('Hanz Zimmer', 1),
	('Avici', 1),
	('Illenium', 2),
	('John Legend', 1),
	('Black Shelton', 1),
	('Ed Sheeran', 1),
	('3 doors down', 2),
	('Linkin Park', 2),
	('Biggie Smalls', 1),
	('Lil Wayne', 1),
	('BlackBear', 1),
	('Luke Combs', 1),
	('Kane Brown', 2);
select *
from artist;



INSERT INTO diskHasArtist 
	(artistID, cdID)
VALUES
	(2, 1),
	(3, 2),
	(4, 3),
	(5, 4),
	(6, 5),
	(7, 6),
	(8, 7),
	(9, 8),
	(10, 9),
	(11, 10),
	(12, 11),
	(13, 12),
	(14, 13),
	(15, 14),
	(16, 15),
	(17,16),
	(18, 17),
	(19, 18),
	(20, 19),
	(21, 20);

INSERT INTO disk -- creating disks and artists on them 
	(cdName, releaseDate, artistID, genreID, statusID, diskTypeID)
VALUES
	('More Life', '3-18-2017', 2, 4, 1, 2),

	('Thank u Next', '1-18-2017', 3, 3, 1, 1),

	('Highway to Hell', '2-18-2017', 2, 4, 2, 2),

	('Purpose', '4-18-2017', 3, 4, 1, 1),

	('Abbey Road', '5-18-2017', 2, 3, 2, 2),

	('Savage Mode', '6-18-2017', 2, 2, 1, 5),

	('Strange Trails', '7-18-2017', 2, 1, 2, 5),

	('Kung Fu Panda', '8-18-2017', 2, 1, 1, 4),

	('Stories', '9-18-2017', 2, 3, 1, 3),

	('Fallen Embers', '3-28-2017', 2, 3, 2, 1),

	('All of you', '3-19-2017', 2, 4, 1, 2),

	('Ol Red', '3-11-2017', 2, 2, 1, 2),

	('Divide', '3-17-2017', 2, 4, 1, 3),

	('Here Without You', '3-10-2017', 2, 2, 1, 4),

	('In the End', '3-1-2017', 2, 4, 1, 5),

	('The Carter', '3-3-2017', 2, 1, 1, 1),

	('Wanderlust', '3-6-2017', 2, 3, 1, 2),

	('This Ones for you', '3-5-2017', 2, 3, 1, 3),

	('Nothin was the same', '3-4-2017', 2, 1, 1, 1),

	('You', '3-20-2017', 2, 3, 1, 2);

UPDATE disk 
set cdName = 'Updated You'
where cdID = 35;

select *
from disk;

INSERT INTO diskHasBorrower
	(borrowerID, cdID, borrowedDate, returnedDate)
VALUES
	(1, 1, '1-1-2021', '2-3-2012'),
	(3, 12, '1-2-2021', '2-2-2012'),
	(4, 16, '1-3-2021', '2-1-2012'),
	(5, 17, '1-4-2021', '2-6-2012'),
	(6, 18, '1-5-2021', '2-12-2012'),
	(7, 19, '1-6-2021', '2-15-2012'),
	(8, 20, '1-7-2021', '2-4-2012'),
	(9, 21, '1-8-2021', '2-3-2012'),
	(10, 22, '1-9-2021', '2-8-2012'),
	(11, 23, '1-10-2021', '2-15-2012'),
	(12, 24, '1-20-2021', '2-9-2012'),
	(4, 24, '1-13-2021', '2-12-2012'),
	(1, 25, '1-14-2021', '2-4-2012'),
	(3, 26, '1-22-2021', '2-1-2012'),
	(13, 27, '1-13-2021', '2-17-2012'),
	(14, 28, '1-16-2021', '2-20-2012'),
	(15, 29, '1-22-2021', NULL),
	(9, 30, '1-30-2021', NULL),
	(6, 31, '1-19-2021', NULL),
	(8, 32, '1-23-2021', NULL);



select * 
from diskHasBorrower
where returnedDate is NULL;