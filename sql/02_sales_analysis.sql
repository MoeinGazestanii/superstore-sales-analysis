-- total sale
select round(sum(Sales),2) as total_sale from superstore

-- sale based each category and region
select Category, Region, round(sum(Sales),2) as total_sale from superstore
group by Category, Region

-- sales based on state
select State, round(sum(Sales),2) as total_sale from superstore
group by state
order by round(sum(Sales),2) DESC, State ASC

-- sales based on product
select top 10
Product_ID, Product_Name,round(sum(Sales),2) as total_sale from superstore
group by Product_ID, Product_Name
order by round(sum(Sales),2) DESC


