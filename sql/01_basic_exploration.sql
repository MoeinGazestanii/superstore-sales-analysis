-- Rows
select count(*) as records from superstore

-- Unique orders
select count(DISTINCT Order_ID) as unique_order from superstore

-- Basic view
select min(Order_Date) as oldest_order, Max(Order_Date) as Newewst_order from superstore

-- unique customers
select count(DISTINCT Customer_ID) as uniquecustomers from superstore

-- missing value overview
SELECT 
    count(CASE WHEN Customer_ID IS NULL THEN 1 END)       AS null_Custid,
    count(CASE WHEN Order_ID IS NULL THEN 1 END) AS null_orderid,
    count(CASE WHEN Order_Date IS NULL THEN 1 END)      AS null_orderdate,
    count(CASE WHEN Ship_Date IS NULL THEN 1 END)      AS null_Ship_Date
FROM superstore;