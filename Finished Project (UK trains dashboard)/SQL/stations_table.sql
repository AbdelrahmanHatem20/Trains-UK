--###############################--

SELECT * FROM depi_data


--###############################--

SELECT DISTINCT

Arrival_Destination

FROM depi_data
ORDER BY Arrival_Destination ASC

--###############################--

SELECT DISTINCT

Departure_Station

FROM depi_data
ORDER BY Departure_Station ASC

--###############################--

SELECT DISTINCT Departure_Station AS station_name 
INTO stations

FROM depi_data
UNION
SELECT DISTINCT Arrival_Destination FROM depi_data

ORDER BY station_name ASC

--###############################--

SELECT * FROM stations

--###############################--

SELECT * FROM stations

ALTER TABLE stations ADD station_id INT

DECLARE @id INT = 0

UPDATE stations
SET @id = station_id = @id + 1

--###############################--

ALTER TABLE stations
ALTER COLUMN station_id INT NOT NULL;


ALTER TABLE stations
ADD PRIMARY KEY (station_id)
