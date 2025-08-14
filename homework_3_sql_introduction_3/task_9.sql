-- Part 6

-- Task 1

-- Для каждого заказа добавьте колонку с суммой всех заказов этого клиента (используя оконную функцию).
-- Решение: 

SELECT
	order_id,
	customer_id,
	item,
	amount,
	sum (amount) OVER (PARTITION BY customer_id) AS total_by_customer -- оконная функция, суммирующее значение стоимости покупок с занесением данных в созданную total_by_customer
FROM
	orders
ORDER BY
	order_id;  -- группируем по order_id

