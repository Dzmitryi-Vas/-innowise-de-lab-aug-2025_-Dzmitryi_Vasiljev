-- Task 2

-- Выведите список доставок со статусом и именем клиента.
-- Решение: осуществляем выборку из таблицы customers сджойненной с таблицей shippings по shippings.customer=customers.customer_id
SELECT
	status,
	first_name,
	last_name
FROM
	shippings
LEFT JOIN customers ON  -- потому что могут быть доставки без покупателя, тк customer может быть NULL
shippings.customer = customers.customer_id;


