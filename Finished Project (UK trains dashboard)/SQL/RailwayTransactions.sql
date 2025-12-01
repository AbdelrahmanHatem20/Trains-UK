-------------------------------------------------------------
-- CREATE TABLE
-------------------------------------------------------------
CREATE TABLE RailwayTransactions (
    [Transaction ID] NVARCHAR(50),
    [Date of Purchase] DATE,
    [Time of Purchase] TIME,
    [Purchase Type] NVARCHAR(50),
    [Payment Method] NVARCHAR(50),
    [Railcard] NVARCHAR(50),
    [Ticket Class] NVARCHAR(50),
    [Ticket Type] NVARCHAR(50),
    [Price] INT,
    [Departure Station] NVARCHAR(100),
    [Arrival Destination] NVARCHAR(100),
    [Date of Journey] DATE,
    [Departure Time] TIME,
    [Arrival Time] TIME,
    [Actual Arrival Time] TIME,
    [Journey Status] NVARCHAR(50),
    [Reason for Delay] NVARCHAR(200),
    [Refund Request] NVARCHAR(10)
);

-------------------------------------------------------------
-- QUERIES
-------------------------------------------------------------

-- 1) Total Revenue
SELECT SUM([Price]) AS Total_Revenue FROM RailwayTransactions;

-- 2) Avg Ticket Price
SELECT AVG([Price]) AS Avg_Price FROM RailwayTransactions;

-- 3) Revenue by Ticket Type
SELECT [Ticket Type], SUM([Price]) AS Revenue FROM RailwayTransactions
GROUP BY [Ticket Type] ORDER BY Revenue DESC;

-- 4) Revenue by Payment Method
SELECT [Payment Method], SUM([Price]) AS Revenue FROM RailwayTransactions
GROUP BY [Payment Method] ORDER BY Revenue DESC;

-- 5) Revenue by Purchase Type
SELECT [Purchase Type], SUM([Price]) AS Revenue FROM RailwayTransactions
GROUP BY [Purchase Type];

-- 6) Revenue per Day
SELECT [Date of Purchase], SUM([Price]) AS Revenue FROM RailwayTransactions
GROUP BY [Date of Purchase] ORDER BY [Date of Purchase];

-- 7) Revenue per Month
SELECT FORMAT([Date of Purchase], 'yyyy-MM') AS Month, SUM([Price]) AS Revenue
FROM RailwayTransactions
GROUP BY FORMAT([Date of Purchase], 'yyyy-MM')
ORDER BY Month;

-- 8) Count of Trips by Departure Station
SELECT [Departure Station], COUNT(*) AS Trips FROM RailwayTransactions
GROUP BY [Departure Station] ORDER BY Trips DESC;

-- 9) Count of Trips by Arrival Destination
SELECT [Arrival Destination], COUNT(*) AS Trips FROM RailwayTransactions
GROUP BY [Arrival Destination] ORDER BY Trips DESC;

-- 10) Most Common Routes
SELECT [Departure Station], [Arrival Destination], COUNT(*) AS Trips
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Trips DESC;

-- 11) Online vs Station Purchases
SELECT [Purchase Type], COUNT(*) AS Count_Type
FROM RailwayTransactions GROUP BY [Purchase Type];

-- 12) Journey Status Count
SELECT [Journey Status], COUNT(*) AS Count_Status
FROM RailwayTransactions GROUP BY [Journey Status];

-- 13) Delay Reasons Count
SELECT [Reason for Delay], COUNT(*) AS Delay_Count
FROM RailwayTransactions
WHERE [Reason for Delay] IS NOT NULL
GROUP BY [Reason for Delay]
ORDER BY Delay_Count DESC;

-- 14) Refund Requests
SELECT [Refund Request], COUNT(*) AS Count_Refund
FROM RailwayTransactions GROUP BY [Refund Request];

-- 15) Top 10 Highest Ticket Prices
SELECT TOP 10 * FROM RailwayTransactions ORDER BY [Price] DESC;

-- 16) Top 10 Lowest Ticket Prices
SELECT TOP 10 * FROM RailwayTransactions ORDER BY [Price] ASC;

-- 17) Trips per Journey Date
SELECT [Date of Journey], COUNT(*) AS Trips
FROM RailwayTransactions GROUP BY [Date of Journey]
ORDER BY [Date of Journey];

-- 18) Delay in Minutes
SELECT [Transaction ID],
       DATEDIFF(MINUTE, [Arrival Time], [Actual Arrival Time]) AS Delay_Minutes
FROM RailwayTransactions;

-- 19) Avg Delay per Route
SELECT [Departure Station], [Arrival Destination],
       AVG(DATEDIFF(MINUTE, [Arrival Time], [Actual Arrival Time])) AS Avg_Delay
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Avg_Delay DESC;

-- 20) On-Time Performance %
SELECT CAST(
    100.0 * SUM(CASE WHEN [Journey Status] = 'On Time' THEN 1 ELSE 0 END)
    / COUNT(*) AS DECIMAL(5,2)
) AS OnTime_Percentage
FROM RailwayTransactions;

