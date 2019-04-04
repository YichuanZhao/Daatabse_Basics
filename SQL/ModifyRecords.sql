-- 1) Change the name of the student with ssn = 746897816 to Scott

UPDATE Students
SET name = 'Scott'
WHERE ssn = '746897816';

-- 2) Change the major of the student with ssn = 746897816 to Computer Science,
-- Master.

UPDATE Major 
SET name='Computer Science', level='MS' 
WHERE (Select S.snum FROM Students S WHERE S.ssn='746897816');


-- 3) Delete all registration records that were in “Spring2015”
DELETE
FROM Register
WHERE regtime = 'Spring2015'