--Part A

sqlite3 hw2.db

 CREATE TABLE Flights( fid INTEGER PRIMARY KEY NOT NULL,
 year INTEGER NOT NULL,
 month_id INTEGER REFERENCES Months NOT NULL,
 day_of_month INTEGER NOT NULL,
 day_of_week_id INTEGER REFERENCES Weekdays NOT NULL,
 carrier_id VARCHAR(10) REFERENCES Carriers NOT NULL,
 flight_num INTEGER NOT NULL,
 origin_city VARCHAR(50) NOT NULL,
 origin_state VARCHAR(30) NOT NULL,
 dest_city VARCHAR(50) NOT NULL,
 dest_state VARCHAR(30) NOT NULL,
 departure_delay INTEGER NOT NULL,
 taxi_out INTEGER NOT NULL,
 arrival_delay INTEGER NOT NULL,
 canceled INTEGER NOT NULL,
 actual_time INTEGER NOT NULL,
 distance INTEGER NOT NULL);

.import ./flights-small/flights-small.csv Flights

CREATE TABLE Carriers( cid  VARCHAR(10) PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL);

.import ./flights-small/carriers.csv Carriers

CREATE TABLE Months ( mid INTEGER PRIMARY KEY NOT NULL, month VARCHAR(20) NOT NULL);

.import ./flights-small/months.csv Months

CREATE TABLE Weekdays( did INTEGER PRIMARY KEY NOT NULL, day_of_week VARCHAR(11) NOT NULL);

