-- Queries  SQL
-- Sales & Revenue Analysis - SQL Queries
--  1 Which product category is making us the most money?
select category,sum(quantity*unit_price) as total_revenue
from products p join  order_items oi on p.product_id=oi.product_id
group by category ;
 
-- 2 Are we selling a lot of cheap stuff, or is our revenue coming from fewer expensive items?
select category  ,sum(quantity) as total_quantity 
from products p join  order_items oi on p.product_id=oi.product_id
group by category ;
 
--  3 Are our sales growing or shrinking quarter to quarter?
select   year(o.order_date) as sales_year
,quarter(o.order_date) as sales_quarter,SUM(oi.quantity * oi.unit_price) AS quarterly_revenue
,count(distinct o.order_id) total_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id 
group by year(o.order_date), quarter(o.order_date)
order by sales_year, sales_quarter;
 
--  4 How many of our experienced staff (5+ years with us) do we still have?
SELECT emp_id,year(curdate())-  YEAR(hire_date) AS tenure 
FROM employees 
WHERE year(curdate()) - YEAR(hire_date) >= 5;
 
-- 5 How big is our product catalog right now?
select distinct count(product_id) from products ;
 
 -- 6 What are we about to run out of?
 select  category,product_name, stock_quantity
 from products 
 order by stock_quantity
 limit 10;
 
 -- 7 What's flying off the shelves fastest?
select p.product_id, product_name , sum(quantity)/stock_quantity as sell_through_ratio 
from products p join order_items oi on p.product_id= oi.product_id
group by product_id , product_name, stock_quantity
order by sell_through_ratio desc ;
 
-- 8 Who are our best customers — the ones we can't afford to lose?
select c.customer_id, sum(quantity*unit_price) as total_spend
from customers c 
join orders o on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id
group by customer_id  
order by total_spend desc limit 5;
 
-- 9 Which of our salespeople is closing the most deals?
select e.emp_id , count(order_id) total_orders  from employees e
join orders o  on e.emp_id =o.emp_id 
group by e.emp_id
order by total_orders desc limit 5;
 
-- 10 How many of our orders are actually going through vs falling apart?
select status, count(order_id) as order_count,
round((COUNT(order_id) / (SELECT COUNT(*) FROM orders)) * 100, 1) AS percentage
from orders
group by status;
 
-- 11 On average, how much is a customer spending per order?
SELECT ROUND(AVG(order_value), 1) AS avg_order_value
FROM (
    SELECT SUM(quantity * unit_price) AS order_value
    FROM order_items
    GROUP BY order_id
) AS order_totals;
 
-- 12 What have we been stocking that nobody's actually buying?
select  p.product_id , product_name from products p 
left join order_items oi on p.product_id= oi.product_id
where oi.order_item_id is null;
 
