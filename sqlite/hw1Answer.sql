--Question1:

--a
CREATE TABLE Edges (
	Source INTEGER,
	Destination INTEGER);
--b
INSERT INTO Edges VALUES(10,5);
INSERT INTO Edges VALUES(6,25);
INSERT INTO Edges VALUES(1,3);
INSERT INTO Edges VALUES(4,4);

--c
SELECT * FROM Edges;

10|5
6|25
1|3
4|4

.header on
.mode column

--d
SELECT Source FROM Edges;

Source    
----------
10        
6         
1         
4  

--e     
SELECT * FROM Edges WHERE Source > Destination;

Source      Destination
----------  -----------
10          5          

--f
INSERT INTO Edges VALUES('-1','2000');
SELECT * FROM Edges;
Source      Destination
----------  -----------
10          5          
6           25         
1           3          
4           4          
-1          2000     
--sqlite has dynamic typing system, so strings can go anywhere, 
--	this not allowed on bigger DBMS


-- Question2:

CREATE TABLE MyRestaurants (
	Name VARCHAR(15),
	Type of food VARCHAR(30),
	Distance INTEGER,
	Date VARCHAR(10),
	Like INTEGER);  

-- Question3: 

INSERT INTO MyRestaurants VALUES('ching', 'chinese', 5, '2017-02-1', 1);
INSERT INTO MyRestaurants VALUES('ting', 'thai', 15, '2017-01-22', 0); 
INSERT INTO MyRestaurants VALUES('Dicks', 'burger', 15, '2017-01-27', 1); 
INSERT INTO MyRestaurants VALUES('Chux', 'bbq', 29, '2017-03-17', NULL);
INSERT INTO MyRestaurants VALUES('Sticks', 'salad', 58, '2016-01-27', 0);

--Question4

--a
.mode list

SELECT * FROM MyRestaurants;

ching,chinese,5,2017-02-1,1
ting,thai,15,2017-01-22,0
Dicks,burger,15,2017-01-27,1
Chux,bbq,29,2017-03-17,
Sticks,salad,58,2016-01-27,0

--b

.mode list

.separator |

SELECT * FROM MyRestaurants;

ching|chinese|5|2017-02-11|1
ting|thai|15|2017-01-22|0
Dicks|burger|15|2017-01-27|1
Chux|bbq|29|2017-03-17|
Sticks|salad|58|2016-01-27|0

--c

.mode column

.width 15 15 15 15 15

SELECT * FROM MyRestaurants;

ching            chinese          5                2017-02-01       1              
ting             thai             15               2017-01-22       0              
Dicks            burger           15               2017-01-27       1              
Chux             bbq              29               2017-03-17                    
Sticks           salad            58               2016-01-27       1 

--d

Name             Type             Distance         Date             Like           
---------------  ---------------  ---------------  ---------------  ---------------
ching            chinese          5                2017-02-01       1              
ting             thai             15               2017-01-22       0              
Dicks            burger           15               2017-01-27       1              
Chux             bbq              29               2017-03-17                    
Sticks           salad            58               2016-01-27       1 

Name,Type,Distance,Date,Like
ching,chinese,5,2017-02-1,1
ting,thai,15,2017-01-22,0
Dicks,burger,15,2017-01-27,1
Chux,bbq,29,2017-03-17,
Sticks,salad,58,2016-01-27,0


Name|Type|Distance|Date|Like
ching|chinese|5|2017-02-11|1
ting|thai|15|2017-01-22|0
Dicks|burger|15|2017-01-27|1
Chux|bbq|29|2017-03-17|
Sticks|salad|58|2016-01-27|0

--Question5:

SELECT Name, Distance
FROM MyRestaurants
WHERE Distance <= 20;

Name|Distance
ching|5
ting|15
Dicks|15

--Question6:

SELECT * FROM MyRestaurants WHERE Date < date('now', '-3 month');

Name|Type|Distance|Date|Like
Sticks|salad|58|2016-01-27|0
