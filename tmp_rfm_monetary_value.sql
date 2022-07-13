---Monetary_value!!!-------------------------------------------------------
insert into analysis.tmp_rfm_monetary_value
select user_id, NTILE(5) over (order by sum(cost) asc) as 
			monetary_value from analysis.orders o 
				where status_id = '4' AND
				extract(year from order_ts) = '2022'
				group by user_id
				order by monetary_value asc;
---Monetary_value!!!-------------------------------------------------------