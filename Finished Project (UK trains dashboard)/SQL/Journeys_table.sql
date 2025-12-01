--###############################--

SELECT * FROM depi_data

--###############################--

SELECT DISTINCT

Departure_Station, 
Arrival_Destination, 
Date_of_Journey, 
Departure_Time, 
Arrival_Time, 
Actual_Arrival_Time, 
Journey_Status, 
Reason_for_Delay

--INTO journeys

FROM depi_data

--###############################--

SELECT * FROM journeys

ALTER TABLE journeys ADD journey_id INT

DECLARE @id INT = 0

UPDATE journeys
SET @id = journey_id = @id + 1

--###############################--

ALTER TABLE journeys ADD journey_join_key VARCHAR(140)

--###############################--

UPDATE journeys
SET journey_join_key = 

CONCAT(Departure_Station, 
Arrival_Destination, 
Date_of_Journey, 
Departure_Time, 
Arrival_Time, 
Actual_Arrival_Time, 
Journey_Status, 
Reason_for_Delay)

--###############################--

ALTER TABLE journeys
ALTER COLUMN journey_id INT NOT NULL;

ALTER TABLE journeys
ADD PRIMARY KEY (journey_id)