-- E-Commerce Sales Analysis SQL Queries

-- 1. Total sales and profit
SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM orders;

-- 2. Sales and profit by category
SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;

-- 3. Sales by region
SELECT
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;

-- 4. Monthly sales trend
SELECT
    FORMAT(Order_Date, 'yyyy-MM') AS sales_month,
    SUM(Sales) AS monthly_sales,
    SUM(Profit) AS monthly_profit
FROM orders
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY sales_month;

-- 5. Average discount and profit by category
SELECT
    Category,
    ROUND(AVG(Discount_Pct), 2) AS avg_discount_pct,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Category
ORDER BY avg_discount_pct DESC;

-- 6. Payment method contribution
SELECT
    Payment_Method,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY Payment_Method
ORDER BY total_sales DESC;

-- 7. Top 5 cities by sales
SELECT TOP 5
    City,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY City
ORDER BY total_sales DESC;
