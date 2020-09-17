-- union example
select lastname, 'A' as 'ABC' 
from student 
where sat > 1200
union 
select lastname, 'B' as 'ABC' from student where sat <= 1200 and sat > 1000
union 
select lastname, 'C' as 'ABC' from student where sat < 1000