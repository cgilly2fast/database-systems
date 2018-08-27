
-- Question 1 [3]

SELECT DISTINCT flight_num FROM Flights, Carriers WHERE origin_city = "Seattle WA" and dest_city = "Boston MA" and
   ...> carrier_id = cid and name = "Alaska Airlines Inc.";
flight_num

--12
--24
--734

--Question 2 [494]
SELECT name, x.flight_num, x.origin_city, x.dest_city, x.actual_time, y.flight_num, 
y.origin_city, y.dest_city, y.actual_time, 
(x.actual_time + y.actual_time)
FROM Flights x, Flights y, Months, Carriers
WHERE x.year = 2015 and x.month_id = mid and y.year = 2015 
and y.month_id = mid and month = "July" and x.carrier_id = cid and y.carrier_id = cid 
and x.origin_city = "Seattle WA" and y.dest_city = "Boston MA" and 
(x.actual_time + y.actual_time <= 420) and x.day_of_month = 15 and y.day_of_month = 15
and x.dest_city = y.origin_city;

-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,26,"Chicago IL","Boston MA",150,378
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,186,"Chicago IL","Boston MA",137,365
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,288,"Chicago IL","Boston MA",137,365
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,366,"Chicago IL","Boston MA",150,378
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,1205,"Chicago IL","Boston MA",128,356
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,1240,"Chicago IL","Boston MA",130,358
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,1299,"Chicago IL","Boston MA",133,361
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,1435,"Chicago IL","Boston MA",133,361
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,1557,"Chicago IL","Boston MA",122,350
-- "American Airlines Inc.",42,"Seattle WA","Chicago IL",228,2503,"Chicago IL","Boston MA",127,355
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,84,"New York NY","Boston MA",74,396
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,199,"New York NY","Boston MA",80,402
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,235,"New York NY","Boston MA",91,413
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,1443,"New York NY","Boston MA",80,402
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,2118,"New York NY","Boston MA","",322
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,2121,"New York NY","Boston MA",74,396
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,2122,"New York NY","Boston MA",65,387
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,2126,"New York NY","Boston MA",60,382
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,2128,"New York NY","Boston MA",83,405
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,2131,"New York NY","Boston MA",70,392
-- "American Airlines Inc.",44,"Seattle WA","New York NY",322,2136,"New York NY","Boston MA",63,385

-- Question 3 [1]
SELECT day_of_week, AVG(arrival_delay)
FROM Flights, Weekdays
WHERE day_of_week_id = did
GROUP BY day_of_week
ORDER BY AVG(arrival_delay) DESC
LIMIT 1;

--day_of_week,AVG(arrival_delay)
--Wednesday,13.0125428064529

-- Question 4 [11]
SELECT DISTINCT name
FROM Flights, Carriers
WHERE carrier_id = cid 
GROUP BY year, month_id, day_of_month, cid
HAVING count(*) > 1000;

-- Question 5 [53]
SELECT name, (CAST(SUM(canceled) AS FLOAT) / CAST(count(canceled) AS FLOAT)),
FROM Flights, Carriers
WHERE carrier_id = cid 
GROUP BY origin_city = "Seattle WA", name
HAVING (CAST(SUM(canceled) AS FLOAT) / CAST(count(canceled) AS FLOAT)) > .5
ORDER BY (CAST(SUM(canceled) AS FLOAT) / CAST(count(canceled) AS FLOAT)) > .5 ASC;











