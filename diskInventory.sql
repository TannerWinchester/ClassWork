/***************************************************************************************
* DATE			PROGRAMMER			DESCRIPTION
*--------		-----------			-----------
*10/8/2021		TANNER WINCHESTER	INITIAL IMPLEMENTATION OF DISK DB.
*
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
(diskTypeID		INT 		NOT NULL PRIMARY KEY,
description		char(10)	NOT NULL);
go

CREATE TABLE genreType
(genreID		INT 		NOT NULL PRIMARY KEY,
description		char(10)	NOT NULL);
go

CREATE TABLE artistType
(artistTypeID		INT 		NOT NULL PRIMARY KEY,
description		char(10)	NOT NULL);
go

-- create the rest of the tables
CREATE TABLE status
(statusID		INT 		NOT NULL PRIMARY KEY,
description		char(10)	NOT NULL);
go

CREATE TABLE borrower
(borrowerID			INT			NOT NULL PRIMARY KEY,
borrowerFName		CHAR(60)	NOT NULL,
borrowerLName		CHAR(60)	NOT NULL,
borrowerPhoneNum	CHAR(20)	NOT NULL
);

CREATE TABLE artist
(artistID		INT			NOT NULL PRIMARY KEY,	
artistName		NCHAR(60)	NOT NULL,
artistTypeID	INT			NOT NULL REFERENCES artistType(artistTypeID));


CREATE TABLE diskHasArtist
(diskArtist		INT	NOT NULL PRIMARY KEY,
artistID		INT			NOT NULL REFERENCES artist(artistID),
cdID			INT			NOT NULL);


CREATE TABLE disk
(cdID			INT			NOT NULL PRIMARY KEY,
cdName			CHAR(60)	NOT NULL,
releaseDate		DATE		NOT NULL, 
artistID		INT			NOT NULL REFERENCES artist(artistID),
genreID			INT			NOT NULL REFERENCES genreType(genreID),
statusID		INT			NOT NULL REFERENCES status(statusID),
diskTypeID		INT			NOT NULL REFERENCES diskType(diskTypeID));

CREATE TABLE diskHasBorrower
(diskBorrower	INT		NOT NULL PRIMARY KEY,
borrowerID		INT		NOT NULL REFERENCES borrower(borrowerID),
borrowedDate	DATE	NOT NULL,
returnedDate	DATE	NULL,
cdID			INT		NOT NULL REFERENCES Disk(cdID));







-- CREATE INDEXES, if not done in table definition

-- after test, create new GitHub repo and push
