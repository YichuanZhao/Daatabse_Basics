<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Click "Submit" to create tables.</h3>

<form action="CreateTables.jsp" method = "post">
  <input type="submit" name="submit" value="Submit"/>
</form>


<%! 
public static void createTable() throws Exception{
	try{
		Connection con = getConnection();
		PreparedStatement create = con.prepareStatement("CREATE TABLE Students(ssn int,snum int,name varchar(10), gender varchar(1), dob datetime, c_addr varchar(20),c_phone varchar(10),p_addr varchar(20),p_phone varchar(10),primary key (ssn),unique (snum))");
		create.executeUpdate();

		create = con.prepareStatement("CREATE TABLE Departments (  name varchar(50),code int,phone varchar(10),college varchar(20),primary key (code),unique (name) )");
		create.executeUpdate();
		
		create = con.prepareStatement("CREATE TABLE Degrees ( name varchar(50),level varchar(5),department_code int,primary key (name, level),foreign key (department_code) references Departments(code))");
		create.executeUpdate();
		
		create = con.prepareStatement("CREATE TABLE Courses (  name varchar(50),number int,description varchar(50),credithours int,level varchar(20),department_code int,primary key (number),unique (name),foreign key (department_code) references Departments(code))");
		create.executeUpdate();
		
		create = con.prepareStatement("CREATE TABLE Major(	snum int,name varchar(50),level varchar(5),primary key (snum, name, level),foreign key (snum) references Students(snum),foreign key (name, level) references Degrees(name, level))");
		create.executeUpdate();
		
		create = con.prepareStatement("CREATE TABLE Minor(	snum int,name varchar(50),level varchar(5),primary key (snum, name, level),foreign key (snum) references Students(snum),foreign key (name, level) references Degrees(name, level))");
		create.executeUpdate();
		
		create = con.prepareStatement("CREATE TABLE Register ( snum int,course_number int,grade int,regtime varchar(20),primary key (snum, course_number),foreign key (snum) references Students(snum),foreign key (course_number) references Courses(number) )");
		create.executeUpdate();
		
	}catch(Exception e){System.out.println(e);}
	finally{
		System.out.println("Function Complete");
	};

}

public static Connection getConnection() throws Exception{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl = "jdbc:mysql://localhost:3306/new_schema";
		String username = "root";
		String password = "1";

		Connection myConnection = DriverManager.getConnection(dbUrl, username, password);			

		return myConnection;
	}catch(Exception e){
		System.out.println(e.getMessage());
	}

	return null;

}

%>

<% 

String t = request.getParameter("submit");

if(t != null){

	createTable();
	response.sendRedirect("CreateTablesResult.jsp");

}
%>
</body>
</html>