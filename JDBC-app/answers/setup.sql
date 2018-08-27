CREATE TABLE Customer( 	userid INTEGER PRIMARY KEY,
						fullname VARCHAR(45),
						handle VARCHAR(20) UNIQUE,
						password VARCHAR(20));
CREATE TABLE Reservation( 	userid INTEGER REFERENCES CUSTOMER,
							day_of_month DECIMAL(7,2),
							resid INTEGER PRIMARY KEY);
CREATE TABLE DReservation( resid INTEGER REFERENCES Reservation,
							fid DECIMAL(9,2),
							origin_city VARCHAR(50),
							dest_city VARCHAR(50),
							actual_time DECIMAL(7,2),
							flight_num DECIMAL(7,2),
							year DECIMAL(7,2),
 							month_id INTEGER,
 							day_of_month DECIMAL(7,2),
 							name VARCHAR(50)
 							);

CREATE TABLE TwoReservation( resid INTEGER REFERENCES Reservation,
							fid1 DECIMAL(9,2),
							origin_city1 VARCHAR(50),
							dest_city1 VARCHAR(50),
							actual_time1 DECIMAL(7,2),
							flight_num1 DECIMAL(7,2),
 							name1 VARCHAR(50),

 							fid2 DECIMAL(9,2),
 							origin_city2 VARCHAR(50),
							dest_city2 VARCHAR(50),
							actual_time2 DECIMAL(7,2),
							flight_num2 DECIMAL(7,2),
 							name2 VARCHAR(50),

 							year DECIMAL(7,2),
 							month_id INTEGER,
 							day_of_month DECIMAL(7,2)
 							);

INSERT INTO Customer VALUES(0001,'Colby Gilbert', 'colbyg95', 'clawby69');

INSERT INTO Reservation VALUES(0001, 10, 1111);

INSERT INTO DReservation VALUES(1111, 8, 'Seattle WA', 'Portland OR', 45, 22, 2015, 7, 10, 'Delta');

INSERT INTO TReservation VALUES(1112, 8, 'Seattle WA', 'Portland OR', 45, 22, 
	'Delta', 12,'Portland OR', 'Los Angles', 120, 30, 'Delta', 2015, 7, 10 );