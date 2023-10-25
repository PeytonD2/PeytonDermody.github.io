/*STA 3732 Assignment 2*/
/*part 1*/

/*1A*/
SELECT
 *
 FROM
employees
INNER JOIN
jobs
on
employees.job_id = jobs.job_id ;

/*1B*/
SELECT
* 
FROM
employees
Left OUTER JOIN
jobs
on 
employees.job_id = jobs.job_id ;
/*1C*/
/*Looking at the results of A and B their are no jobs in the employees table that are not in the jobs table becuase for the employees to be categorized by their job they have to have a job 
title and for the jobs to categorized they have to have employees to fill those job spots and be given a role. Nothing was left out of either table because without the employees their
would be no job table and vise versa. They both return 40 jobs and 40 names.*/
/*1D*/
SELECT
* 
FROM
jobs
Left OUTER JOIN
employees
on 
jobs.job_id = employees.job_id ;

/*1E*/
select 
c.first_name,
c.last_name,
c.phone_number,
i.job_id,
i.job_title,
i.max_salary
FROM
employees as c 
INNER JOIN 
jobs as i 
on 
c.job_id = i.job_id ;

/*1F*/
select 
c.first_name,
c.last_name,
c.phone_number,
i.job_id,
i.job_title,
i.max_salary
FROM
employees as c 
INNER JOIN 
jobs as i 
on 
c.job_id = i.job_id
WHERE 
i.max_salary >= 9000 
ORDER by
i.job_id ASC 
limit 15 ;

/*part 2*/
/*2A*/
SELECT
e.first_name,
e.last_name,
e.email,
d.department_id,
d.department_name,
l.location_id,
l.city,
l.country_id
FROM
employees as e 
INNER JOIN
departments as d 
on 
e.department_id = d.department_id
INNER JOIN
locations as l
on 
d.location_id = l.location_id ;
/*2B*/
SELECT
e.first_name,
e.last_name,
e.email,
d.department_id,
d.department_name,
l.location_id,
l.city,
l.country_id,
c.country_name
FROM
employees as e 
INNER JOIN
departments as d 
on 
e.department_id = d.department_id
INNER JOIN
locations as l
on 
d.location_id = l.location_id 
INNER JOIN
countries as c 
on 
c.country_id = l.country_id ;
/*2C*/
SELECT
* 
FROM
employees as e
LEFT OUTER JOIN
dependents as d
on 
e.employee_id = d.employee_id
where
dependent_id is  NULL ;

/*2D*/
SELECT
*
FROM
countries
WHERE
country_name like '%S%' 

UNION

SELECT
*
from 
countries
WHERE
region_id=1 or region_id=2 ;

/*2E*/
SELECT
*
FROM
countries
WHERE
country_name like '%S%' 

INTERSECT

SELECT
*
from 
countries
WHERE
region_id=1 or region_id=2 ;
/* In 2D we used Union to bring together both statements that have an S and come from regions 1 or 2, but in the intersection command it took both statements and brought together
only the things they had in common. So the union command could produce duplicates but the intersection command does not.*/

/*part3*/
/*3A*/
SELECT
count(salary) as 'under_10'
FROM
employees
WHERE
salary< 10000 ;
/*3B*/
SELECT
length(last_name) as 'namelength'
FROM
employees
WHERE
namelength > 8
ORDER by
namelength ASC ;
/*3C*/
SELECT
substr(first_name,1, 1) || '.' || last_name || ':' || email as 'contact'
from 
employees;
/*3D*/
select 
strftime ('%Y-%m-%d' , '1977-08-16') -
strftime( '%Y-%m-%d' , '1935-01-08') as 'age at death' ;

/*part4*/
/*4A*/
SELECT
avg(salary) as 'averagesalary',
min(salary) as 'minimunsalary',
max(salary) as 'maxsalary'
from 
employees ;
/*4B*/
SELECT
avg(salary) as 'avg salary',
department_id
FROM
employees
GROUP by
department_id
ORDER by
department_id ASC ;
/*4C*/
SELECT
round(avg(salary), 1) as 'rounded average',
department_id
FROM
employees
GROUP by
department_id
ORDER by
department_id ASC ;
/*4D*/
SELECT
department_id,
round(avg(salary), 1) as 'rounded average'
FROM
employees
GROUP by
department_id
HAVING
avg(salary) > 9000
ORDER by
department_id ASC ;
/*4E*/
SELECT
round(avg(salary), 1) as 'rounded average',
department_id,
job_id
FROM
employees
GROUP by
department_id, job_id
ORDER by
department_id ASC, job_id ASC ;



