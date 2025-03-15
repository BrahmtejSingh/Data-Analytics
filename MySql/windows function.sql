-- WINDOW FUNCTIONS

select* 
from employee_demographics
;

select dem.first_name, dem.last_name, gender, avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by dem.first_name, dem.last_name,gender
;

select dem.first_name, dem.last_name, avg(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
;

select dem.first_name, dem.last_name, sum(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
;

select dem.first_name, dem.last_name, salary,
sum(salary) over(partition by gender order by dem.employee_id) 
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
;

select dem.first_name, dem.last_name, salary, gender,
row_number() over(partition by gender order by salary Desc) as row_num,
rank() over(partition by gender order by salary Desc) as rank_num,
dense_rank() over(partition by gender order by salary Desc) as dense_rank_num  
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
;

