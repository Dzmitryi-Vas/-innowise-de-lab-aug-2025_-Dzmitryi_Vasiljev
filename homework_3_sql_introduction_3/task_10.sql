-- Part 7

-- Task 1

-- Найдите клиентов, которые:
--1. Сделали хотя бы 2 заказа (любых),
--2. Имеют хотя бы одну доставку со статусом 'Delivered'.
--Для каждого такого клиента выведите:
-- full_name (имя + фамилия),
--общее количество заказов,
--общую сумму заказов,
--страну проживания.


SELECT
	concat(first_name, ' ', last_name) AS full_name,
	country,
	count (*) AS total_orders,
	sum(amount) AS total_amount
FROM
	customers
JOIN orders ON
	customers.customer_id = orders.customer_id
JOIN shippings ON
	shippings.customer = customers.customer_id
WHERE
	shippings.status = 'Delivered'
GROUP BY
	full_name,
	country,
	status
HAVING
	(count (*)) >= 2;

