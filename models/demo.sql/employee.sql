{{
    config(
        materialized ='table'
    )
}}
with employee_raw as (
    select 
    EMPID as emp_id,
    split_part(name,'',1) as employee_first_name,
    split_part(name,'',2) as employee_second_name,
    salary as emp_salary,
    hiredate as emp_hiredate,
    split_part(address,',',1) as emp_street,
    split_part(address,',',2) as emp_city,
    split_part(address,',',3) as emp_country
from {{source('employee','EMPLOYEE_RAW') }}
)
select * from employee_raw