-- Part 2

-- Task 1

-- Получите список заказов вместе с именем клиента, который сделал заказ.
-- Решение: осуществляем выборку из таблицы orders и customers сджойненной по orders.customer_id=customers.customer_id

SELECT
	first_name,
	last_name,
	item,
	amount
FROM
	orders
LEFT JOIN customers ON
	orders.customer_id = customers.customer_id;
