-- parameterized query example 
-- where you set parameters (variables) instead of hard coded values. You do this when you run a query where the value changes each time**
set @maxsat = 1100; -- the set command means declare. Here we made the word @maxsat to equall to 1100 in this case. 

select * from Student 
where sat > 1100 -- this number will change if we get different students with different sat scores**
order by sat desc