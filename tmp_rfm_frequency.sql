---FREQUENCY!!!-------------------------------------------------------
insert into tmp_rfm_frequency
select user_id, frequency from (
with x as (select user_id, count(*) as 
			C from analysis.orders o 
				where status = '4'
				group by user_id
				order by C asc),
      volume as (select count(user_id) as closed 
                from (select user_id, count(*) from analysis.orders o 
					where status = '4'
					group by user_id
					order by count asc)y)
select user_id,
       (case
       	when num<=(select closed from volume)/5 then 1
       	when num>(select closed from volume)/5 and num<=(select closed from volume)/5*2  then 2
       	when num>(select closed from volume)/5*2 and num<=(select closed from volume)/5*3  then 3
       	when num>(select closed from volume)/5*3 and num<=(select closed from volume)/5*4  then 4
       	when num>(select closed from volume)/5*4 then 5
       end
       ) Frequency
from(select user_id,
       c,
       row_number () over (order by c) as num
from x
group by user_id, c) y
) tmp
---FREQUENCY!!!-------------------------------------------------------