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

<h3>Click "Submit" to modify data records.</h3>

<form action="ModifyRecords.jsp" method = "post">
  <input type="submit" name="submit" value="Submit"/>
</form>

<%!
public static void modify() throws Exception{
	try{
		Connection con = getConnection();
		
		PreparedStatement statement = con.prepareStatement("UPDATE Students SET name = 'Scott' WHERE ssn = '746897816'");
		statement.executeUpdate();

	}catch(Exception e){System.out.println(e);}
	finally{
		System.out.println("Modify complete");
	}
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

	modify();
	response.sendRedirect("ModifyRecordsResult.jsp");

}

%>
</body>
</html>