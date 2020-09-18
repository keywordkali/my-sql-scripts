update student set 
firstname = 'joseph'
where id = 191 or id = 192
-- another way to write this but easier is the where in statement where id in (191, 192)

select * from student where
firstname = 'Joe' -- used this query to find how many joe's are in the system to know which id they both had to make sure I only updated those
