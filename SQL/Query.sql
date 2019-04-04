-- 1) The student number and ssn of the student whose name is " Becky"

SELECT S.snum, S.ssn FROM Students S WHERE S.name='Becky';

-- 2) The major name and major level of the student whose ssn is 123097834

SELECT R.name, R.level FROM Major R WHERE R.snum IN (Select A.snum FROM Students A WHERE A.ssn='123097834'); 

-- 3) The names of all courses offered by the department of Computer Science

SELECT S.name FROM Courses S WHERE S.department_code IN (SELECT A.code FROM Departments A WHERE A.name='Computer Science');

-- 4) All degree names and levels offered by the department Computer Science

SELECT S.name, S.level FROM Degrees S WHERE S.department_code IN (SELECT A.code FROM Departments A WHERE A.name='Computer Science');

-- 5) The names of all students who have a minor

SELECT S.name FROM Students S WHERE S.snum IN (SELECT A.snum FROM Minor A); 

-- 6) The number of students who have a minor

SELECT count(S.name) FROM Students S WHERE S.snum IN (SELECT A.snum FROM Minor A); 

-- 7) The names and numbers of all students enrolled in course “Algorithm”

SELECT S.name, S.snum FROM Students S WHERE S.snum IN (SELECT A.snum FROM Register A WHERE A.course_number IN (SELECT R.number FROM Courses R WHERE R.name='Algorithm'));

-- 8) The name and snum of the oldest student

SELECT S.name, S.snum FROM Students S WHERE S.dob=(SELECT MIN(S2.dob) FROM Students S2);

-- 9) The name and snum of the youngest student

SELECT S.name, S.snum FROM Students S WHERE S.dob=(SELECT MAX(S2.dob) FROM Students S2);

-- 10) The name, snum and SSN of the students whose name contains letter “n” or “N”

SELECT S.name, S.snum, S.ssn FROM Students S WHERE S.name LIKE '%n%' OR S.name LIKE '%N%'; 

-- 11) The name, snum and SSN of the students whose name does not contain letter
-- “n” or “N”

SELECT S.name, S.snum, S.ssn FROM Students S WHERE S.name NOT LIKE '%n%' AND S.name NOT LIKE '%N%'; 

-- 12) The course number, name and the number of students registered for each
-- course

SELECT S.number, S.name, COUNT(R.snum) FROM Register R LEFT JOIN Courses S ON R.course_number = S.number WHERE R.course_number=S.number GROUP by S.number; 

-- 13) The name of the students enrolled in Fall2015 semester.

SELECT S.name FROM Students S WHERE S.snum IN (SELECT R.snum FROM Register R WHERE R.regtime='FALL2015');
-- 14) The course numbers and names of all courses offered by Department of
-- Computer Science

SELECT S.number, S.name FROM Courses S WHERE S.department_code IN (SELECT R.code FROM Departments R WHERE R.name='Computer Science');

-- 15) The course numbers and names of all courses offered by either Department of
-- Computer Science or Department of Landscape Architect.

SELECT S.number, S.name FROM Courses S WHERE S.department_code IN (SELECT R.code FROM Departments R WHERE R.name='Computer Science' OR R.name='Landscape Architect');


-- SELECT R.snum FROM Register R LEFT JOIN Courses S ON R.course_number = S.number; 
