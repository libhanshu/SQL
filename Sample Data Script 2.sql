SELECT * FROM geeksforgeeks.sample_data;
select *, sum(salary) 
over (partition by department ,country order by salary) 
as sum 
from sample_data;
select *, salary*100/(sum(salary)
 over (partition by department))
as percentage 
from sample_data;
select * from sample_data;
select * 
from (select * , dense_rank()
 over (partition by department order by salary desc) 
as highest_salary 
from sample_data
) cte
where highest_salary = 2;
select * , lag(salary)
 over (partition by department order by salary desc) - salary 
 as diff_salary 
 from sample_data;
select * 
from (select * , dense_rank() 
over (partition by country order by salary desc)
 as rank_salary 
 from sample_data
 ) cte
where rank_salary between 1 and 3;
select * , salary/(max(salary) 
over (partition by department ))
 as ratio 
 from sample_data;
select * 
from (select * , ntile(10) 
over (order by salary desc) 
as percentage from sample_data
) cte
where percentage = 1;
select Name ,Salary ,Department , sum(salary) 
over (partition by department) 
as Total_Salary 
from sample_data;
select Department ,count(Name)
over (partition by department)
as No_Of_Employees
from sample_data;
select department , count(name)
as Total_Emaployees
 from sample_data
group by department;
select * ,min(Salary) 
over (partition by department)
 as Min_Pay 
from sample_data;
select * ,max(Salary)
over (partition by department)
 as Max_Pay 
from sample_data;
select * , row_number() 
over (partition by department order by salary) 
as Unique_Number 
from sample_data;
select *, Rank() 
over (partition by department order by age) 
as age_rank 
from sample_data;
select * , dense_rank() 
over (partition by department order by salary) 
as Ranked_Salary 
from sample_data;
select *, ntile(2) 
over (partition by department order by salary) 
as Grouped 
from sample_data;
select * ,salary - person_above 
as difference
from (select *,lag(salary) over (order by name)
 as person_above from sample_data
) cte;
select * , lead(salary) 
over (order by name)
 as person_below
 from sample_data;
select *, min(salary) 
over (partition by department) 
from sample_data;
select department , max(salary) from sample_data
group by department;