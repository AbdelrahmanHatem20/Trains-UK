--###############################--

SELECT * FROM depi_data


--###############################--

SELECT 

transaction_id,
date_of_purchase,
time_of_purchase,
d.purchase_type,
p.purchase_type_id,

d.railcard,
railcard_id,

d.ticket_class,
ticket_class_id,

d.ticket_type,
ticket_type_id,

price,

d.departure_station,
s.station_id AS departure_station_id,

d.arrival_destination,
ss.station_id AS arrival_station_id,

d.date_of_journey,
d.departure_time,
d.arrival_time,
d.actual_arrival_time,
d.journey_status,
d.reason_for_delay,

CONCAT(d.departure_station,
d.arrival_destination,
d.date_of_journey,
d.departure_time,
d.arrival_time,
d.actual_arrival_time,
d.journey_status,
d.reason_for_delay) AS join_key,

journey_id,
refund_request


INTO fact

FROM depi_data AS d

LEFT JOIN purchase_type as p ON d.purchase_type = p.purchase_type
LEFT JOIN railcard AS r ON d.railcard = r.railcard
LEFT JOIN ticket_type AS t ON d.ticket_type = t.ticket_type
LEFT JOIN ticket_class AS tc ON d.ticket_class = tc.ticket_class
LEFT JOIN stations AS s ON d.departure_station = s.station_name
LEFT JOIN stations AS ss ON d.arrival_destination = ss.station_name
LEFT JOIN journeys AS j ON journey_join_key = CONCAT(d.departure_station, d.arrival_destination, d.date_of_journey, d.departure_time, d.arrival_time, d.actual_arrival_time, d.journey_status, d.reason_for_delay)


--###############################--

SELECT * FROM fact

--###############################--

ALTER TABLE FACT
DROP COLUMN PURCHASE_TYPE, RAILCARD, TICKET_CLASS, TICKET_TYPE, DEPARTURE_STATION, ARRIVAL_DESTINATION, DATE_OF_JOURNEY, DEPARTURE_TIME, ARRIVAL_TIME, ACTUAL_ARRIVAL_TIME, JOURNEY_STATUS, REASON_FOR_DELAY, JOIN_KEY

--###############################--

ALTER TABLE fact
ADD PRIMARY KEY (transaction_id)
