
CREATE TABLE Students (  ssn int,
                         snum int,
                         name varchar(10),
                         gender varchar(1),
                         dob datetime,
                         c_addr varchar(20),
                         c_phone varchar(10),
                         p_addr varchar(20),
                         p_phone varchar(10),
                         primary key (ssn),
                         unique (snum) );

CREATE TABLE Departments (  name varchar(50),
                            code int,
                            phone varchar(10),
                            college varchar(20),
                            primary key (code),
                            unique (name) );


CREATE TABLE Degrees ( name varchar(50),
					   level varchar(5),
                       department_code int,
					   primary key (name, level),
                       foreign key (department_code) references Departments(code));


CREATE TABLE Courses (  name varchar(50),
                        number int,
                        description varchar(50),
                        credithours int,
                        level varchar(20),
                        department_code int,
                        primary key (number),
                        unique (name),
                        foreign key (department_code) references Departments(code));

CREATE TABLE Major(	snum int,
					name varchar(50),
                    level varchar(5),
				    primary key (snum, name, level),
                    foreign key (snum) references Students(snum),
                    foreign key (name, level) references Degrees(name, level));


CREATE TABLE Minor(	snum int,
					name varchar(50),
                    level varchar(5),
				    primary key (snum, name, level),
                    foreign key (snum) references Students(snum),
				    foreign key (name, level) references Degrees(name, level));                                          



CREATE TABLE Register ( snum int,
                        course_number int,
                        grade int,
                        regtime varchar(20),
                        primary key (snum, course_number),
                        foreign key (snum) references Students(snum),
                        foreign key (course_number) references Courses(number) );                      

-- CREATE TABLE Offer (  name CHAR(20),
--                       number INTEGER,
--                       PRIMARY KEY (number),
--                       FOREIGN KEY(number)
--                             REFERENCES Courses,
--                       FOREIGN KEY (name)
--                             REFERENCES Departments );
-- 
-- CREATE TABLE Administer (  name CHAR(20),
--                            degree CHAR(20),
--                            level INTEGER,
--                            PRIMARY KEY (degree, level),
--                            FOREIGN KEY(degree, level)
--                                  REFERENCES Degrees,
--                            FOREIGN KEY (name)
--                                  REFERENCES Departments );                    
-- 