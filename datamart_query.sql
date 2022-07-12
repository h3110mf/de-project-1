----------Создание витрины---------------------
insert into dm_rfm_segments
select r.user_id, r.recency, f.frequency, mv.monetary_value  from tmp_rfm_recency r
inner join tmp_rfm_frequency f
on r.user_id = f.user_id
inner join tmp_rfm_monetary_value mv
on r.user_id = mv.user_id

----------Проверка витрины---------------------
select * from dm_rfm_segments
where monetary_value is null or frequency is null or recency is null

----------первые 10 строчек запроса---------------------

0	1	3	4
1	4	4	3
2	2	3	5
3	2	3	3
4	4	4	3
5	5	5	5
6	1	3	5
7	4	3	2
8	1	1	3
9	1	3	2