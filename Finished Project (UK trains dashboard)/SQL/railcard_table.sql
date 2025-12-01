--###############################--

SELECT * FROM depi_data


--###############################--

SELECT DISTINCT

Railcard 

INTO railcard
FROM depi_data

ORDER BY Railcard ASC

--###############################--

SELECT * FROM railcard

--###############################--

SELECT * FROM railcard

ALTER TABLE railcard ADD railcard_id INT

DECLARE @id INT = 0

UPDATE railcard
SET @id = railcard_id = @id + 1

--###############################--

ALTER TABLE railcard
ALTER COLUMN railcard_id INT NOT NULL;

ALTER TABLE railcard
ADD PRIMARY KEY (railcard_id)