-- Question: We want to merge each customer’s name into a single column that contains the first name, then a space, and then the last name 
select
customer_id,
concat(customer_first_name," ",customer_last_name) as full_name
 from customer;
 
 -- Question: In a customer’s full_name, we want the first_name to be in upper case followed by the last_name as it is. select
select
customer_id,
CONCAT(UPPER(customer_first_name), " ", customer_last_name) AS full_name
from customer;

-- Question: What if we only want to display a subset of a string? 
select
customer_id,
CONCAT(UPPER(customer_first_name), " ", SUBSTR(customer_last_name, 1, 1)) AS full_name
from customer;

-- Question: Extract all the product names that are part of product category 1
select
* 
from product
where product_category_id = 1;

-- Question : what if we want all the product names that are part of any other product category except 1? 
select
*
from product
where product_category_id <> 1;

-- Question: Print a report of everything the customer_id 4 has ever purchased
--  at the market, sorted by date. Add total_amt column as well for each purchase. 
select
customer_id,
market_date,
round(cost_to_customer_per_qty*quantity,2) full_price
from customer_purchases
where customer_id = 4
order by market_date;

-- Question: Get all the product info for products with id between 3 and 8 (not inclusive) and of products with id 10.
select 
*
from product
where product_id between 3 and 8 or product_id = 10;

-- Question: Find the booth assignments for vendor_id 7 for all dates between April 3, 2019 and May 16, 2019, including the 2 dates.
select
*
from vendor_booth_assignments
where vendor_id = 7 and market_date >= 2019-04-03 and market_date <= "2019-05-16";

-- Question: Return a list of customers with the following last names: [Diaz, Edwards, Wilson]
select 
customer_id,
customer_first_name,
customer_last_name
from customer 
where customer_last_name in ("Diaz","Edward","Wilson");

-- Question: What if we want a list of all customers except those with the last names: [Diaz, Edwards, Wilson]
select 
customer_id,
customer_first_name,
customer_last_name
from customer 
where customer_last_name not in ("Diaz","Edward","Wilson");

-- Question: You want to get data about a customer you knew as Jerry but you are not sure if
--  they are listed as Jeremy or Jeremiah or Jerry. Get all customers whose name starts with “jer”
select
*
from customer
where customer_first_name like "%Jer%";

 