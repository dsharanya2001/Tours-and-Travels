<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Cancellation confirmation page</title>
	<style>
		#back,#cancel-ticket{
			margin-top: 0.5em;
			padding:1%;
			text-decoration: none;
		}
		div{
			margin:0 auto;
			padding:5%;
		}
		body{
	background-image:url("img2.jpg");
background-repeat: no-repeat;
height: 720px;
background-position: center;
background-size: cover;
}
	</style>
</head>
<body>

<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost:3306/bus_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>

	
	<%
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	  %>
	  
	  <div align="center">
	  <h3 align="right" id="back">
	   <a href="UserBookingHistory.jsp">BACK</a>
	  </h3>
	  <form action="FinalCancel.jsp" method="POST">
	  <label>
	    <h3>Ticket ID</h3>
	    <input type="number" name="ticket_id" required>
	  </label>
	  <br>
	  <br>
	  
	  <input type="submit" value="Cancel Ticket" id="cancel-ticket"> 
 	  </form>
 	  </div>
</body>
</html>