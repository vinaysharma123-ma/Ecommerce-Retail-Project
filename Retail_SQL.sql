create database primeor;

use primeor;
 -- check tables details
select*from dataanalysis_retail3;

-- check all rows/records
SELECT COUNT(*) AS total_rows
FROM dataanalysis_retail3;

-- check columns
 SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'dataanalysis_retail3';


-- E-COMMERCE  SQL ANALYSIS


-- 1. TOP 10 PROFITABLE PRODUCTS
SELECT Product_Name,SUM(Profit) AS Total_Profit
FROM dataanalysis_retail3
GROUP BY Product_Name
ORDER BY Total_Profit DESC
limit 10 ;



-- 2. TOP 10 CUSTOMERS BY SALES
SELECT Customer_Name,SUM(Sales) AS Total_Sales
FROM dataanalysis_retail3
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
Limit 10;


-- 3. REGION-WISE TOTAL SALES
SELECT Region,SUM(Sales) AS Total_Sales
FROM dataanalysis_retail3
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 4. CATEGORY-WISE AVERAGE PROFIT
SELECT Category,AVG(Profit) AS Average_Profit
FROM dataanalysis_retail3
GROUP BY Category
ORDER BY Average_Profit DESC;


-- 5. HIGHEST DISCOUNT CATEGORY
SELECT Category,AVG(Discount) AS Average_Discount
FROM dataanalysis_retail3
GROUP BY Category
ORDER BY Average_Discount DESC;


-- 6. ORDERS WITH NEGATIVE PROFIT

SELECT
    Order_ID,
    Order_Date,
    Customer_Name,
    Product_Name,
    Sales,
    Profit
FROM dataanalysis_retail3
WHERE Profit < 0
ORDER BY Profit desc;



-- 7. MONTHLY SALES TREND
SELECT
    FORMAT(Order_Date, 'yyyy-MM') AS Sales_Month,
    SUM(Sales) AS Total_Sales
FROM dataanalysis_retail3
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Sales_Month;


-- 8. MARKET-WISE REVENUE ANALYSIS
SELECT Market,SUM(Sales) AS Total_Revenue,SUM(Profit) AS Total_Profit
FROM dataanalysis_retail3
GROUP BY Market
ORDER BY Total_Revenue DESC;


-- 9. TOP-PERFORMING SUB-CATEGORIES
SELECT Sub_Category,SUM(Sales) AS Total_Sales,SUM(Profit) AS Total_Profit
FROM dataanalysis_retail3
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;


-- 10. SHIP MODE USAGE ANALYSIS
SELECT Ship_Mode,COUNT(*) AS Total_Orders,ROUND(COUNT(*) * 100.0 /SUM(COUNT(*)) OVER (),2) AS Usage_Percentage
FROM dataanalysis_retail3
GROUP BY Ship_Mode
ORDER BY Total_Orders DESC;



-- SQL Analysis insights

-- Which market generates highest revenue?
## The Apac Market genereated highest reveneue with better profit.
## The values are - APAC	84894	4650.574200000004

-- Which categories are least profitable?
## the Office Supplies gained least profit in category list.
## The values are - Technology	21.7069935323383

-- Which shipping mode is most commonly used?
## The Standard Class ship_mode commonly use in this retail workshop.
## The values are - Standard Class	1269	58.83