-- check for null values in important columns

SELECT
    count(CASE when Order_ID IS NULL THEN 1 END) AS null_order_id,
    count(CASE when Order_Date IS NULL THEN 1 END) AS null_order_date,
    count(CASE when Ship_Date IS NULL THEN 1 END) AS null_ship_date,
    count(CASE when Customer_ID IS NULL THEN 1 END) AS null_customer_id,
    count(CASE when Product_ID IS NULL THEN 1 END) AS null_product_id,
    count(CASE when Sales IS NULL THEN 1 END) AS null_sales
FROM superstore;


-- check for duplicate values
SELECT
    Order_ID, Product_ID,
    count(*) AS duplicate_count
FROM superstore
group by Order_ID, Product_ID
having COUNT(*) > 1
order by duplicate_count DESC;



-- invalid sales values
SELECT COUNT(*) AS invalid_sales_rows
FROM superstore
WHERE Sales IS NULL
   OR Sales < 0;



-- invalid dates
SELECT count(*) AS invalid_date_rows
from superstore
where Order_Date IS NULL
   OR Ship_Date IS NULL
   OR Ship_Date < Order_Date;



-- check for missing customer information
SELECT count(*) AS missing_customer_info
from superstore
where Customer_ID IS NULL
   OR Customer_Name IS NULL;