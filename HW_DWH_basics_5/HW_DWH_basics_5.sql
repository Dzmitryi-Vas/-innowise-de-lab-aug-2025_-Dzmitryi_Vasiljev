-- Аналитические запросы

--1) находим сумму всех оплаченных заказов за определенный день

select
	sum (line_total)
from
	fact_sales
inner join dates
on
	fact_sales.date_sk = dates.date_sk
where
	date_key = '2025-08-15';


-- 2) определение "среднего чека" за день

select
	sum (line_total)/ count (distinct order_sk)
from
	fact_sales
inner join dates on
	fact_sales.date_sk = dates.dates_sk
where
	dates.date_key = '2025-08-15'
group by
	dates.date_key;


-- 3) определение суммы продаж для каждого официанта за месяц


select
	first_name,
	last_name,
	sum (line_total)
from
	fact_sales
inner join orders on
	fact_sales.order_sk = orders.order_sk
inner join waiters on
	fact_sales.waiter_sk = waiters.waiters_sk
where
	order_payment_date between '2025-08-01' and '2025-08-30'
group by
	waiter_id;



