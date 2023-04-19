<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	    Statement stmt = null;
	    ResultSet rs = null;  
		
	    String ticket_id = (String)request.getAttribute("ticket_id");
	    try{
	    	String sql_query = " select * from TICKET_BOOKINGS where TICKET_ID = '" + ticket_id +"'";
		    rs = stmt.executeQuery(sql_query);
		    int n = 0;
		    String bus_id = "";
		    while(rs.next())
		    {
		    	n = rs.getInt("NO_OF_TICKETS");
		    	bus_id = rs.getString("BUS_ID");  
		    }
		    System.out.println(n);
		    System.out.println(bus_id);
            
    }catch(Exception e){}
%>
</body>
</html>