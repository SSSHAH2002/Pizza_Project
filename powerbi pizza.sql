--create table and column of table 

create table pizzas_details(
pizza_id int ,
order_id int ,	
pizza_name_id varchar(20),
quantity int,
order_date date,
order_time time,
unit_price float,
total_price float,
pizza_size varchar(10),
pizza_category varchar(20),
pizza_ingredients varchar(100),
pizza_name varchar(50)

)
--     display the column
select * from pizzas_details

alter table pizzas_details
alter column pizza_size type varchar(10)
---- import data

copy pizzas_details from 'D:\SQL pizza\pizza_sales\pizza_sales_excel_file.csv' delimiter ',' csv header