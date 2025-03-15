-- CTEs

select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
;

with cte_example as (
select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
)--
select *
from cte_example
;

with cte_example as (
select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_example
;

select avg(avg_sal)
from (
select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
)example_subquery
;

with cte_example as (
select employee_id, gender, birth_date 
from employee_demographics 
where birth_date > "1984-01-01"
),
cte_example2 as (
select employee_id, salary
from employee_salary 
where salary > 50000
)
select *
from cte_example
join cte_example2
on cte_example.employee_id=cte_example2.employee_id
;