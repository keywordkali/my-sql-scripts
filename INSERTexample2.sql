insert student
(Id, Firstname, Lastname, SAT, GPA, MajorID)
VALUES
(0, 'Joe', 'Smith', 1450, 3.75,
(select id from major where description = 'Math'))         