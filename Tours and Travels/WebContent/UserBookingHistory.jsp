<html>
<head>
<title>User Bookings</title>
	<style>
		#back{
			margin-top: -1.5em;
			padding:2%;
			text-decoration: none;
		}
		
		div{
			/*width:50%;*/
			margin:0 auto;
			padding:5%;
		}
		
		a{
		text-decoration:none;
		}
		
		button{
		margin-left:51em;
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

<div align = "left">

 <h3 align ="right" id= "back"><a href="UserAfterLogin.jsp"> BACK </a></h3>
<h1 align ="center">Your bookings</h1>


<h3>

<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost:3306/bus_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>

	
	<%
		
	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
		try{
		  Class.forName(JDBC_DRIVER);
		   con = DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt = con.createStatement();
		   String sql_query = "select * from TICKET_BOOKINGS where USER_ID = '"+session.getAttribute("userId")+"' ";
		   rs = stmt.executeQuery(sql_query);
	%>
	
		  <br>
		  <br>
		  
		  <TABLE cellpadding="15" border="1">
		  <TR>
		     <TH>TICKET_ID</TH>
			 <!-- <th>USER_ID</th> -->
			 <th>JOURNEY_DATE</th>
			 <th>BUS_ID</th>
			 <th>SOURCE</th>
			 <th>DESTINATION</th>
		     <th>DISTANCE</th>
			 <th>START_TIME</th>
			 <th>END_TIME</th>
			 <th>DURATION</th>
			 <th>NO_OF_TICKETS</th>
			 <th>STATUS</th>	
		</TR>
		  
		  <%
		  int Ticket_Id = 0;
		  while(rs.next()){
			 Ticket_Id = rs.getInt("TICKET_ID");
			 session.setAttribute("ticket_id",Ticket_Id);
			  
			%>
			<TR>
			<TD><%= rs.getInt("TICKET_ID")%></TD> 
			<%-- <TD><%= rs.getString("USER_ID")%></TD> --%>
			<TD><%= rs.getString("JOURNEY_DATE")%></TD>
			<TD><%= rs.getString("BUS_ID")%></TD>
			<TD><%= rs.getString("SOURCE")%></TD>
			<TD><%= rs.getString("DESTINATION")%></TD>
			<TD><%= rs.getInt("DISTANCE")%></TD>
			<TD><%= rs.getTime("START_TIME")%></TD>
			<TD><%= rs.getTime("END_TIME")%></TD>
			<TD><%= rs.getTime("DURATION")%></TD>
			<TD><%= rs.getInt("NO_OF_TICKETS")%></TD>
			<TD id = "status" onchange= "changeColor()"><%= rs.getString("STATUS")%></TD>
			<%--<TD> <a href='<%=rs.getInt("TICKET_ID") %>'><%=rs.getInt("TICKET_ID") %></a></TD>--%>
			<%-- <TD> <a href = "CancelTicket.jsp">Cancel Booking</a></TD> --%>
			</TR>
			
			<%
		  }			  
		  }catch(Exception e)
		{
			out.println(e);
		}
		
		rs.close();
		stmt.close();
		con.close();
				
		
   %>
   </TABLE>
	</h3>
	</div>
    <!--  <button onClick="alertuser()">
	 <a href = "CancelTicket.jsp" >Cancel a Booking</a>
	</button>-->
	<h3 align = "center"><a href="CancelTicket.jsp" onclick="alert('Note your ticket id!');">CANCEL  A  BOOKING</a></h3>
	
</body>

<script>
function alertuser()
{
  window.alert("Please Note the ID of the ticket you want to cancel");	
}
</script>
</html>