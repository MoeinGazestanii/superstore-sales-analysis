-- Best region sales
SELECT
    Region, count(distinct Order_ID) AS unique_orders,
    round(sum(Sales), 2) AS total_sales,
    round(
        sum(Sales) / count(distinct Order_ID),
        2
    ) AS avg_order_value
FROM superstore
group by Region
order by total_sales DESC;

-- Best category sales
SELECT
    Category, count(distinct Order_ID) AS unique_orders,
    round(sum(Sales), 2) AS total_sales,
    round(
        sum(Sales) / count(DISTINCT Order_ID),
        2
    ) AS avg_order_value
from superstore
group by Category
order by total_sales DESC;


-- Customer with highest number of orders
SELECT TOP 1
    Customer_ID, Customer_Name,
    count(distinct Order_ID) AS unique_orders,
    round(sum(Sales), 2) AS total_sales,
    round(
        sum(Sales) / count(distinct Order_ID),
        2
    ) AS avg_order_value
FROM superstore
group by Customer_ID, Customer_Name
order by total_sales DESC;



-- Sales trend over time
WITH monthly_sales AS (
    SELECT
        year(Order_Date) AS order_year, month(Order_Date) AS order_month,
        round(sum(Sales), 2) AS total_sales
    FROM superstore
    group by
        year(Order_Date),
        month(Order_Date)
),
sales_trend AS (
    SELECT
        order_year, order_month, total_sales,
        LAG(total_sales) OVER (
            order by order_year, order_month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    order_year, order_month, total_sales, previous_month_sales,
    round(
        total_sales - previous_month_sales,
        2
    ) AS sales_change,
    round(
        (total_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0) * 100,
        2
    ) AS sales_change_percent
FROM sales_trend
order by order_year, order_month;