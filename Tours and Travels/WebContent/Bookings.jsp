<html>
<head>
<title>Previous Bookings</title>
<style>
#back{
			margin-top: 1.5em;
			margin-right:1.5em;
			padding:2%;
		}
#back a{
text-decoration:none;
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

 <h3 align ="right" id="back"><a href="AdminAfterLogin.jsp"> BACK </a></h3>
 
<h1 align ="center">PREVIOUS BOOKINGS</h1>

<h2>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost:3306/bus_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>
	
	<%
		ResultSet rs=null;

		try{
		  Class.forName(JDBC_DRIVER);
		   Connection con=DriverManager.getConnection(DB_URL,USER,PASS);
		   Statement st=con.createStatement();
		   
		   String sql_query = "select * from TICKET_BOOKINGS";
		   rs=st.executeQuery(sql_query);
	%>
	
		  <br>
		  <br>
		  
		  <TABLE cellpadding="15" border="1">
		  <TR>
			<TD> <h3>USER_ID</h3></TD>
			<TD> <h3>JOURNEY_DATE</h3></TD>
			<TD> <h3>BUS_ID</h3></TD>
			<TD> <h3>SOURCE</h3></TD>
			<TD> <h3>DESTINATION</h3></TD>
			<TD> <h3>START_TIME</h3></TD>
			<TD> <h3>END_TIME</h3></TD>
			<TD> <h3>NO_OF_TICKETS</h3></TD>
			<TD> <h3>STATUS</h3></TD>
			
		</TR>
		  
		  <%
		  while(rs.next()){
			%>
			<TR>
			<TD><%= rs.getString("USER_ID")%></TD>
			<TD><%= rs.getString("JOURNEY_DATE")%></TD>
			<TD><%= rs.getString("BUS_ID")%></TD>
			<TD><%= rs.getString("SOURCE")%></TD>
			<TD><%= rs.getString("DESTINATION")%></TD>
			<TD><%= rs.getTime("START_TIME")%></TD>
			<TD><%= rs.getTime("END_TIME")%></TD>
			<TD><%= rs.getInt("NO_OF_TICKETS")%></TD>
			<TD><%= rs.getString("STATUS")%></TD>
			</TR>
			<%
			
		  }			  
		  }catch(Exception e){
			out.println(e);
		}
		
		rs.close();
		
   %>
   </TABLE>
	</h2>
	</div>
 
</body>
</html>