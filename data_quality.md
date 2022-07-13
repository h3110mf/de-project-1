## 1.3. Проанализируйте качество данных

Изучите качество входных данных. Опишите, насколько качественные данные хранятся в источнике. Так же укажите, какие инструменты обеспечения качества данных были использованы в таблицах в схеме production.

-----------

Все колонки в orders имеют constraint на not null,
order_id - Primary key,
имеется check проверка по полю ((cost = (payment + bonus_payment)))


В таблице `orders` представлено 10 000 заказов. 

В необходимых нам полях пропусков нет. Значений, равных 0 в поле `cost` нет. Nullable также не встречается


Проблем с типом данных нет. 

В схеме `production` для обеспечения качества данных были использованы primary keу, 
имеющие ограничения по уникальности и not null значеним 
(в таблице `orders` первичным ключом является `order_id`,  в таблице `users` - `id`,
 в таблице `orderstatuslog` - `id`, в таблице `orderstatuses` - `id`, в таблице `orderitems` - `id`, в таблице `products` - `id`), 
так же были использованы внешние ключи (в таблице `orderstatuslog` внешними ключами стали `order_id` для таблицы `orders` и `status_id`
 для таблицы `orderstatuses` - `order_id` для таблицы `orders` и `product_id` для таблицы `products`). 

Orderitems:

Название	Владелец	Тип	Выражение	Комментарий
orderitems_quantity_check	orderitems	CHECK	((quantity > 0))	
quantity				
orderitems_price_check	orderitems	CHECK	((price >= (0)::numeric))	
price				
orderitems_pkey	orderitems	PRIMARY KEY		
id				
orderitems_order_id_product_id_key	orderitems	UNIQUE KEY		
product_id				
order_id				
orderitems_check	orderitems	CHECK	(((discount >= (0)::numeric) AND (discount <= price)))	
price				
discount				

orders
Название	       Владелец	Тип	      Выражение	
orders_check	orders	CHECK	       ((cost = (payment + bonus_payment)))	
cost				
payment				
bonus_payment				
orders_pkey	       orders	PRIMARY KEY		
order_id				

orderstatuses
Название	             Владелец	          Тип	
orderstatuses_pkey	orderstatuses	PRIMARY KEY		
id				

orderstatuslog
Название	                              Владелец	           Тип
orderstatuslog_order_id_status_id_key	orderstatuslog	UNIQUE KEY		
order_id				
status_id				
orderstatuslog_pkey	                  orderstatuslog	PRIMARY KEY		
id				

products
Название	            Владелец	Тип	           Выражение	
products_pkey	      products	PRIMARY KEY		
id				
products_price_check	products	CHECK	           ((price >= (0)::numeric))	
price				


users           
Название	 Владелец	Тип
users_pkey	 users	PRIMARY KEY		
id				

