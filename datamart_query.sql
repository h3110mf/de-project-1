----------Создание витрины---------------------
insert into dm_rfm_segments
select r.user_id, r.recency, coalesce (f.frequency, 0), coalesce(mv.monetary_value, 0)  from tmp_rfm_recency r
left join tmp_rfm_frequency f
on r.user_id = f.user_id
left join tmp_rfm_monetary_value mv
on r.user_id = mv.user_id;

----------Проверка витрины---------------------
select * from dm_rfm_segments
order by user_id;

----------первые 10 строчек запроса---------------------

0	1	3	4
1	4	3	3
2	2	3	5
3	2	3	3
4	4	3	3
5	5	5	5
6	1	3	5
7	4	2	2
8	1	1	3
9	1	2	2