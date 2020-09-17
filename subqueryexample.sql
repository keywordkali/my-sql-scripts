-- subquery example
select *
from Student
where gpa > (select avg(gpa)from student) 
-- the stuff in the parenthesis will be answered by SQL first then it will calculate the gpa that is above avg