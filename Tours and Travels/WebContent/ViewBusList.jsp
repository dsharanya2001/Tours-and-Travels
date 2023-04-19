<html>
<head>
<title>Buses</title>
	<style type="text/css">
		a{
		text-decoration:none;
		}
		#back{
			margin-top: 1em;
			margin-right:1.5em;
			padding:1%;
		}
		div > table{
		table-layout:fixed;
		width: 97%;
		}
		th,td{
		font-size: 0.8vw;
		text-align: left;
		font-weight:bold;
		}
		div{
		margin: 0 auto;
		padding: 5%;
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
<h3 align="right" id="back"><a href="AdminAfterLogin.jsp" >BACK</a></h3>
<h1>Buses in the database</h1>

<br>

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
		   
		   String sql_query = "select * from BUSES";
		   rs = stmt.executeQuery(sql_query);
		  %>
		  <br><br>
		  <TABLE cellpadding="15" border="2">
		  <TR>
		 
			<TD> <h3>Bus_Id</h3></TD>
			<TD> <h3>Bus_RegNum</h3></TD>
			<TD> <h3>Source</h3></TD>
			<TD> <h3>Destination</h3></TD>
			<TD> <h3>Fare</h3></TD>
			<TD> <h3>Distance</h3></TD>
			<TD> <h3>Start_Time</h3></TD>
			<TD> <h3>End_Time</h3></TD>
			<TD> <h3>Duration</h3></TD>
			<TD> <h3>Max_Capacity</h3></TD>
			<TD> <h3>Remaining_Seats</h3></TD>
			
			</TR>
		  <%
		  while(rs.next())
		  {
			%>
			<TR>
			<TD><%= rs.getString("BUS_ID")%></TD>
			<TD><%= rs.getString("BUS_REGNUM")%></TD>
			<TD><%= rs.getString("SOURCE")%></TD>
			<TD><%= rs.getString("DESTINATION")%></TD>
			<TD><%= rs.getInt("FARE")%></TD>
			<TD><%= rs.getInt("DISTANCE")%>km</TD>
			<TD><%= rs.getTime("START_TIME")%></TD>
			<TD><%= rs.getTime("END_TIME")%></TD>
			<TD><%= rs.getTime("DURATION")%></TD>
			<TD><%= rs.getInt("MAX_CAPACITY")%></TD>
			<TD><%= rs.getInt("REMAINING_SEATS")%></TD>
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
   </div>
</body>
</html>