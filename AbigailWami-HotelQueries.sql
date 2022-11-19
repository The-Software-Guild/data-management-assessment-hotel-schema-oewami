-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT
	g.guest_name,
	r.guestId,
	r.reservationNumber,
	r.fk_roomNumber,
	r.startDate,
	r.endDate
FROM Reservation r
INNER JOIN Guest g USING (guestId)
WHERE endDate BETWEEN '2023-07-01' AND '2023-07-31';

#guest_name,guestId,reservationNumber,fk_roomNumber,startDate,endDate
#"Abigail Wami",1,15,205,2023-06-28,2023-07-07
#"Walter Holaway",9,16,204,2023-07-13,2023-07-14
#"Wilfred Vise",10,17,401,2023-07-18,2023-07-21
#"Bettyann Seery",3,18,303,2023-07-28,2023-07-29


-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT  
reservationNumber, 
r.guestId, 
g.guest_name, 
fk_roomNumber, 
a.hasJacuzzi, 
startDate, 
endDate
FROM Reservation r INNER JOIN Room ON Room.pk_roomNumber = r.fk_roomNumber
INNER JOIN RoomAmenities ON RoomAmenities.roomType = Room.fk_roomType
INNER JOIN Amenities a ON a.amenityID = RoomAmenities.amenityID
INNER JOIN Guest g ON g.guestId = r.guestId
WHERE a.hasJacuzzi=TRUE
ORDER BY reservationNumber ASC;

#reservationNumber,guestId,guest_name,fk_roomNumber,hasJacuzzi,startDate,endDate
#2,3,"Bettyann Seery",203,1,2023-02-05,2023-02-10
#3,4,"Duane Cullison",305,1,2023-02-22,2023-02-24
#4,5,"Katie Yang",201,1,2023-03-06,2023-03-07
#5,1,"Abigail Wami",307,1,2023-03-17,2023-03-20
#9,9,"Walter Holaway",301,1,2023-04-09,2023-04-13
#10,10,"Wilfred Vise",207,1,2023-04-23,2023-04-24
#13,2,"Mack Simmer",301,1,2023-11-22,2023-11-25
#15,1,"Abigail Wami",205,1,2023-06-28,2023-07-07
#18,3,"Bettyann Seery",303,1,2023-07-28,2023-07-29
#19,3,"Bettyann Seery",305,1,2023-08-30,2023-09-01
#21,5,"Katie Yang",203,1,2023-09-13,2023-09-15


-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
SELECT 
	guestId, 
	g.guest_name, 
    reservationNumber, 
    fk_roomNumber,      
    startDate,     
    endDate,     
    adults,      
    children 
FROM Reservation r 
INNER JOIN Guest g USING (guestId) 
WHERE g.guest_name="Abigail Wami";

#guestId,guest_name,reservationNumber,fk_roomNumber,startDate,endDate,adults,children
#1,"Abigail Wami",5,307,2023-03-17,2023-03-20,1,1
#1,"Abigail Wami",15,205,2023-06-28,2023-07-07,2,0


-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT pk_roomNumber, fk_roomType AS roomType, reservationNumber, guestId, startDate, endDate, basePrice, totalCost
FROM Room rm
INNER JOIN Reservation r ON r.fk_roomNumber = rm.pk_roomNumber
INNER JOIN RoomType rt ON rt.pk_roomType = rm.fk_roomType
ORDER BY pk_roomNumber ASC;

#pk_roomNumber,roomType,reservationNumber,guestId,startDate,endDate,basePrice,totalCost
#201,"Double I",4,5,2023-03-06,2023-03-07,199.99,199.99
#202,"Double II",7,7,2023-03-29,2023-03-31,174.99,349.98
#203,"Double I",2,3,2023-02-05,2023-02-10,199.99,999.95
#203,"Double I",21,5,2023-09-13,2023-09-15,199.99,399.98
#204,"Double II",16,9,2023-07-13,2023-07-14,174.99,184.99
#205,"Single I",15,1,2023-06-28,2023-07-07,174.99,699.96
#206,"Single II",12,12,2023-06-10,2023-06-14,149.99,599.96
#206,"Single II",13,2,2023-11-22,2023-11-25,149.99,449.97
#207,"Single I",10,10,2023-04-23,2023-04-24,174.99,174.99
#208,"Single II",12,12,2023-06-10,2023-06-14,149.99,599.96
#208,"Single II",20,2,2023-09-16,2023-09-17,149.99,149.99
#301,"Double I",9,9,2023-04-09,2023-04-13,199.99,799.96
#301,"Double I",13,2,2023-11-22,2023-11-25,199.99,599.97
#302,"Double II",6,6,2023-03-18,2023-03-23,174.99,924.95
#302,"Double II",23,11,2023-12-24,2023-12-28,174.99,699.96
#303,"Double I",18,3,2023-07-28,2023-07-29,199.99,199.99
#304,"Double II",14,6,2023-06-17,2023-06-18,174.99,184.99
#305,"Single I",3,4,2023-02-22,2023-02-24,174.99,349.98
#305,"Single I",19,3,2023-08-30,2023-09-01,174.99,349.98
#307,"Single I",5,1,2023-03-17,2023-03-20,174.99,524.97
#308,"Single II",1,2,2023-02-02,2023-02-04,149.99,299.98
#401,Suite,11,11,2023-05-30,2023-06-02,399.99,1199.97
#401,Suite,17,10,2023-07-18,2023-07-21,399.99,1259.97
#401,Suite,22,4,2023-11-22,2023-11-25,399.99,1199.97


-- 5. Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.

SELECT
reservationNumber,
guestId,
pk_roomNumber,
pk_roomType,
startDate,
endDate,
maxOccupancy
FROM Reservation r
INNER JOIN Room rm ON rm.pk_roomNumber = r.fk_roomNumber
INNER JOIN RoomType rt ON rt.pk_roomType = rm.fk_roomType
WHERE startDate BETWEEN '2023-04-01' AND '2023-04-30' AND maxOccupancy>=3;

# reservationNumber, guestId, pk_roomNumber, pk_roomType, startDate, endDate, maxOccupancy
#'9', '9', '301', 'Double I', '2023-04-09', '2023-04-13', '4'


-- same as above with all columns
-- SELECT * FROM Reservation 
-- INNER JOIN Room ON Room.pk_roomNumber = Reservation.fk_roomNumber
-- INNER JOIN RoomType ON RoomType.pk_roomType = Room.fk_roomType
-- WHERE startDate BETWEEN '2023-04-01' AND '2023-04-30' AND maxOccupancy>=3;

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT g.guest_name, g.guestId, count(r.guestId) AS reservationsMade FROM Guest g
INNER JOIN Reservation r ON r.guestId = g.guestId
GROUP BY guestId
ORDER BY 3 DESC, g.guest_name ASC;

#guest_name, guestId, reservationsMade
#'Mack Simmer','2','4'
#'Bettyann Seery','3','3'
#'Abigail Wami','1','2'
#'Aurore Lipton','6','2'
#'Duane Cullison','4','2'
#'Joleen Tison','12','2'
#'Katie Yang','5','2'
#'Maritza Tilton','11','2'
#'Walter Holaway','9','2'
#'Wilfred Vise','10','2'
#'Zachery Luechtefeld','7','1'



-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT guest_name, address, phone
FROM Guest
WHERE phone="(231) 893-2755";

#guest_name, address, phone
#'Joleen Tison', '87 Queen St.', '(231) 893-2755'
