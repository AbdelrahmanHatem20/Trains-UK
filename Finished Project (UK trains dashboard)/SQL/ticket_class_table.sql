--###############################--

SELECT * FROM depi_data


--###############################--

SELECT DISTINCT

Ticket_Class 

INTO ticket_class
FROM depi_data

ORDER BY Ticket_Class ASC

--###############################--

SELECT * FROM Ticket_Class

--###############################--

SELECT * FROM Ticket_Class

ALTER TABLE Ticket_Class ADD ticket_class_id INT

DECLARE @id INT = 0

UPDATE Ticket_Class
SET @id = ticket_class_id = @id + 1

--###############################--

ALTER TABLE Ticket_Class
ALTER COLUMN ticket_class_id INT NOT NULL;

ALTER TABLE Ticket_Class
ADD PRIMARY KEY (ticket_class_id)