-- Where clause

Select * 
from employee_salary
where first_name = 'leslie';

Select * 
from employee_salary
where salary <= 50000;

select *
from employee_demographics
where gender !='female'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
or not gender = 'male'
;

select *
from employee_demographics
where (first_name = 'leslie' and age = 44) or age > 55
;

-- like clause
-- % and _
select *
from employee_demographics
where first_name like '%er%'
;
select *
from employee_demographics
where first_name like 'a%'
;
select *
from employee_demographics
where first_name like 'a___%'
;
select *
from employee_demographics
where birth_date like '1989%'
;