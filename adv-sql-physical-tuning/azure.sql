CREATE TABLE Flights( fid DECIMAL(9,2) PRIMARY KEY NOT NULL,
 year DECIMAL(7,2) NOT NULL,
 month_id INTEGER REFERENCES Months NOT NULL,
 day_of_month DECIMAL(7,2) NOT NULL,
 day_of_week_id INTEGER REFERENCES Weekdays NOT NULL,
 carrier_id VARCHAR(10) REFERENCES Carriers NOT NULL,
 flight_num DECIMAL(7,2) NOT NULL,
 origin_city VARCHAR(50) NOT NULL,
 origin_state VARCHAR(30) NOT NULL,
 dest_city VARCHAR(50) NOT NULL,
 dest_state VARCHAR(30) NOT NULL,
 departure_delay DECIMAL(7,2),
 taxi_out DECIMAL(7,2),
 arrival_delay DECIMAL(7,2),
 canceled DECIMAL(7,2) NOT NULL,
 actual_time DECIMAL(7,2),
 distance DECIMAL(7,2) NOT NULL);

CREATE TABLE Carriers( cid  VARCHAR(10) PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL);



CREATE TABLE Months ( mid INTEGER PRIMARY KEY NOT NULL, month VARCHAR(20) NOT NULL);



CREATE TABLE Weekdays( did INTEGER PRIMARY KEY NOT NULL, day_of_week VARCHAR(11) NOT NULL);

-- Q1 12 seconds 333 outputs

SELECT F.origin_city, F.dest_city, F.actual_time
FROM Flights F
WHERE f.actual_time = (SELECT max(F1.actual_time)
			FROM Flights F1
            WHERE F.origin_city = F1.origin_city)
ORDER BY F.origin_city, F.dest_city;
/*
ORIGIN_CITY
DEST_CITY
ACTUAL_TIME
Aberdeen SD
Minneapolis MN
106.00
Abilene TX
Dallas/Fort Worth TX
111.00
Adak Island AK
Anchorage AK
165.00
Aguadilla PR
Newark NJ
272.00
Akron OH
Denver CO
224.00
Albany GA
Atlanta GA
111.00
Albany NY
Las Vegas NV
360.00
Albuquerque NM
Baltimore MD
297.00
Alexandria LA
Atlanta GA
179.00
Allentown/Bethlehem/Easton PA
Atlanta GA
199.00
Alpena MI
Detroit MI
80.00
Amarillo TX
Houston TX
176.00
Anchorage AK
Houston TX
448.00
Appleton WI
Atlanta GA
180.00
Arcata/Eureka CA
San Francisco CA
136.00
Asheville NC
Newark NJ
189.00
Ashland WV
Cincinnati OH
84.00
Aspen CO
Chicago IL
183.00
Atlanta GA
Honolulu HI
649.00
Atlantic City NJ
Fort Lauderdale FL
212.00
Augusta GA
Atlanta GA
176.00
Fort Lauderdale FL
212.00*/

-- Q2 57 seconds 147 rows

SELECT DISTINCT origin_city
FROM Flights x
WHERE actual_time IS NOT NULL AND x.origin_city NOT IN(SELECT y.origin_city
						FROM Flights y
						WHERE y.actual_time >= 180);
/*
ORIGIN_CITY
Aberdeen SD
Abilene TX
Adak Island AK
Albany GA
Alexandria LA
Alpena MI
Amarillo TX
Arcata/Eureka CA
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Bloomington/Normal IL
Brainerd MN
Bristol/Johnson City/Kingsport TN
Brownsville TX
Brunswick GA*/

ORDER BY origin_city;


--Q3 13 seconds 327 outputs
SELECT x.origin_city, ((SELECT count(y.fid)
						FROM Flights y
						WHERE y.origin_city = x.origin_city 
						AND y.actual_time <= 180) * 100 / count(*)) P 

FROM Flights x
GROUP BY x.origin_city
ORDER BY P DESC;

/*ORIGIN_CITY
P
Laramie WY
100
Victoria TX
100
Hattiesburg/Laurel MS
100
Sioux City IA
100
Cedar City UT
100
Aberdeen SD
100
Niagara Falls NY
100
New Bern/Morehead/Beaufort NC
100
Dickinson ND
100
Waterloo IA
100
Hyannis MA
100
West Yellowstone MT
100
Garden City KS
100
Wrangell AK
100
Dillingham AK
100
Marthas Vineyard MA
100
Gillette WY
100
Sault Ste. Marie MI
100
Yakutat AK
100
Cordova AK
100*/

--Q4 9 seconds 259 outputs

SELECT DISTINCT F1.dest_city
FROM Flights F1
WHERE F1.dest_city != 'Seattle WA' AND F1.dest_city not in(SELECT F2.dest_city
				FROM Flights F2
				WHERE F2.origin_city = 'Seattle WA')
ORDER BY F1.dest_city;

/*

DEST_CITY
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME*/


--Q5 18 seconds 3 outputs
SELECT DISTINCT F1.dest_city
FROM Flights F1 
WHERE F1.dest_city != 'Seattle WA' AND F1.dest_city not in(SELECT DISTINCT F3.dest_city
				FROM Flights F2, FLIGHTS F3
				WHERE F2.origin_city = 'Seattle WA' 
				AND F2.dest_city = F3.origin_city
                AND F3.dest_city != 'Seattle WA')
ORDER BY F1.dest_city;

/*
DEST_CITY
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL*/

--part D

--Q1 I choose actual_time because the selectivty is much higher( e.g more options)

CREATE INDEX Time on Flights(actual_time);

--Q1b 	i. yes
--		ii. yes 
--		iii. 	no, becaue the selectivity of flights with a flight time <30 
--				it is low it is faster to use a different method

--Q2

CREATE INDEX Dest on Flights(dest_city);

--Q3 yes before 6s after 4s

--Q4 	(seconds)
--		query1 before: after:14
--		query2 before: 57 after: 10	
--		query3 before: 13 after: 13
--		query4 before: 9 after: 8
--		query5 before: 18 after: 14


--Part E 	Once I actually could use SSMS it was great but it 
--			blows its only a windows appilcation. But the the cloud 
--			aspect is really awesome and veristile.
