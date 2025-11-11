--  question: Get me all the products per vendor that have a price rank of 1.
select
product_id,
vendor_id,
original_price,
rank() over(partition by vendor_id order by original_price desc) as price_rank
from vendor_inventory
order by original_price desc;

-- Question: Divide the rows into a number of buckets based on a NTILE function 
select 
product_id,
vendor_id,
market_date,
original_price,
ntile(10) over(order by original_price) as bins
from vendor_inventory;

-- Question: As a farmer, you want to figure out which of your products were above the average price on each market date?
select
vendor_id,
market_date,
product_id,
original_price,
avg(original_price)  over(partition by market_date) as average_cost_product_by_market_date
from farmers_market.vendor_inventory;

--  Question: Extract the farmer’s products with prices above the market date’s average product cost for vendor id 8?
select * from
(select
vendor_id,
market_date,
product_id,
original_price,
round(avg(original_price) over(partition by  market_date order by  market_date), 2) as average_cost
from farmers_market.vendor_inventory )x
where  x.vendor_id = 8 and x.original_price > x.average_cost
order by  x.market_date, x.original_price desc;

-- Question: Count how many different products each vendor brought to market on each date and display the count for each row. 
select
count(product_id) over(partition by vendor_id order by market_date) as count_of_product,
vendor_id,
market_date,
original_price
from vendor_inventory
order by vendor_id,market_date,original_price;

-- Question: Calculate the moving average on a window frame of 1 preceding and 1 following. 
select 
month(date),
sum(sale),
avg(sum(sale)) over(order by month(date) range between 1 preceding and 1 following) as moving_avg
from sales 
group by month(date);

-- Question: Using the vendor_booth_assignments table in the Farmer’s Market database, display each vendor’s booth assignment 
-- for each market_date alongside their previous booth assignments.
 select
 market_date,
 lag(booth_number,1) over(partition by vendor_id ) as previous_booth_assignment,
 booth_number,
 vendor_id
 from vendor_booth_assignments
 order by market_date, vendor_id,booth_number;
 
-- Question: Let’s say you want to find out if the total sales on each market date are higher or lower than they were on the previous market date.
select
market_date,
round(sum(quantity * cost_to_customer_per_qty),2) as market_date_total_sales,
round(lag(sum(quantity * cost_to_customer_per_qty), 1) over(order by  market_date),2) as previous_market_date_total_sales
from  farmers_market.customer_purchases
group by market_date;



 