-- 21) Delay Frequency %
SELECT CAST(
    100.0 * SUM(CASE WHEN [Journey Status] = 'Delayed' THEN 1 ELSE 0 END)
    / COUNT(*) AS DECIMAL(5,2)
) AS Delay_Percentage
FROM RailwayTransactions;

-- 22) Revenue by Ticket Class
SELECT [Ticket Class], SUM([Price]) AS Revenue
FROM RailwayTransactions GROUP BY [Ticket Class]
ORDER BY Revenue DESC;

-- 23) Purchase Time Peak Hours
SELECT DATEPART(HOUR, [Time of Purchase]) AS HourOfDay, COUNT(*) AS Purchases
FROM RailwayTransactions
GROUP BY DATEPART(HOUR, [Time of Purchase])
ORDER BY Purchases DESC;

-- 24) Average Price by Ticket Class
SELECT [Ticket Class], AVG([Price]) AS Avg_Price
FROM RailwayTransactions GROUP BY [Ticket Class];

-- 25) Average Price by Route
SELECT [Departure Station], [Arrival Destination], AVG([Price]) AS Avg_Price
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Avg_Price DESC;

-- 26) Count of Payment Methods
SELECT [Payment Method], COUNT(*) AS Total_Uses
FROM RailwayTransactions GROUP BY [Payment Method];

-- 27) Most Expensive Routes
SELECT TOP 20 [Departure Station], [Arrival Destination],
       AVG([Price]) AS Avg_Route_Price
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Avg_Route_Price DESC;

-- 28) Cheapest Routes
SELECT TOP 20 [Departure Station], [Arrival Destination],
       AVG([Price]) AS Avg_Route_Price
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Avg_Route_Price ASC;

-- 29) Total Trips per Payment Method
SELECT [Payment Method], COUNT(*) AS Trips
FROM RailwayTransactions GROUP BY [Payment Method];

-- 30) Journey Time (Scheduled vs Actual)
SELECT [Transaction ID],
       DATEDIFF(MINUTE, [Departure Time], [Arrival Time]) AS Scheduled_Trip_Minutes,
       DATEDIFF(MINUTE, [Departure Time], [Actual Arrival Time]) AS Actual_Trip_Minutes
FROM RailwayTransactions;

-- 31) Peak Travel Dates
SELECT TOP 15 [Date of Journey], COUNT(*) AS Trips
FROM RailwayTransactions
GROUP BY [Date of Journey] ORDER BY Trips DESC;

-- 32) Average Delay per Day
SELECT [Date of Journey],
       AVG(DATEDIFF(MINUTE, [Arrival Time], [Actual Arrival Time])) AS Avg_Delay
FROM RailwayTransactions
GROUP BY [Date of Journey]
ORDER BY Avg_Delay DESC;

-- 33) Revenue per Route
SELECT [Departure Station], [Arrival Destination], SUM([Price]) AS Route_Revenue
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Route_Revenue DESC;

-- 34) Ticket Type Count
SELECT [Ticket Type], COUNT(*) AS Count_Tickets
FROM RailwayTransactions
GROUP BY [Ticket Type]
ORDER BY Count_Tickets DESC;

-- 35) Railcard Usage
SELECT [Railcard], COUNT(*) AS Uses
FROM RailwayTransactions
GROUP BY [Railcard]
ORDER BY Uses DESC;

-- 36) Standard vs First Class Revenue
SELECT [Ticket Class], SUM([Price]) AS Revenue
FROM RailwayTransactions GROUP BY [Ticket Class];

-- 37) Customer Refund Ratio
SELECT CAST(
    100.0 * SUM(CASE WHEN [Refund Request] = 'Yes' THEN 1 ELSE 0 END)
    / COUNT(*) AS DECIMAL(5,2)
) AS Refund_Rate
FROM RailwayTransactions;

-- 38) Delayed vs Non-Delayed Revenue
SELECT [Journey Status], SUM([Price]) AS Revenue
FROM RailwayTransactions GROUP BY [Journey Status];

-- 39) Delay Count per Route
SELECT [Departure Station], [Arrival Destination], COUNT(*) AS Delays
FROM RailwayTransactions
WHERE [Journey Status] = 'Delayed'
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Delays DESC;

-- 40) Fastest Routes (by actual duration)
SELECT TOP 20 [Departure Station], [Arrival Destination],
       AVG(DATEDIFF(MINUTE, [Departure Time], [Actual Arrival Time])) AS Avg_Trip_Time
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Avg_Trip_Time ASC;

-- 41) Slowest Routes
SELECT TOP 20 [Departure Station], [Arrival Destination],
       AVG(DATEDIFF(MINUTE, [Departure Time], [Actual Arrival Time])) AS Avg_Trip_Time
FROM RailwayTransactions
GROUP BY [Departure Station], [Arrival Destination]
ORDER BY Avg_Trip_Time DESC;
