---FREQUENCY!!!-------------------------------------------------------
insert into analysis.tmp_rfm_frequency
select user_id, NTILE(5) over (order by count(*) asc) as 
			frequency from analysis.orders o 
				where status_id = '4' AND
				extract(year from order_ts) = '2022'
				group by user_id
				order by frequency asc;
---FREQUENCY!!!-------------------------------------------------------