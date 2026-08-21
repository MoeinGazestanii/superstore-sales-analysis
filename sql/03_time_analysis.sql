-- time analysis
SELECT
    year(Order_Date) AS order_year, round(SUM(Sales), 2) AS total_sales,
    count(DISTINCT Order_ID) AS unique_orders,
    round(SUM(Sales) / count(DISTINCT Order_ID), 2) AS avg_sales_per_order
from superstore
group by YEAR(Order_Date)
order by order_year;

-- monthly
SELECT
    month(Order_Date) AS order_month,
    round(SUM(Sales), 2) AS total_sales,
    count(DISTINCT Order_ID) AS unique_orders
from superstore
group by month(Order_Date)
order by order_month;

-- comparison
WITH monthly_sales AS (
    select
        year(Order_Date) AS order_year,
        month(Order_Date) AS order_month,
        round(sum(Sales), 2) AS total_sales
    from superstore
    group by
        year(Order_Date),
        month(Order_Date)
),
sales_with_previous AS (
    select
        order_year,
        order_month,
        total_sales,
        lag(total_sales) over (
            order by order_year, order_month
        ) AS previous_month_sales
    from monthly_sales
)
select
    order_year,
    order_month,
    total_sales,
    previous_month_sales,
    round(
        total_sales - previous_month_sales,
        2
    ) AS sales_change
from sales_with_previous
order by order_year, order_month;