-- Part 1
-- Task 1

INSERT INTO employees (employeeid, firstname, lastname, department, salary)
VALUES (6, 'John', 'Cash', 'IT', '90000'),
       (7, 'Johnny', 'Depp', 'Finance', '10000');

-- вставка двух новых сотрудников (с заданными атрибутами)

-- Task 2

SELECT firstname, lastname
FROM employees;
-- Выбор всех сотрудников по фамилии и имени из таблицы Сотрудники


-- Task 3

SELECT firstname, lastname
FROM employees
WHERE (department = 'IT');

-- тоже самое, что и выше только по отделу ИТ


-- Task 4

UPDATE employees 
SET salary = '65000'
WHERE (firstname = 'Alice'and lastname = 'Smith');

-- обновление salary до 65000 для определенного сотрудника

-- Task 5


delete
from
	employeeprojects
where
	employeeid =(
	select
		employeeid
	from
		employees
	where
		lastname = 'Prince')
delete
from
	employees
where
	lastname = 'Prince'

	-- удаление сотрудника, с определенной фамилией, вначале удаляем связанные данные, затем исходные (вначале в дочерней таблице а затем в родительской)

-- Task 6

SELECT * FROM Employees;
-- проверка всех изменений

-- Part 2

-- Task 1

create table Departments (
DepartmentID SERIAL primary key,
DepartmentName VARCHAR(50) unique not null,
location VARCHAR(50));

-- создание новой таблицы с определенными столбцами


-- Task 2

alter table employees ADD column Email VARCHAR(100);

-- добавление в таблицу Сотрудники столбца Email с указанием его типа данных

-- Task 3

ALTER TABLE employees 
ADD CONSTRAINT Unique_Email UNIQUE (Email);

UPDATE employees
SET Email = firstname || lastname || '@gmail.com';

-- заполняем столбец емайл сочетанием имени и фамилии сотрудника с добавлением почтового домена и добавляем на значение в столбце ограничение "уникальный"

  
-- Task 4

alter table Departments
rename Location to Officelocation;
-- переименование столбца


-- Part 3
-- Task 1

create user hr_user with password '123';


-- создаем нового пользователя и задаем ему пароль


-- Task 2

create role select_opportunite;

grant select on Employees to select_opportunite;

grant select_opportunite to hr_user;
-- создаем роль и добавляем пользователю

-- Task 3


create role insert_and_update_opportunite;
grant insert, update on Employees to insert_and_update_opportunite;
grant insert_and_update_opportunite to hr_user;

-- прописываем "возможности" данной роли и добавляем пользователю


-- Part 4

-- Task 1

UPDATE employees 
SET salary = salary*1.1  -- увеличиваем salary на 10%;
WHERE (department = 'IT');  -- для сотрудников отдела ИТ;



-- Task 2

UPDATE employees 
SET department = 'Senior IT'
WHERE (salary > 70000);

-- меняем на Сеньора ИТ для тех у кого salary выше 70000;


-- Task 3

delete 
from employees 
WHERE NOT EXISTS (
    SELECT *
    FROM employeeprojects
    WHERE employeeprojects.employeeid = employees.employeeid
);

-- удаляем всех кто не задействован на проекте используя NOT EXISTS (булевое значение)

-- Task 4

begin;
with new_values as (
select (select max(projectid)+1 from projects) as projectid, 
'Web application development' as projectname,
300000 as budget, 
to_date('2025-09-01', 'YYYY-MM-DD') as startdate,
to_date ('2025-12-30', 'YYYY-MM-DD') as enddate)   -- создание проекта нового;
insert
	into
	projects (projectid, projectname, budget, startdate, enddate)
	select * from new_values v 
where not exists (
    SELECT *
    FROM projects p1 
    WHERE v.projectname = p1.projectname);

INSERT INTO employeeprojects (employeeid, projectid, hoursworked)
select employeeid, projectid, 201 as horseworked 
from employees
cross join  projects 
where projects.projectname = 'Web application development'
and not exists 
	(
    SELECT *
    FROM employeeprojects p1 
    WHERE p1.projectid = projects.projectid and employees.employeeid = p1.employeeid
    )  
and employees.employeeid <=2; -- основной смысл в том чтобы вставить двух существующих сотрудников (первых двух)

commit;


-- Part 5

-- Task 1

create or replace function CalculateAnnualBonus (p_employeeid int, p_salary numeric) -- параметры функции (с чем она будет работать и их тип данных)
RETURNS numeric (10,2)
AS $$
BEGIN
RETURN p_salary*0.1;  -- вычисление 10%;
END;
$$ LANGUAGE plpgsql;



select CalculateAnnualBonus(1, to_number('4000.00', '9999999.99')) as bonus;

 -- подстановка значений и их автоматическое вычисление функцией, там где девятки это "Разряд" возможного значения;


