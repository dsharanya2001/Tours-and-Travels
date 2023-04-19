<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Cancellation confirmation page</title>
	<style>
		#back{
			margin-top: 0.5em;
			padding:1%;
			text-decoration: none;
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
	    Statement stmt = null;
	    ResultSet rs = null;  
		
	    try{
		    Class.forName(JDBC_DRIVER);
		    con = DriverManager.getConnection(DB_URL,USER,PASS);
		    int ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
		    //setting status
		    ps=con.prepareStatement("update TICKET_BOOKINGS set status = 'Cancelled' where TICKET_ID = '"+ticket_id+"' ");
		    ps.executeUpdate();
		    con.commit();
		    
		    //ps = con.prepareStatement("select * from TICKET_BOOKINGS where TICKET_ID = '"+ticket_id+"'");
		    //rs = ps.executeQuery();
		    
		    //retrieving the bus details
		    String sql_query = "select * from TICKET_BOOKINGS where TICKET_ID = '"+ticket_id+"'";
		    rs = stmt.executeQuery(sql_query);
		    
		    int n = 0;
			int rem_seats = 0;
		    String bus_id = "";
		    
		    while(rs.next()){
		    	n = rs.getInt("NO_OF_TICKETS");
		    	bus_id = rs.getString("BUS_ID");
		    }
		    System.out.println(bus_id);
		    
		    //Getting the remaining seats
		    sql_query = "select REMAINING_SEATS from buses where BUS_ID ="+ bus_id;
		    rs = stmt.executeQuery(sql_query);
		    while(rs.next())
		    {
		    	rem_seats = rs.getInt("REMAINING_SEATS");
		    }
		    int final_seats = rem_seats+n;
		    sql_query = "update BUSES set REMAINING_SEATS =  " + final_seats + " where BUS_ID = " + bus_id ;
		    
		    stmt.executeUpdate(sql_query);
		    con.commit();
		
	    }catch(Exception e){}
	%>
	
<div align = "center">
   <h1 align = "center">Cancellation successful!</h1>
   <form action="UserBookingHistory.jsp" method="POST">
      <input type="submit" value="Go Back" id = "back">
   </form>
</div>

</body>
</html>