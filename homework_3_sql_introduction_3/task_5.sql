 -- Part 3

-- Task 1

--Подсчитайте количество клиентов в каждой стране.
-- Решение: осуществляем выборку из таблицы customers, с помощью функции count считаем кол-во покупателей, группируем по country

SELECT
	country,
	count (*) as customers_cnt
FROM
	customers
GROUP BY
	country;

