-- 1. Database Creation
CREATE DATABASE SalesData;
USE SalesData;

CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);

-- 2. Data Creation
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(101, 'East', '2024-01-05', 500),
(102, 'West', '2024-01-06', 700),
(103, 'East', '2024-01-07', 300),
(101, 'North', '2024-01-08', 400),
(102, 'South', '2024-01-09', 600),
(103, 'West', '2024-01-10', 350),
(101, 'South', '2024-01-11', 450),
(102, 'East', '2024-01-12', 800),
(103, 'North', '2024-01-13', 550),
(101, 'West', '2024-01-14', 900);

-- 3. Perform OLAP Operations

-- a) Drill Down: Region to Product Level Sales
SELECT 
    Region,
    Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    Region, Product_Id
ORDER BY 
    Region, Product_Id;

-- b) Rollup: Total Sales by Region and Product
SELECT 
    Region,
    Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    Region, Product_Id WITH ROLLUP;

-- c) Cube: Total Sales by Product, Region, and Date

-- CUBE equivalent via UNION in MySQL

-- Group by Product_Id, Region, Date
SELECT 
    Product_Id,
    Region,
    Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Product_Id, Region, Date

UNION

-- Group by Product_Id and Region
SELECT 
    Product_Id,
    Region,
    NULL AS Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Product_Id, Region

UNION

-- Group by Product_Id and Date
SELECT 
    Product_Id,
    NULL AS Region,
    Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Product_Id, Date

UNION

-- Group by Region and Date
SELECT 
    NULL AS Product_Id,
    Region,
    Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Date

UNION

-- Group by Product_Id only
SELECT 
    Product_Id,
    NULL AS Region,
    NULL AS Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Product_Id

UNION

-- Group by Region only
SELECT 
    NULL AS Product_Id,
    Region,
    NULL AS Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region

UNION

-- Group by Date only
SELECT 
    NULL AS Product_Id,
    NULL AS Region,
    Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Date

UNION

-- Grand Total
SELECT 
    NULL AS Product_Id,
    NULL AS Region,
    NULL AS Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample;

-- d) Slice: Sales data for Region 'East'
SELECT 
    *
FROM 
    sales_sample
WHERE 
    Region = 'East';

-- e) Dice: Sales for specific Products, Regions, and Date Range
SELECT 
    *
FROM 
    sales_sample
WHERE 
    Product_Id IN (101, 102)
    AND Region IN ('East', 'West')
    AND Date BETWEEN '2024-01-05' AND '2024-01-12';