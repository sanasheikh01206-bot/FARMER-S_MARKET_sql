-- Questions: Your manager wants to see all the unique customer IDs present in the `customer_purchases` table. How would you get this data? 
select 
distinct customer_id
from customer;

-- Question: Find all of the products from the `product` table which don’t have their sizes mentioned.
select * from product
where product_size is null  or trim(product_size) = "";

-- Question: What if you’re asked to fetch all the product IDs from the `products` table and set a default value “medium” in rows where the product size is NULL?
select 
*,
if(product_size is null or trim(product_size) = "",product_size = "medium" ,product_size) as new_product_size
from product ;

-- Question : write a query that gets a list of market dates when it rained
 select 
market_date
 from market_date_info
 where market_rain_flag = 1;
 
 -- Question: List down all the product details where product_category_name contains “Fresh” in it. 
select * from product 
where product_category_id in 
(select product_category_id 
from product_category
where product_category_name like "Fresh%");

-- Question: Find out which vendors primarily sell fresh products and which don’t. 
select 
vendor_id,
vendor_name,
vendor_type,
case 
when vendor_type like "%Fresh%" then "Fresh Produce"
else "Others" end as fresh_produce_check
from vendor;

-- What if we want to add 1 for vendors who sell fresh products and 0 for those who don’t?
select 
vendor_id,
vendor_name,
vendor_type,
case 
when vendor_type like "%Fresh%" then 1
else 0 end as fresh_produce_check
from vendor;

-- Question: Put the total cost to customer purchases into bins of -
-- ● under $5.00, 
-- ● $5.00–$9.99, 
-- ● $10.00–$19.99, or 
-- ● $20.00 and over. 
select 
market_date,
customer_id,
round(quantity*cost_to_customer_per_qty,2) as total_cost,
case 
when round(quantity*cost_to_customer_per_qty,2) < 5 then "under 5"
when round(quantity*cost_to_customer_per_qty,2) between 5.00 and 9.99 then "between 5 & 9"
when round(quantity*cost_to_customer_per_qty,2) between 10.00 and 19.99 then "between 10 & 19"
else "above 20" end as price_category
from customer_purchases;

 
