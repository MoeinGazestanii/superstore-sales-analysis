-- order quantity and sale based on customer
select
    Customer_ID, Customer_Name,
    count(DISTINCT Order_ID) AS unique_orders,
    round(sum(Sales), 2) AS total_sales
from superstore
group by Customer_ID, Customer_Name
Order by total_sales DESC;



-- with average order value 
select TOP 10
    Customer_ID, Customer_Name,
    count(DISTINCT Order_ID) AS unique_orders,
    round(sum(Sales), 2) AS total_sales,
    round(
        sum(Sales) / count(DISTINCT Order_ID),
        2
    ) AS avg_order_value
from superstore
group by Customer_ID, Customer_Name
order by total_sales DESC;



-- based on segment
SELECT Segment, count(DISTINCT Customer_ID) AS unique_customers
FROM superstore
group by Segment
order by unique_customers DESC;