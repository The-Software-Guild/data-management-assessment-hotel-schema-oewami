DROP DATABASE IF EXISTS AbigailWamiHotelDB;

CREATE DATABASE AbigailWamiHotelDB;
USE AbigailWamiHotelDB;

CREATE TABLE Guest (
  guestId INT AUTO_INCREMENT,
  guest_name VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(20) NOT NULL,
  state CHAR(3) NOT NULL,
  zip CHAR(10) NOT NULL,
  phone VARCHAR(14),
  CONSTRAINT PK_guestId PRIMARY KEY (guestId)
);

CREATE TABLE RoomType (
  pk_roomType CHAR(10) PRIMARY KEY,
  isAdaAccessible BOOLEAN,
  standardOccupancy INT,
  maxOccupancy INT,
  basePrice DECIMAL(6,2),
  extraPersonFee DECIMAL(4,2)
);

CREATE TABLE Amenities (
	amenityID INT PRIMARY KEY,
    hasMicrowave BOOLEAN,
    hasJacuzzi BOOLEAN,
    hasRefrigerator BOOLEAN,
    hasOven BOOLEAN
);

CREATE TABLE Room (
  pk_roomNumber INT PRIMARY KEY,
  fk_roomType CHAR(10),
  CONSTRAINT fk_roomType
	FOREIGN KEY (fk_roomType) 	
    REFERENCES RoomType(pk_roomType)
);


CREATE TABLE Reservation (
  reservationNumber INT,
  guestId INT,
  adults INT NOT NULL,
  children INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  totalCost DECIMAL(6,2) NOT NULL,
   fk_roomNumber INT, 
   PRIMARY KEY (reservationNumber, fk_roomNumber),
  FOREIGN KEY  (fk_roomNumber) REFERENCES Room(pk_roomNumber)
  );

-- CREATE TABLE ReservationRoom (
-- 	reservationNumber INT,
--     roomNumber INT,
--     CONSTRAINT pk_reservationRoom
-- 		PRIMARY KEY (reservationNumber, roomNumber),
--     CONSTRAINT fk_roomNumber
-- 		FOREIGN KEY (roomNumber)
--         REFERENCES Room(pk_roomNumber),
-- 	CONSTRAINT fk_reservationNumber
-- 		FOREIGN KEY (reservationNumber)
--         REFERENCES Reservation(reservationNumber)
-- );

CREATE TABLE GuestReservation (
	guestId INT,
    reservationNumber INT, 
    PRIMARY KEY(guestId, reservationNumber),
	FOREIGN KEY (reservationNumber) REFERENCES Reservation(reservationNumber),
	FOREIGN KEY (guestId) REFERENCES Guest(guestId)
);


CREATE TABLE RoomAmenities (
	roomType VARCHAR(10),
    amenityID INT,
    PRIMARY KEY (roomType),
    FOREIGN KEY (amenityID) REFERENCES Amenities(amenityID)
);


    
