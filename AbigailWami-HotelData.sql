INSERT INTO Guest(guestId, guest_name, address, city, state, zip, phone) VALUES 
(1, 'Abigail Wami', '123 Generic Lane', 'San Francisco', 'CA', '94102', '(123) 456-7890'),
(2,	'Mack Simmer',	'379 Old Shore Street',	'Council Bluffs',	'IA',	'51501',	'(291) 553-0508'),
(3,	'Bettyann Seery',	'750 Wintergreen Dr.',	'Wasilla',	'AK',	'99654',	'(478) 277-9632'),
(4,	'Duane Cullison',	'9662 Foxrun Lane',	'Harlingen', 'TX',	'78552', '(308) 494-0198'),
(5,	'Katie Yang',	'9378 W. Augusta Ave.',	'West Deptford',	'NJ',	'08096',	'(214) 730-0298'),
(6,	'Aurore Lipton',	'762 Wild Rose Street',	'Saginaw',	'MI',	'48601',	'(377) 507-0974'),
(7,	'Zachery Luechtefeld',	'7 Poplar Dr.',	'Arvada',	'CO',	'80003',	'(814) 485-2615'),
(8,	'Jeremiah Pendergrass',	'70 Oakwood St.',	'Zion',	'IL',	'60099',	'(279) 491-0960'),
(9,	'Walter Holaway',	'7556 Arrowhead St.',	'Cumberland',	'RI',	'02864',	'(446) 396-6785'),
(10,	'Wilfred Vise',	'77 West Surrey Street',	'Oswego',	'NY',	'13126',	'(834) 727-1001'),
(11, 'Maritza Tilton',	'939 Linda Rd.',	'Burke',	'VA',	'22015',	'(446) 351-6860'),
(12,	'Joleen Tison',	'87 Queen St.',	'Drexil Hill',	'PA',	'19026',	'(231) 893-2755');


INSERT INTO RoomType (pk_roomType,isAdaAccessible,standardOccupancy,maxOccupancy,basePrice,extraPersonFee) VALUES
("Single I",0,2,2,174.99,null),
("Single II",1,2,2,149.99,null),
("Double I",0,2,4,199.99,10),
("Double II",1,2,4,174.99,10),
("Suite",1,3,8,399.99,20);

INSERT INTO Room (pk_roomNumber, fk_roomType) VALUES
(201,"Double I"),
(202,"Double II"),
(203,"Double I"),
(204,"Double II"),
(205,"Single I"),
(206,"Single II"),
(207,"Single I"),
(208,"Single II"),
(301,"Double I"),
(302,"Double II"),
(303,"Double I"),
(304,"Double II"),
(305,"Single I"),
(306,"Single II"),
(307,"Single I"),
(308,"Single II"),
(401,"Suite"),
(402,"Suite");

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO RoomAmenities (roomType, amenityID) VALUES
("Single I",	1),
("Single II",	2),
("Double I",	3),
("Double II",	4),
("Suite",	5);
SET FOREIGN_KEY_CHECKS=1;


INSERT INTO Amenities (amenityID,hasMicrowave,hasJacuzzi,hasRefrigerator,hasOven) VALUES
(1,1,1,1,0),
(2,1,0,1,0),
(3,1,1,0,0),
(4,0,0,1,0),
(5,1,0,1,1);

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO GuestReservation (guestId, reservationNumber) VALUES
(5,1),
(15,1),
(6,6),
(14,6),
(2,3),
(18,3),
(19,3),
(3,4),
(22,4),
(8,8),
(12,12),
(4,5),
(21,5),
(1,2),
(20,2),
(13,2),
(11,11),
(23,11),
(9,9),
(16,9),
(10,10),
(17,10),
(7,7);
SET FOREIGN_KEY_CHECKS=1;
  

INSERT INTO Reservation(reservationNumber,fk_roomNumber,guestId,adults ,children,startDate,endDate,totalCost) VALUES
(5,	307,	1,	1,	1,	"2023-03-17",	"2023-03-20",	524.97),
(15, 205,	1,	2,	0,	"2023-06-28",	"2023-07-07",	699.96),
(6,	302,	6,	3,	0,	"2023-03-18",	"2023-03-23",	924.95),
(14,	304,	6,	3,	0,	"2023-06-17",	"2023-06-18",	184.99),
(2,	203,	3,	2,	1,	"2023-02-05",	"2023-02-10",	999.95),
(18,	303,	3,	2,	1,	"2023-07-28",	"2023-07-29",	199.99),
(19,	305,	3,	1,	0,	"2023-08-30",	"2023-09-01",	349.98),
(3,	305,	4,	2,	0,	"2023-02-22",	"2023-02-24",	349.98), 
(22,	401,	4,	2,	2,	"2023-11-22",	"2023-11-25",	1199.97),
(8,	304,	8,	2,	0,	"2023-03-31",	"2023-04-05",	874.95),
(12,	206,	12,	2,	0,	"2023-6-10",	"2023-06-14",	599.96),
(12,	208,	12,	1,	0,	"2023-06-10",	"2023-06-14",	599.96),
(4,	201,	5,	2,	2,	"2023-03-06",	"2023-03-07",	199.99),
(21,	203,	5,	2,	2,	"2023-09-13",	"2023-09-15",	399.98),
(1,	308,	2,	1,	0,	"2023-02-02",	"2023-02-04",	299.98),
(20,	208,	2,	2,	0,	"2023-9-16",	"2023-9-17",	149.99),
(13,	206,	2,	2,	0,	"2023-11-22",	"2023-11-25",	449.97),
(13,	301,	2,	2,	2,	"2023-11-22",	"2023-11-25",	599.97),
(11,	401,	11,	2,	4,	"2023-05-30",	"2023-06-02",	1199.97),
(23,	302,	11,	2,	0,	"2023-12-24",	"2023-12-28",	699.96),
(9,	301,	9,	1,	0,	"2023-04-09",	"2023-04-13",	799.96),
(16,	204,	9,	3,	1,	"2023-07-13",	"2023-07-14",	184.99),
(10,	207,	10,	1,	1,	"2023-04-23",	"2023-04-24",	174.99),
(17,	401,	10,	4,	2,	"2023-07-18",	"2023-07-21",	1259.97),
(7,	202,	7,	2,	2,	"2023-03-29",	"2023-03-31",	349.98);

-- Jeremiah Pendergrass = 8 
use AbigailWamiHotelDB;
DELETE FROM GuestReservation WHERE guestId=8;
DELETE FROM Reservation WHERE guestId=8;
DELETE FROM Guest WHERE guestId=8;