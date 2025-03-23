create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;
select * from customer_orders;

with firstOrder as (
select customer_id, min(order_date) as firstOrderDt from customer_orders
group by customer_id) 
, visitflag as 
(select c.customer_id,c.order_date,
case when c.order_date= f.firstOrderDt then 1 else 0 end as firstVisit,
case when c.order_date!= f.firstOrderDt then 1 else 0 end as repeatDt
from firstOrder f
join customer_orders c on f.customer_id=c.customer_id
order by c.order_date)
select v.order_date , sum(v.firstVisit)as firstVisit,
sum(v.repeatDt) as repeatedDt from visitflag v group  by v.order_date