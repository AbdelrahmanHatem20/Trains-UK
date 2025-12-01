--###############################--

SELECT * FROM depi_data


--###############################--

SELECT DISTINCT

Ticket_Type 

INTO ticket_type
FROM depi_data

ORDER BY Ticket_Type ASC

--###############################--

SELECT * FROM Ticket_Type

--###############################--

SELECT * FROM Ticket_Type

ALTER TABLE Ticket_Type ADD ticket_type_id INT

DECLARE @id INT = 0

UPDATE Ticket_Type
SET @id = ticket_type_id = @id + 1

--###############################--

ALTER TABLE Ticket_Type
ALTER COLUMN ticket_type_id INT NOT NULL;

ALTER TABLE Ticket_Type
ADD PRIMARY KEY (ticket_type_id)