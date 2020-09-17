set @lowsat = 1000;  -- declaration that @lowsat means 1000
set @highsat = 1200; -- declaration that @highsat means 1200 no spaces are allowed when declaring the = sign is an assignment to the var

select *
from student 
where sat >= @lowsat and sat <= @highsat;