DROP DATABASE IF EXISTS AbigailWamiHotelDB;

CREATE DATABASE AbigailWamiHotelDB;
USE AbigailWamiHotelDB;

CREATE TABLE Guest (
  pk_guestId INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(20) NOT NULL,
  state CHAR(3) NOT NULL,
  zip CHAR(10) NOT NULL,
  phone VARCHAR(10)
);

CREATE TABLE RoomType (
  pk_roomType CHAR(10) PRIMARY KEY,
  isAdaAccessible BOOLEAN,
  standardOccupancy INT,
  maxOccupancy INT,
  basePrice DECIMAL,
  extraPersonFee DECIMAL
);

CREATE TABLE Room (
  pk_roomNumber INT PRIMARY KEY,
  roomType CHAR(10),
  roomCost DECIMAL,
  CONSTRAINT fk_roomType
	FOREIGN KEY (roomType) 	
    REFERENCES RoomType(pk_roomType)
);


CREATE TABLE Reservation (
  reservationNumber INT PRIMARY KEY,
  fk_roomNumber INT,
  fk_guestId INT,
  adults INT NOT NULL,
  children INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  totalCost DECIMAL NOT NULL,
  FOREIGN KEY (fk_roomNumber) REFERENCES Room(pk_roomNumber),
  FOREIGN KEY (fk_guestId) REFERENCES Guest(pk_guestId)
);

CREATE TABLE ReservationRoom (
	reservationNumber INT,
    roomNumber INT,
    CONSTRAINT pk_reservationRoom
		PRIMARY KEY (reservationNumber, roomNumber),
    CONSTRAINT fk_roomNumber
		FOREIGN KEY (roomNumber)
        REFERENCES Room(pk_roomNumber),
	CONSTRAINT fk_reservationNumber
		FOREIGN KEY (reservationNumber)
        REFERENCES Reservation(reservationNumber)
);

CREATE TABLE GuestReservation (
	guestId INT,
    reservationNumber INT, 
    CONSTRAINT pk_guestReservation PRIMARY KEY(guestId, reservationNumber),
    CONSTRAINT fk_guestReservation_res 
		FOREIGN KEY (reservationNumber) 
        REFERENCES Reservation(reservationNumber),
	CONSTRAINT fk_guestReservation_guest
		FOREIGN KEY (guestId)
        REFERENCES Guest(pk_guestId)
);


CREATE TABLE RoomAmenities (
	roomType VARCHAR(10),
    amenityID INT
);

CREATE TABLE Amenities (
	amenityID INT PRIMARY KEY,
    hasMicrowave BOOLEAN,
    jacuzzi BOOLEAN,
    refrigerator BOOLEAN,
    oven BOOLEAN
);
    
