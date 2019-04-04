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


<table width="59%" border="1">

	 <tr>
	  <th>Student Number</th>
	  <th>SSN</th> 
	</tr>
    <%
	    ArrayList<String> s = (ArrayList<String>) request.getAttribute("s1");
	
	    int l = s.size();
	    
	    int index = 0;
	    
        while(index < l)
        {
            %>
                <tr>
                 <%
                    { %>
                     <td>
                     <%= s.get(index)%>
                     </td>
                     <td>
                     <%= s.get(index + 1) %>
                     </td>
                <% 
                    }
                %>                   
                </tr>
            <% 
            index += 2;
        }
    %>
</table>

</body>
</html>