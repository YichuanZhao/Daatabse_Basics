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
<h3>Click "Q1" to see result of query 1.</h3>

<form action="Query.jsp" method = "post">
  <input type="submit" name="submit_1" value="Q1" />
</form>

<h3>Click "Q1" to see result of query 3.</h3>

<form action="Query.jsp" method = "post">
  <input type="submit" name="submit_2" value="Q2" />
</form>

<h3>Click "Q1" to see result of query 3.</h3>

<form action="Query.jsp" method = "post">
  <input type="submit" name="submit_3" value="Q3" />
</form>


<%!

public static ArrayList<String> query1() throws Exception{
	try{
		Connection con = getConnection();
		PreparedStatement statement = con.prepareStatement("SELECT S.snum, S.ssn FROM Students S WHERE S.name='Becky'");
		ResultSet result = statement.executeQuery();

		ArrayList<String> s = new ArrayList<String>();

		System.out.println("1) The student number and ssn of the student whose name is 'Becky'\n");

		while(result.next()){

			System.out.println(result.getString("S.snum") + "..." + result.getString("S.ssn"));
			// System.out.println(result.getInt("S.ssn"));
			System.out.println("\n");

			s.add(result.getString("S.snum"));
			s.add(result.getString("S.ssn"));
		}
		
		return s;
		
	}catch(Exception e){System.out.println(e);}
	finally{
		System.out.println("Select Complete");
	}

	return null;
	
}


public static ArrayList<String> query2() throws Exception{
	try{
		Connection con = getConnection();

		PreparedStatement statement = con.prepareStatement("SELECT S.name, S.level FROM Degrees S WHERE S.department_code IN (SELECT A.code FROM Departments A WHERE A.name='Computer Science')");
		ResultSet result = statement.executeQuery();
		ArrayList<String> s = new ArrayList<String>();
		System.out.println("2) All degree names and levels offered by the department Computer Science \n");
		while(result.next()){

			System.out.println(result.getString("S.name") + "..." + result.getString("S.level"));
			// System.out.println(result.getString("S.level"));
			System.out.println("\n");
			s.add(result.getString("S.name"));
			s.add(result.getString("S.level"));
		}
		
		return s;

	}catch(Exception e){System.out.println(e);}
	finally{
		System.out.println("Select Complete");
	}

	return null;
	
	
}

public static ArrayList<String> query3() throws Exception{
	try{
		Connection con = getConnection();
		PreparedStatement statement = con.prepareStatement("SELECT S.number, S.name FROM Courses S WHERE S.department_code IN (SELECT R.code FROM Departments R WHERE R.name='Computer Science' OR R.name='Landscape Architect')");
		ResultSet result = statement.executeQuery();

		ArrayList<String> s = new ArrayList<String>();

		System.out.println("3) The course numbers and names of all courses offered by either Department of Computer Science or Department of Landscape Architect.'\n");

		while(result.next()){

			// System.out.println(result.getInt("S.ssn"));
			System.out.println("\n");

			s.add(result.getString("S.number"));
			s.add(result.getString("S.name"));
		}


		return s;
	}catch(Exception e){System.out.println(e);}
	finally{
		System.out.println("Select Complete");
	}

	return null;
	
	
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

int check = 0;
String t1 = request.getParameter("submit_1");

String t2 = request.getParameter("submit_2");

String t3 = request.getParameter("submit_3");

if(t1!=null){
	
	ArrayList<String> s1 = query1();
	
    request.setAttribute("s1",s1);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("QueryResult1.jsp");
    if (dispatcher != null){
            dispatcher.forward(request, response);
    } 
	response.sendRedirect("QueryResult1.jsp");
	
	
}

if(t2!=null){
	
	ArrayList<String> s2 = query2();
	
    request.setAttribute("s2",s2);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("QueryResult2.jsp");
    if (dispatcher != null){
            dispatcher.forward(request, response);
    } 
	response.sendRedirect("QueryResult2.jsp");	
	
}


if(t3!=null){
	
	ArrayList<String> s3 = query3();
    request.setAttribute("s3",s3);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("QueryResult3.jsp");
    if (dispatcher != null){
            dispatcher.forward(request, response);
    } 
	response.sendRedirect("QueryResult3.jsp");		
	
}

%>

</body>
</html>