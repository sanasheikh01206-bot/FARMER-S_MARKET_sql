-- Question: Suppose you wish to know from which year to which year data do we have in our database?
select
max(market_date) as starting_date,
min(market_date) as ending_date
from datetime_demo ;

-- Question: What if you only want to see the hour at which the market started and ended on each date?
select
min(hour(market_start_datetime)) as start_time,
max(hour(market_start_datetime)) as end_time
from datetime_demo;

-- Question: Your manager asks you that for each market date, he wants to see what day & month it was. Display the name of the day & month.
select
month(market_start_datetime) as mth,
dayname(market_start_datetime) as day_name
from datetime_demo; 

-- Question: Suppose you only have the ‘market_start_datetime’ column in the table and you want to view the date and time fields separately.
select
date(market_start_datetime) dt,
time(market_start_datetime) tm
from datetime_demo;

-- Question: Find the number of days between the first and last market dates.
select
datediff(max(market_date),min(market_date)) as date_difference
from datetime_demo;

-- Question: But what if we want the difference between the first and last market dates in hours instead of days?
select
timestampdiff(hour,min(market_start_datetime),max(market_start_datetime)) as time_difference
from datetime_demo ;

-- Question: Create a new column market_date_trans_time that contains market date and transaction time in a proper datetime format.
select
concat(market_date," ",transaction_time)  as datetime_format
from customer_purchases;

-- Question: Write a query that gives us the days between each purchase a customer makes

-- step 1
select
market_date,
lag(market_date,1) over(partition by customer_id order by market_date) as last_purchase,
customer_id
from customer_purchases;
-- step 2
select
customer_id,
market_date,
datediff(market_date,lag(market_date,1) over(partition by customer_id order by market_date)) as diff_days
from customer_purchases;

-- Question: Today’s date is May 31, 2019, and the marketing director of the 
-- farmer’s market wants to give infrequent customers (with only 1 purchase) an incentive to return to the market in April.
select
distinct customer_id,
 market_date
from  customer_purchases
where datediff('2019-05-31', market_date) <= 31;






