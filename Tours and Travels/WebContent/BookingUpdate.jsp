<html>
<head>
	<title>Tickets Booked</title>
	<style>
	#back-to-home-button{
		font-weight:700; 
		font-size: 1.35em;
		border-radius: 10%; 
		margin: 3% auto;
		}
	div{
		/*width:50%;*/
		margin:0 auto;
		padding:5%;
		}
		#book-another-ticket{
			margin-top: -1.5em;
			margin-right:1.5em;
			padding:2%;
		
		}
	body{
background-image:url("img2.jpg");
background-repeat: no-repeat;
background-position: center;
background-size: cover;
}
	</style>
</head>

<body>	
<div align = "center">

<h3 align = "right" id = "book-another-ticket"><a href = "BookTicket.jsp">Book Another Ticket</a></h3>


<h2>
<%@ page import ="java.util.*,java.sql.*,java.io.*,javax.*"%>
<%--@ page import = "javax.mail.*,javax.mail.internet.*,javax.activation.*"--%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost:3306/bus_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>
   <%!Connection con = null;%>
   <%
   Statement stmt=null;
   ResultSet rs=null;
		
   // Display distance form buses table (sql query) 
   
         String Source = request.getParameter("source");
		 String Destination = request.getParameter("destination");
		 String Journey_Date = request.getParameter("journey_date");
		 String No_Of_Tickets = request.getParameter("no_of_tickets");
         
		 int n = Integer.parseInt(No_Of_Tickets);
		 
		 int Total_Fare = n;
		 
		 try{
			 
			Class.forName(JDBC_DRIVER);
		    con=DriverManager.getConnection(DB_URL,USER,PASS);
		    stmt=con.createStatement();
			
			String sql_query ="update BUSES set REMAINING_SEATS = REMAINING_SEATS - "+ n +" where SOURCE = '"+ Source +"' and DESTINATION ='"+Destination+"'";
			
			stmt.executeUpdate(sql_query);
			
			sql_query = "select REMAINING_SEATS from BUSES where SOURCE = '"+ Source +"' And DESTINATION = '"+Destination+"'";
			
			rs = stmt.executeQuery(sql_query);
			
			
			int seats_rem = 0;
			
			while(rs.next())
				seats_rem = rs.getInt("REMAINING_SEATS");
			
			if(seats_rem < 0){
				out.println("<br><pre>Sorry!! number of seats remaining are lesser.");
				sql_query = "update BUSES set REMAINING_SEATS = REMAINING_SEATS + " + n + " where SOURCE = '" + Source + "' and DESTINATION = '" + Destination + "'";
				stmt.executeUpdate(sql_query);
			}
			else{
				
			sql_query ="select * from BUSES where SOURCE ='"+Source+"' and DESTINATION ='"+Destination+"'";
			
			rs = stmt.executeQuery(sql_query);
			
			String Bus_Id = "";
			String Bus_Regnum = "";
			String Distance = "";
			String Duration = "";
			String Start_Time = "";
			String End_Time = "";
			boolean flag = false;

			while(rs.next()){
				
				Bus_Id = rs.getString("BUS_ID");
				Bus_Regnum = rs.getString("BUS_REGNUM");
				Distance = rs.getString("DISTANCE");
				Start_Time = rs.getString("START_TIME");
				End_Time = rs.getString("END_TIME");
				Duration = rs.getString("DURATION"); 
				Total_Fare = n * rs.getInt("FARE");
				flag = true;
			}
			if(flag){
				%>
				<h1>Booking Details</h1>
				<TABLE border="1" cellpadding="2" style="width:40%">
				<tr>
				  <th>Journey Date</th>
				  <td><%=Journey_Date %></td>
				</tr>
				
				<tr>
				  <th>Bus ID</th>
				  <td><%=Bus_Id %></td>
				</tr>
				
				<tr>
				  <th>Bus Reg Num</th>
				  <td><%=Bus_Regnum%></td>
				</tr>
				
				<tr>
				  <th>Source</th>
				  <td><%=Source%></td>
				</tr>
				
				<tr>
				  <th>Destination</th>
				  <td><%=Destination%></td>
				</tr>
				
				<tr>
				  <th>Distance</th>
				  <td><%=Distance%>km</td>
				</tr>
				
				<tr>
				  <th>Start Time</th>
				  <td><%=Start_Time%></td>
				</tr>
				
				<tr>
				  <th>End Time</th>
				  <td><%=End_Time%></td>
				</tr>
				
				<tr>
				  <th>Duration</th>
				  <td><%=Duration%></td>
				</tr>
				
				<tr>
				  <th>No of Tickets</th>
				  <td><%=No_Of_Tickets%></td>
				</tr>
				
				<tr>
				  <th>Total Fare</th>
				  <td>$<%=Total_Fare%></td>
				</tr>
				
				</TABLE>
		 
		 
		 <% 		
		 sql_query = "Insert Into TICKET_BOOKINGS (USER_ID,JOURNEY_DATE,BUS_ID,SOURCE,DESTINATION,DISTANCE,START_TIME,END_TIME,DURATION,NO_OF_TICKETS,TOTAL_FARE) Values ('"+session.getAttribute("userId")+"','"+Journey_Date+"','"+ Bus_Id +"','"+ Source +"','"+ Destination +"','"+ Distance +"','"+ Start_Time +"','"+ End_Time +"','"+ Duration + "','"+ n +"','"+ Total_Fare +"')"; // checkkkkk!!!!!!!!!!!!!!!!! U_id
		 stmt.execute(sql_query);
		}
			
			else 
				response.sendRedirect("http://localhost:8080/Tours_and_Travels/NoBuses.jsp");		
			}	
			
		 }catch(Exception e){
			 out.println("Please enter your booking details");
		 }
		 
			 stmt.close();
		 	 rs.close();
			 con.close();
        %>
   
   </h2>
   
   <div align = "center">
     <form action="Payment.jsp" method="POST">
        <input type="submit" value="Pay Now" id = "back-to-home-button">
     </form>
   </div>
	</div>
   </body>
</html>