--###############################--

SELECT * FROM depi_data


--###############################--

SELECT DISTINCT

Purchase_Type 

INTO purchase_type
FROM depi_data

ORDER BY purchase_type ASC

--###############################--

SELECT * FROM purchase_type

--###############################--

SELECT * FROM purchase_type

ALTER TABLE purchase_type ADD purchase_type_id INT

DECLARE @id INT = 0

UPDATE purchase_type
SET @id = purchase_type_id = @id + 1

--###############################--

ALTER TABLE purchase_type
ALTER COLUMN purchase_type_id INT NOT NULL;

ALTER TABLE purchase_type
ADD PRIMARY KEY (purchase_type_id)