-- Task 2

select employeeid 
from employees 
p_employeeid = employees.employeeid
p_salary = employees.salary

select CalculateAnnualBonus(employeeid, salary) from employees -- потенциальный бонус для каждого сотрудника (основное решение выше (создание фукнции))


-- Task 3

CREATE VIEW IT_Department_View AS
    SELECT employeeid, firstname, lastname, salary
    FROM employees
    WHERE (department = 'IT')
 -- создание представления, показывающего только сотрудников из отдела ИТ;
    
    
    
    -- Task 4
    
    
    select * from IT_Department_View -- выборка данных из представления;

    
  -- Part 7
    
   
    
    
 /* Действия:
1. Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов.
2. Увеличить Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'.
3. Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), установить EndDate на один год позже его StartDate.
4. Вставить нового сотрудника и немедленно назначить его на проект 'Website Redesign' с 80 отработанными часами, все в рамках одной транзакции. Использовать предложение RETURNING, чтобы получить EmployeeID вновь вставленного сотрудника.
● Результат: SQL-скрипт, содержащий все DML-запросы и операторы SELECT для проверки.
*/
    -- Task 1
    
   SELECT p.ProjectName 
   FROM projects p
   INNER JOIN employeeprojects ep on p.projectid = ep.projectid -- джойним таблицы (т.к. данные в разных таблицах)
   INNER JOIN employees e on e.employeeid = ep.employeeid 
   WHERE upper(concat(e.firstname, e.lastname)) = 'BOBJOHNSON' 
   and ep.hoursworked > 150;
   
  -- Task 2
  /*Script для проверки. Сравнить с этими значениями после выполнения update*/ 
  
   SELECT p.projectname, p.budget, p.budget*1.1 as new_budget
  FROM projects p
  inner join employeeprojects ep on p.projectid = ep.projectid 
  where exists (
  	SELECT null 
  	FROM employees e 
  	WHERE e.employeeid = ep.employeeid  
  		AND e.department ilike '%IT%');*/ -- ilike - проверка строкового значения
   
  		
  UPDATE projects p
  SET budget = p.budget*1.1
  FROM employeeprojects ep 
  where p.projectid = ep.projectid 
  AND exists (
  	SELECT null 
  	FROM employees e 
  	WHERE e.employeeid = ep.employeeid  
  		AND e.department ilike '%IT%');
  
  
  -- Task 3
  /*Script для проверки. Сравнить результаты после запуска update*/
  
  SELECT startdate, startdate + interval '1 year' as new_end_date  -- interval '1 year' - задает интервал в один год (готовая функция)
  FROM projects p 
  WHERE enddate is null;
  
  UPDATE projects p
  SET enddate = startdate + interval '1 year'
  WHERE projectid = (
  	SELECT projectid 
  	FROM projects
  	WHERE enddate is null
  	LIMIT 1
  	);

  -- Task 4
  
  DO $$
  
 DECLARE new_employeeid integer; -- объявляем переменную с числовым типом данных
 
   BEGIN
   
  WITH new_employee AS (
	  SELECT (SELECT max(employeeid) from employees) + 1 as employeeid, 
	  'Devi' as firstname,
	  'Smith' as lastname,
	  'IT' as department,
	  1500 as salary,
	  'devi_smith@gmail.com' as email
	  )
	, inserted as (  --inserted - второй запрос;
  INSERT INTO employees (employeeid, firstname, lastname, department, salary, email)
  SELECT *
  FROM new_employee ne
  WHERE NOT EXISTS (
  	SELECT NULL
  	FROM employees e
  	WHERE upper(concat(e.firstname, e.lastname)) = upper(concat(ne.firstname, ne.lastname))
 ) 
 RETURNING employeeid  -- возвращаем значение;
)
SELECT employeeid INTO new_employeeid FROM inserted; -- записываем возвращенное значение в переменную

WITH new_employee_project AS (
	SELECT new_employeeid as employeeid,
		projectid,
		80 as hoursworked
	FROM projects p
	LIMIT 1)
	INSERT INTO employeeprojects (employeeid, projectid, hoursworked)
	SELECT *
	FROM new_employee_project nep
	WHERE NOT EXISTS (
		SELECT NULL 
		FROM employeeprojects ep 
		WHERE ep.projectid = nep.projectid
			AND ep.employeeid = nep.employeeid
	);
	
COMMIT; 
 
END$$

  
/*Script для проверки*/
  SELECT *
  FROM employeeprojects ep
  inner join employees e on ep.employeeid = e.employeeid 
  where upper(concat(e.firstname, e.lastname)) = 'DEVISMITH';

-- ROLLBACK; 
  
  
  
  

     
































