create or replace view analysis.orders as
with sort as (select * from (
select id,
order_id,
status_id,
rank() over (partition by order_id order by dttm desc)
from production.OrderStatusLog) x
where rank = 1)
select o.order_id, order_ts, o.user_id, bonus_payment, payment, cost, bonus_grant, s.status_id from production.orders o
left join sort s 
on o.order_id = s.order_id;