select m.description, c.section, c.subject 
from major m                            -- first table
join majorclassrel mc                   -- table you are joining to the first table
on mc.majorid = m.id                    -- on clause to show the terms on how you want to connect (you need a primary key and foreign)
join class c                            -- third table joining
on c.id = mc.classid                    -- on clause to how these should be joining (look at previus keys from upper 2 tables) 
where m.description = 'general business' -- so I only show classes for the business major