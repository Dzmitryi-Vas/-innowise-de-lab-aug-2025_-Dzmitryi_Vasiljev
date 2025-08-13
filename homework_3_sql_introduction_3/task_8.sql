-- Part 5

-- Task 1

-- Найдите всех клиентов, которые сделали заказ с максимальной суммой.
-- Решение: осуществляем выборку из таблицы customers сджойненной по customers.customer_id = orders.order_id где условие отбора максимальное значение стоимости заказа

SELECT
	first_name,
	last_name,
	amount
FROM
	customers
JOIN orders ON
	customers.customer_id = orders.order_id
WHERE
	amount = (
	SELECT
		max(amount)
	FROM
		orders);

