---Recency!!!-------------------------------------------------------
insert into analysis.tmp_rfm_recency
select user_id,recency from (
select user_id, NTILE(5) over (order by max(order_ts) asc) as 
			recency from analysis.orders o 
				where status_id = '4' AND
				extract(year from order_ts) = '2022'
				group by user_id
				order by recency asc) t
union all 
select user_id, 1
from analysis.orders
where user_id not in (select user_id from analysis.orders o 
				where status_id = '4' AND
				extract(year from order_ts) = '2022'
				group by user_id)
group by user_id;
---Recency!!!-------------------------------------------------------