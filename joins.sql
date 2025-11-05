-- Question: List all the products along with their product category name.
select
*
from product p left join product_category pc on 
p.product_category_id = p.product_category_id;

-- Q1. Get all the customers who haven’t purchased anything from the market yet.
select *
from farmers_market.customer AS c
left join farmers_market.customer_purchases as  cp
on c.customer_id = cp.customer_id;
      
--  Q2. Get all the customers who have deleted their account from the market.
select *
from farmers_market.customer as c
right join farmers_market.customer_purchases as cp
on c.customer_id = cp.customer_id;

-- Question: Let’s say we want details about all farmer’s market booths and every vendor booth assignment for every market date. 
select
b.booth_number, b.booth_type,
vba.market_date,
v.vendor_id, v.vendor_name, v.vendor_type
from  farmers_market.booth as b
left join  farmers_market.vendor_booth_assignments as  vba
on b.booth_number = vba.booth_number
left join farmers_market.vendor as v 
on  v.vendor_id = vba.vendor_id
order by b.booth_number, vba.market_date;







 
 