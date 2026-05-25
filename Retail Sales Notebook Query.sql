-- Databricks notebook source
-- DBTITLE 1,Comprehensive Retail Sales Data Exploration and Metrics ...
-- Table Overview --

SELECT *
FROM workspace.default.retail_sales_data;

SELECT *
FROM workspace.default.retail_sales_data
LIMIT 10;

-- Total Records --

SELECT COUNT(*) AS total_records
FROM workspace.default.retail_sales_data;

 -- Checking For NULL Values --

SELECT *
FROM workspace.default.retail_sales_data
WHERE `Transaction ID` IS NULL
   OR `Date` IS NULL
   OR `Customer ID` IS NULL
   OR `Gender` IS NULL
   OR `Age` IS NULL
   OR `Product Category` IS NULL
   OR `Quantity` IS NULL
   OR `Price per Unit` IS NULL
   OR `Total Amount` IS NULL;

-- Age Group --

SELECT `Customer ID`,
        `Age`,
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group
FROM workspace.default.retail_sales_data;

-- Age Group Spending Behaviour --

SELECT 
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,

    ROUND(SUM(`Total Amount`), 2) AS total_spending,

    ROUND(AVG(`Total Amount`), 2) AS average_spending,

    COUNT(`Transaction ID`) AS total_transactions

FROM workspace.default.retail_sales_data

GROUP BY 
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END

ORDER BY total_spending DESC;

-- Revenue per Product --

SELECT `Transaction ID`,
       `Product Category`,
       `Quantity`,
       `Price per Unit`,
       (`Quantity` * `price per Unit`) AS calculated_revenue
FROM workspace.default.retail_sales_data;

-- Total Revenue Generated --

SELECT
    SUM(`Total Amount`) AS total_revenue
FROM workspace.default.retail_sales_data;

-- Quantity Sold --

SELECT
    SUM(`Quantity`) AS total_quantity_sold
FROM workspace.default.retail_sales_data;

-- Average Transaction Value --

SELECT
    ROUND(AVG(`Total Amount`), 2) AS average_transaction_value
FROM workspace.default.retail_sales_data;

-- Revenue by Product Category --

SELECT
    `Product Category`,
    SUM(`Total Amount`) AS total_revenue
FROM workspace.default.retail_sales_data
GROUP BY `Product Category`
ORDER BY total_revenue DESC;

-- Total Sales By Gender --

 SELECT Gender,
        SUM(`Total Amount`) AS total_sales
FROM workspace.default.retail_sales_data
GROUP BY Gender;

-- Average Spending by Age Group --

SELECT
CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
ELSE '60+'
END AS age_group,
ROUND(AVG(`Total Amount`), 2) AS average_spending
FROM workspace.default.retail_sales_data
GROUP BY age_group
ORDER BY average_spending DESC;

-- Top 10 Highest Transactions --

SELECT `Transaction ID`,
       `Customer ID`,
       `Product Category`,
       `Total Amount`
FROM workspace.default.retail_sales_data
ORDER BY `Total Amount` DESC
LIMIT 10;

-- Monthly Revenue Analysis --

SELECT MONTH(`Date`) AS sales_month,
       SUM(`Total Amount`) AS monthly_revenue
FROM workspace.default.retail_sales_data
GROUP BY sales_month
ORDER BY sales_month;

-- Best Selling Product Categories --

SELECT `Product Category`,
       SUM(`Quantity`) AS total_units_sold
FROM workspace.default.retail_sales_data
GROUP BY `Product Category`
ORDER BY total_units_sold DESC;

-- Customer Purchase Frequency --

SELECT `Customer ID`,
        COUNT(`Transaction ID`) AS total_transactions,
        SUM(`Total Amount`) AS total_customer_spending
FROM workspace.default.retail_sales_data
GROUP BY `Customer ID`
ORDER BY total_customer_spending DESC;

-- Running Total Revenue --

SELECT `Date`,
       `Total Amount`,
        SUM(`Total Amount`) OVER (ORDER BY `Date`) AS running_total_revenue
FROM workspace.default.retail_sales_data;

-- Rank Product Categories by Revenue --

SELECT `Product Category`,
        SUM(`Total Amount`) AS total_revenue,
        RANK() OVER (ORDER BY SUM(`Total Amount`) DESC) AS revenue_rank
FROM workspace.default.retail_sales_data
GROUP BY `Product Category`;

-- Common Table Expression (CTE) Analysis --

WITH category_sales AS (SELECT`Product Category`,
    SUM(`Total Amount`) AS total_sales
FROM workspace.default.retail_sales_data
GROUP BY `Product Category`)
SELECT *
FROM category_sales
ORDER BY total_sales DESC;

-- Daily Revenue Trends --

SELECT`Date` AS transaction_date,
      SUM(`Total Amount`) AS daily_revenue
FROM workspace.default.retail_sales_data
GROUP BY transaction_date
ORDER BY transaction_date;

-- Highest Spending Customers --

SELECT `Customer ID`,
        ROUND(SUM(`Total Amount`), 2) AS total_spent
FROM workspace.default.retail_sales_data
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;

-- Average Quantity Purchased Per Transaction --

SELECT ROUND(AVG(`Quantity`), 2) AS average_quantity_purchased
FROM workspace.default.retail_sales_data;

-- Most Profitable Product Category --

SELECT `Product Category`,
        ROUND(AVG(`Total Amount`), 2) AS average_revenue_per_transaction
FROM workspace.default.retail_sales_data
GROUP BY `Product Category`
ORDER BY average_revenue_per_transaction DESC;

-- Sales Distribution by Gender and Product Category --

SELECT Gender,
       `Product Category`,
       SUM(`Total Amount`) AS total_sales
FROM workspace.default.retail_sales_data
GROUP BY gender, `Product Category`
ORDER BY total_sales DESC;

-- Identify Repeat Customers --

SELECT `Customer ID`,
       COUNT(*) AS purchase_count
FROM workspace.default.retail_sales_data
GROUP BY `Customer ID`
HAVING COUNT(*) > 1
ORDER BY purchase_count DESC;

-- NOTE: There are no repeat customers --

-- Revenue Contribution Percentage by Product Category --

SELECT `Product Category`,
        ROUND(SUM(`Total Amount`) * 100.0 /(SELECT SUM(`Total Amount`) 
FROM workspace.default.retail_sales_data),
2) AS revenue_percentage
FROM workspace.default.retail_sales_data
GROUP BY `Product Category`
ORDER BY revenue_percentage DESC;
     


