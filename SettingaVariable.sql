set @studentsat = 1000;
select *
from Major 
where minsat <= @studentsat
