select * from pizzas_details

-- total revenue of the pizzas_details

select sum(quantity * unit_price) as TOTAL_REVENUE from pizzas_details


---- Aveerage order value
 select sum(quantity * unit_price) / count(distinct (order_id)) as Arg_order_value from pizzas_details

 ----Total pizza sold

 select sum(quantity) as Total_pizza_sold from pizzas_details

 ---total order
 select count(distinct (order_id)) as total_order from pizzas_details

 ------Average pizza sales as per order
 select cast(cast(sum(quantity) as decimal(10,3))/ 
 cast(count(distinct (order_id)) as decimal(10,2))
 as decimal(10,3)) as per_order from pizzas_details

 -------  day wise order trend 
 select (trim(to_char( order_date,'day'))) as day_week ,sum(quantity * unit_price) from pizzas_details 
 group by day_week


------month wise trend
 select (trim(to_char( order_date,'month'))) as month ,sum(quantity * unit_price) as Total_revenue from pizzas_details 
 group by month


 ------year wise trend
 select trim(to_char(order_date,'year')) as year , sum(Quantity*unit_price)  from pizzas_details
 group by trim(to_char(order_date,'year'))



--------day wise order
select extract('day' from order_date) as per_day, count(distinct(order_id)) as total_order from pizzas_details
group by per_day
order by total_order asc

--------hour wise order
select extract(hour from order_time) as per_hour, count(distinct(order_id)) as total_order from pizzas_details
group by per_hour
order by total_order asc


-------percentage of sales by pizza category
select * from pizzas_details
select pizza_category, sum(total_price) * 100/(select sum(total_price) from pizzas_details) as percentage
from pizzas_details
group by pizza_category


--Top 5 Best selling pizza by revenue ,total Quantity  and total order
select pizza_name ,sum(quantity * total_price) as Total_revenue from pizzas_details
group by pizza_name
order by Total_revenue desc
limit 5



--Least selling  selling pizza by revenue ,total Quantity  and total order
select pizza_name ,sum(quantity * total_price) as Total_revenue from pizzas_details
group by pizza_name
order by Total_revenue asc
limit 5

-----------Top 5 Best selling pizza by total Quantity 
select pizza_name ,count(quantity) as TOTAL_QUANTI from pizzas_details
group by pizza_name
order by TOTAL_QUANTI desc
limit 5


------least selling pizza by  total Quantity 
select pizza_name ,count(quantity) as TOTAL_QUANTI from pizzas_details
group by pizza_name
order by TOTAL_QUANTI asc
limit 5


-------------Top 5 Best selling pizza by  total order
select pizza_name ,count(distinct order_id) as pizza_order from pizzas_details
group by pizza_name
order by pizza_order desc
limit 5


--------least order selling pizza by total order
select pizza_name ,count(distinct order_id) as pizza_order from pizzas_details
group by pizza_name
order by pizza_order asc 
limit 5




