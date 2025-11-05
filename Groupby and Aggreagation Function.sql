-- Question: ​​We want to get the most and least expensive items available in the vendor’s inventory.
select
max(original_price) as max_price,
min(original_price) as min_price
from vendor_inventory;

-- Question: ​​We want to calculate how much revenue has been generated in total by purchases made by our customers. 
select 
round(sum(cost_to_customer_per_qty*quantity),2) as revenue
from customer_purchases;

-- Question: ​​We want to find out the average quantity of products purchased by the customers on the date ‘2019-05-01’.
select
round(avg(quantity),2) as avg_quatity
from customer_purchases
where market_date = "2019-05-01";

-- Question: We want to know the total number of purchases that happened during the second quarter of the year 2019.
select
count(*) as total_purchase
from customer_purchases
where market_date between "2019-04-01" and "2019-06-30";

--  Question: What if we ask you to get the number of unique customers who made 
-- any purchases during the second quarter of the year 2019.
select
count(distinct customer_id) as total_purchase
from customer_purchases
where market_date between "2019-04-01" and "2019-06-30";

-- Question: Get a list of the customers who made purchases on each market date.
select
customer_id,
market_date
from customer_purchases
group by market_date,customer_id
order by market_date ,customer_id;

-- Question: Count the number of purchases each customer made per market date.
 select
 market_date,
 customer_id,
 count(customer_id)
 from customer_purchases
 group by market_date,customer_id
 order by market_date,customer_id;
 
 --  Question: Calculate the total quantity purchased by each customer per market_date.
select
sum(quantity) as total_purchase,
customer_id,
market_date
from customer_purchases 
group by market_date,customer_id
order by market_date,customer_id;

--  question: How many different kinds of products were purchased by each customer on each market date?
select
count(distinct product_id) as cnt_product,
customer_id,
market_date
from customer_purchases
group by product_id,market_date,customer_id
order by product_id,market_date,customer_id;

-- Question: Calculate the total price paid by customer_id 3 per market_date.
 select
 round(sum(quantity*cost_to_customer_per_qty),2) as total_price,
 market_date
 from customer_purchases
 where customer_id = 3
 group by market_date
 order by market_date;
 
 -- Question: What if we wanted to determine how much this customer had spent at each vendor, regardless of date? 
select
customer_id,
vendor_id,
round(sum(cost_to_customer_per_qty*quantity),2) as total_amount_spend
from customer_purchases
group by vendor_id,customer_id
order by vendor_id,customer_id;

-- Question: Count how many products were for sale on each market date, or how many different products each vendor offered.
select
count(distinct product_id),
vendor_id
market_date
from customer_purchases
group by market_date,vendor_id
order by market_date,vendor_id;

-- Question: In addition to the count of different products per vendor, we also want the average original price of a product per vendor? 
 select
 count(distinct product_id) as product_per_vendor,
 round(avg(cost_to_customer_per_qty*quantity),2) as avg_orignal_price,
 vendor_id
 from customer_purchases
 group by vendor_id,product_id
 order by vendor_id;
 

 

