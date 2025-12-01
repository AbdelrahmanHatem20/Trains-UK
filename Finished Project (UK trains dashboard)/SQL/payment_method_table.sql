--###############################--

SELECT * FROM depi_data


--###############################--

SELECT DISTINCT

Payment_method 

INTO payment_method
FROM depi_data

ORDER BY Payment_method ASC

--###############################--

SELECT * FROM payment_method

--###############################--

SELECT * FROM payment_method

ALTER TABLE payment_method ADD payment_method_id INT

DECLARE @id INT = 0

UPDATE payment_method
SET @id = payment_method_id = @id + 1

--###############################--

ALTER TABLE payment_method
ALTER COLUMN payment_method_id INT NOT NULL;

ALTER TABLE payment_method
ADD PRIMARY KEY (payment_method_id)