-- Queries  SQL
-- Sales & Revenue Analysis - SQL Queries

--  1 Which product category is making us the most money?
select category,sum(quantity*unit_price) as total_revenue
from products p join  order_items oi on p.product_id=oi.product_id
group by category ;
 -- WE GAINING MASSIVE REVENUE FROM TOP TWO CATEGORIESS ELECTRONICS  AROUND 9354296 ,THEN WE ARE HAVING FURNITURE REVENUE AROUND 6401418 AND LEAST IS FROM GROCERIES 4995163

-- 2 Are we selling a lot of cheap stuff, or is our revenue coming from fewer expensive items?
select category  ,sum(quantity) as total_quantity 
from products p join  order_items oi on p.product_id=oi.product_id
group by category ;
 -- AS THE ELETRONICS QUANTITY SOLD MOST IS 287 AND GROCERIES ARE 234 THE LEAST IS CLOTHING 169 
 
--  3 Are our sales growing or shrinking quarter to quarter?
select   year(o.order_date) as sales_year
,quarter(o.order_date) as sales_quarter,SUM(oi.quantity * oi.unit_price) AS quarterly_revenue
,count(distinct o.order_id) total_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id 
group by year(o.order_date), quarter(o.order_date)
order by sales_year, sales_quarter;
-- WE WERE MAINTANING SLAES BUT FROM PAST TWO QUATERS IT DROPS AND MOSTLY THIS QUATER THE SALES IS ALL TIME LOW AT 14 , THE PEAK SALES OF ORU IS 25 IN A QUATER AND NORMALLY BETWEEN 20-25
 
--  4 How many of our experienced staff (5+ years with us) do we still have?
SELECT emp_id,year(curdate())-  YEAR(hire_date) AS tenure 
FROM employees 
WHERE year(curdate()) - YEAR(hire_date) >= 5;
-- WE HAVE ABOUT 19 SUCH EMPLOYEES  
 
-- 5 How big is our product catalog right now?
select  count(product_id) TOTAL_PRODUCTS_TYPE  from products ;
 -- WE HAVE 29 DIFFERENT PRODUCTS 
 
 
 -- 6 What are we about to run out of?
 select  category,product_name, stock_quantity
 from products 
 order by stock_quantity
 limit 10;
 -- WE ARE RUNNIG OF IN FURNITURE PARTICULARLY WE NEED BED FRAMES WE HAVE ZERO RIGHT NOW WE NEED TO RESTOCK IT 
 
 -- 7 What's flying off the shelves fastest?
select p.product_id, product_name , sum(quantity)/stock_quantity as sell_through_ratio 
from products p join order_items oi on p.product_id= oi.product_id
WHERE p.stock_quantity > 0
group by product_id , product_name, stock_quantity
order by sell_through_ratio desc ;
-- WE ARE SELLING THE SOLD AROUNG 81.4 % FORMAL SHIRTS FORM TOTAL SHIRTS AND WE ARE LEAST AT STUDY TABLE JUST 5 % SOLD FROM TOTAL FORMAL SHIRTS 
 
-- 8 Who are our best customers — the ones we can't afford to lose?
select c.customer_id, customer_name, sum(quantity*unit_price) as total_spend
from customers c 
join orders o on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id
group by customer_id  
order by total_spend desc limit 5;
-- WE CANT LOSE VINOD NAIR HE SPENDS ABOUT 2027127 AND WE ALSO NOT AFFORD TO LOSE CUSTOMERS LIKE ZOYA , REKHA , PREETI AND FARAH  THEY ALL SPEND ABOVE 1000000 AND MORE
 
-- 9 Which of our salespeople is closing the most deals?
select e.emp_id ,first_name, count(order_id) total_orders  from employees e
join orders o  on e.emp_id =o.emp_id 
group by e.emp_id
order by total_orders desc limit 5;
 -- OUR TOP PERFROMARES ARE SWATI EMP_ID 18 CLOSES 9 DEALS , THEN ARJUN EMP_ID 16  CLOSES 8 DEALS AND AYESHA , RITU ,RAHUL CLOSES 7 DEALS EACH  
 
-- 10 How many of our orders are actually going through vs falling apart?
select status, count(order_id) as order_count,
round((COUNT(order_id) / (SELECT COUNT(*) FROM orders)) * 100, 1) AS percentage
from orders
group by status;
 -- WE ARE SEEING ORDERS WHICH ARE CANCELLING ARE ABOUT 9.3 % WHICH ARE 14 , AND WE SUCCESFULLY DELIVERED ABOUT 54.7% ARROUNG 82 ORDERS 
 
-- 11 On average, how much is a customer spending per order?
SELECT ROUND(AVG(order_value), 1) AS avg_order_value
FROM (
    SELECT SUM(quantity * unit_price) AS order_value
    FROM order_items
    GROUP BY order_id
) AS order_totals;
 -- Average Order Value (AOV) IS 210281
 
-- 12 What have we been stocking that nobody's actually buying?
select  p.product_id , product_name from products p 
left join order_items oi on p.product_id= oi.product_id
where oi.order_item_id is null;
 -- WE ARE NOT ANY SUCH THING 
