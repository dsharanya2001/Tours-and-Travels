<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add User</title>
<style>
h1{
margin:2em;
}
</style>
</head>
<body>

<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost:3306/bus_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>
   <%!Connection con = null;%>
   
   
   <%
	Statement stmt = null;
	String User_Id = request.getParameter("user_id");
	String User_Name = request.getParameter("user_name");
	String User_Pwd = request.getParameter("user_pwd");
	String User_DOB = request.getParameter("user_dob");
	String User_Email = request.getParameter("user_email");
	String User_Mobile = request.getParameter("user_mobile");

	
	try
	{
		   Class.forName(JDBC_DRIVER);
		   con = DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt = con.createStatement();
		   
		   String sql_query = "insert into USERS (USER_ID,USER_NAME,USER_PWD,USER_DOB,USER_EMAIL,USER_MOBILE) values('"+ User_Id +"','"+ User_Name +"','"+ User_Pwd +"','"+ User_DOB +"','"+ User_Email +"','"+User_Mobile+"')";
		  
		   stmt.execute(sql_query);
		   System.out.println("User added successfully");

	}catch(Exception e){
		out.println(e);
		}
	
	stmt.close();
	con.close();

	%>
   
<h1 align = "center" >Sign Up Successful!</h1>
<br>
 <h2 align ="center"><a href="index.jsp">Login to Continue </a></h2>
</body>
</html>

