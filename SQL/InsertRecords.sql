-- Insert into table Students
INSERT INTO Students (ssn, snum, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
VALUES ('654651234', '1001', 'Randy', 'M', '20001201', '301 E Hall', '5152700988', '121 Main', '7083066321');

INSERT INTO Students (ssn, snum, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
VALUES ('123097834', '1002', 'Victor', 'M', '20000506', '270 W Hall', '5151234578', '702 Walnut', '7080366333');

INSERT INTO Students (ssn, snum, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
VALUES ('978012431', '1003', 'John', 'M', '19990708', '201 W Hall', '5154132805', '888 University', '5152012011');

INSERT INTO Students (ssn, snum, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
VALUES ('746897816', '1004', 'Seth', 'M', '19981230', '199 N Hall', '5158891504', '21 Green', '5154132907');

INSERT INTO Students (ssn, snum, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
VALUES ('186032894', '1005', 'Nicole', 'F', '20010401', '178 S Hall', '5158891155', '13 Gray', '5157162071');

INSERT INTO Students (ssn, snum, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
VALUES ('534218752', '1006', 'Becky', 'F', '20010516', '12 N Hall', '5157083698', '189 Clark', '2034267632');

INSERT INTO Students (ssn, snum, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
VALUES ('432609519', '1007', 'Kevin', 'M', '20000812', '75 E Hall', '5157082497', '89 National', '7182340772');

-- Insert into table Departments
INSERT INTO Departments (name, code, phone, college)
VALUES ('Computer Science', '401', '5152982801', 'LAS');

INSERT INTO Departments (name, code, phone, college)
VALUES ('Mathematics', '402', '5152982802', 'LAS');

INSERT INTO Departments (name, code, phone, college)
VALUES ('Chemical Engineering', '403', '5152982803', 'Engineering');

INSERT INTO Departments (name, code, phone, college)
VALUES ('Landscape Architect', '404', '5152982804', 'Design');

-- Insert into table Degrees

INSERT INTO Degrees (name, level, department_code)
VALUES ('Computer Science', 'BS', '401');

INSERT INTO Degrees (name, level, department_code)
VALUES ('Software engineering', 'BS', '401');

INSERT INTO Degrees (name, level, department_code)
VALUES ('Computer Science', 'MS', '401');

INSERT INTO Degrees (name, level, department_code)
VALUES ('Computer Science', 'PhD', '401');

INSERT INTO Degrees (name, level, department_code)
VALUES ('Applied mathematics', 'MS', '402');

INSERT INTO Degrees (name, level, department_code)
VALUES ('Chemical Engineering', 'BS', '403');

INSERT INTO Degrees (name, level, department_code)
VALUES ('Landscape Architect', 'BS', '404');

-- Insert into table Major
INSERT INTO Major (snum, name, level)
VALUES ('1001','Computer Science', 'BS');

INSERT INTO Major (snum, name, level)
VALUES ('1002','Software Engineering', 'BS');

INSERT INTO Major (snum, name, level)
VALUES ('1003','Chemical Engineering', 'BS');

INSERT INTO Major (snum, name, level)
VALUES ('1004','Landscape Architect', 'BS');

INSERT INTO Major (snum, name, level)
VALUES ('1005','Computer Science', 'MS');

INSERT INTO Major (snum, name, level)
VALUES ('1006','Applied Mathematics', 'MS');

INSERT INTO Major (snum, name, level)
VALUES ('1007','Computer Science', 'PhD');

-- Insert into table Minor 
INSERT INTO Minor (snum, name, level)
VALUES ('1007','Applied Mathematics', 'MS');

INSERT INTO Minor (snum, name, level)
VALUES ('1005','Applied Mathematics', 'MS');

INSERT INTO Minor (snum, name, level)
VALUES ('1001','Software Engineering', 'BS');

-- Insert into table Courses 

INSERT INTO Courses (name, number, description, credithours, level, department_code)
VALUES ('Spreadsheet','113', 'Microsofr Excel and Access', '3', 'Undergraduate', '401');

INSERT INTO Courses (name, number, description, credithours, level, department_code)
VALUES ('Algorithm','311', 'Design and Analysis', '3', 'Undergraduate', '401');

INSERT INTO Courses (name, number, description, credithours, level, department_code)
VALUES ('Theory of Computation','531', 'theorem and Probability', '3', 'Graduate', '401');

INSERT INTO Courses (name, number, description, credithours, level, department_code)
VALUES ('Database','363', 'Design Principle', '3', 'Undergraduate', '401');

INSERT INTO Courses (name, number, description, credithours, level, department_code)
VALUES ('Water Management','412', 'Water Management', '3', 'Undergraduate', '404');

INSERT INTO Courses (name, number, description, credithours, level, department_code)
VALUES ('Special Topics','228', 'Interesting Topics about CE', '3', 'Undergraduate', '403');

INSERT INTO Courses (name, number, description, credithours, level, department_code)
VALUES ('Calculus','101', 'Limit and Derivative', '4', 'Undergraduate', '402');

-- Insert into table Register

INSERT INTO Register (snum, course_number, grade, regtime)
VALUES ('1001', '363', '3', 'Fall2015');

INSERT INTO Register (snum, course_number, grade, regtime)
VALUES ('1002', '311', '4', 'Fall2015');

INSERT INTO Register (snum, course_number, grade, regtime)
VALUES ('1003', '228', '4', 'Fall2015');

INSERT INTO Register (snum, course_number, grade, regtime)
VALUES ('1004', '363', '3', 'Spring2015');

INSERT INTO Register (snum, course_number, grade, regtime)
VALUES ('1005', '531', '4', 'Spring2015');

INSERT INTO Register (snum, course_number, grade, regtime)
VALUES ('1006', '363', '3', 'Fall2015');

INSERT INTO Register (snum, course_number, grade, regtime)
VALUES ('1007', '531', '4', 'Spring2015');
