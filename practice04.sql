1.문제

select count(first_name)
from employees
where salary <(select avg(salary)
from employees);

2.문제

select employee_id, first_name, salary
from employees
where salary >= (select avg(salary)
from employees)
and salary <= (select max(salary)
from employees);

3.문제

select l.location_id, l.street_address, l.postal_code, l.city, l.state_province, l.country_id
from employees e, departments d, locations l
where e.employee_id = d.manager_id
and d.location_id = l.location_id
and e.first_name = 'Steven'
and e.last_name = 'King';


4.문제

select e.employee_id, e.first_name, e.salary
from jobs j, employees e
where j.job_id = (select job_id
from jobs
where job_id = 'ST_MAN')
order by salary desc;

5.문제


select employee_id "직원번호",
first_name "이름",
salary "급여",
employee_id "부서번호"
from employees
where(department_id, salary) in(select department_id, max(salary) salary 
from employees
group by department_id);


select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, max(salary) salary
from employees
group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary;

6.문제

select j.job_title, e.salary
from jobs j, (select job_id, sum(salary) salary
from employees
group by job_id) e
where j.job_id = e.job_id
order by salary desc;

7.문제

select employee_id, first_name, salary
from employees
where salary > (select avg(salary) salary
from employees);

8.문제
select w.rn,
w.employee_id,
w.first_name,
w.salary,
w.hire_date
from(select rownum rn,
e.employee_id,
e.first_name,
e.salary,
e.hire_date
from (select employee_id,
first_name,
salary,
hire_date
from employees
order by hire_date asc) e) w
where rn >=11
and rn <= 15;