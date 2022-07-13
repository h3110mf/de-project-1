### 1.4.2. Напишите DDL-запрос для создания витрины.**

Далее вам необходимо создать витрину. Напишите CREATE TABLE запрос и выполните его на предоставленной базе данных в схеме analysis.


CREATE TABLE analysis.tmp_rfm_recency (
 user_id INT NOT NULL PRIMARY KEY,
 recency INT NOT NULL CHECK(recency >= 1 AND recency <= 5)
);
CREATE TABLE analysis.tmp_rfm_frequency (
 user_id INT NOT NULL PRIMARY KEY,
 frequency INT NOT NULL CHECK(frequency >= 1 AND frequency <= 5)
);
CREATE TABLE analysis.tmp_rfm_monetary_value (
 user_id INT NOT NULL PRIMARY KEY,
 monetary_value INT NOT NULL CHECK(monetary_value >= 1 AND monetary_value <= 5)
);
 
 ------- СОЗДАНИЕ витрины dm_rfm_segments--------------------------------
create table analysis.dm_rfm_segments (
             user_id INTEGER constraint ID_NN NOT NULL PRIMARY KEY,
             recency INTEGER check(recency >0 and recency <=5),
             frequency INTEGER check(recency >0 and recency <=5),
             monetary_value INTEGER check(recency >0 and recency <=5));
-------------------------------------------------------------------------