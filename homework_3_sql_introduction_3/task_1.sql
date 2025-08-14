-- Part 1

-- Task 1

--Найдите всех клиентов из страны 'USA', которым больше 25 лет.

-- Решение: осуществляем выборку через select из таблицы customers по условиям отбора age (возраст) >25 и страна USA

SELECT
	first_name,
	last_name,
	age,
	country
FROM
	customers
WHERE
	(age > 25)
	AND (country = 'USA');

