<html>
<head>
<title>Validation</title>
</head>
<body>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
<%!String DB_URL = "jdbc:mysql://localhost:3306/bus_system";%>
<%!String USER = "root";%>
<%!String PASS = "root";%>
<%
  	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	String Id = request.getParameter("id");
	String Pwd = request.getParameter("pwd");
	String Role = request.getParameter("role");
	
	try{
		   
		Class.forName(JDBC_DRIVER);
		con = DriverManager.getConnection(DB_URL,USER,PASS);
		stmt = con.createStatement();
		
		   if(Role.equals("user")){
			   session.setAttribute("userId",Id);
			   String sql_query = "select * from USERS where USER_ID ='"+ Id +"'and USER_PWD ='"+ Pwd +"'";
			   rs = stmt.executeQuery(sql_query);
			   if(rs.next())
			   {
				   response.sendRedirect("UserAfterLogin.jsp");
			   }
			   else
			   {
					response.sendRedirect("UserError.jsp");
			   }
		   }
		   else if(Role.equals("admin")){
			 String sql_query = "select * from ADMIN where ADMIN_ID='"+ Id +"'and ADMIN_PWD ='"+ Pwd +"'";
			   rs = stmt.executeQuery(sql_query);
			   if(rs.next())
			   {
				   response.sendRedirect("AdminAfterLogin.jsp");
			   }
			   else
			   {
					response.sendRedirect("AdminError.jsp");
			   } 
		   }
	}catch(Exception e)
	{
		out.println(e);
	}
	rs.close();
	stmt.close();
	con.close();
	
%>

</body>
</html>
