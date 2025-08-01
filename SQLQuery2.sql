select * from pizza_sales;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales; -- 1. Total Revenue --

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;  -- 2. Average Order Value --

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;  -- 3. Total Pizzas Sold  --

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;   --  4. Total Orders  --

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /       
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))     --  5. Average Pizzas Per Order  --
AS Avg_Pizzas_per_order
FROM pizza_sales;

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders     --  6. Daily Trend for Total Orders  --
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders    --  7. Hourly Trend for Orders  --
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time);

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT   --  8. Percentage of Sales by Pizza Category  --   
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT    --  9. Percentage of Sales by Pizza Size  --
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold    --  10. Total Pizzas Sold by Pizza Category  --
FROM pizza_sales
GROUP BY pizza_category 
ORDER BY Total_Quantity_Sold DESC;

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold    --  11. Top 5 Best Sellers by Total Pizzas Sold  -- 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold    --  12. Bottom 5 Best Sellers by Total Pizzas Sold  --
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(DW, order_date);


