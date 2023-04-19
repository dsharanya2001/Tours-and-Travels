<html>
<head>
<title>Tickets Booking</title>
<style>
	#book-ticket-button{
		font-weight:700; 
		font-size: 1.35em;
		border-radius: 10%; 
		margin: 3% auto;
		}
		/*#rightdiv,#leftdiv{
			width:45%;
			margin:0 0;
			/*padding:5%;*/
		}*/
		#back{
			margin-top: -1.5em;
			margin-right:1.5em;
			padding:2%;
		}
		#back a{
		text-decoration:none;
		}
		#wrapper {
  		width:100%;
  		clear:both;
		}
		
		#leftdiv {
  		width:46%;
  		float:left;
  		margin:1%;
  		border:black;
  		text-align:center;
		}
		
		#rightdiv{
  		width:46%;
  		float:right;
  		margin:1%;
  		padding:1.5%;
  		border:black;
  		text-align:center;
}
div > table{
table-layout:fixed;
width:97%;
}

th,td{
font-size:0.9vw;
text-align:left;
font-weight:bold;
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

<div id="wrapper">
  <div id="leftdiv">
  <br>
  <br>
<h2>Available Buses</h2>

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
		  
		  <br>
		  <br>
		  
		  <TABLE cellpadding="5" border="2" align = "center">
		  <TR>
			<TD> Source</TD>
			<TD> Destination</TD>
			<TD> Fare</TD>
			<TD> Distance</TD>
			<TD> Start_Time</TD>
			<TD> End_Time</TD>
			<TD> Duration</TD>
			
			</TR>
		  <%
		  while(rs.next())
		  {
			%>
			<TR>
			<TD><%= rs.getString("SOURCE")%></TD>
			<TD><%= rs.getString("DESTINATION")%></TD>
			<TD><%= rs.getInt("FARE")%></TD>
			<TD><%= rs.getInt("DISTANCE")%></TD>
			<TD><%= rs.getTime("START_TIME")%></TD>
			<TD><%= rs.getTime("END_TIME")%></TD>
			<TD><%= rs.getTime("DURATION")%></TD>
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
  
  <div id="rightdiv" >
  <h3 align = "right" id = "back"><a href = "UserAfterLogin.jsp">BACK</a></h3>

<h2 align="Center">Book Your Tickets</h2>
<br>

<form action="BookingUpdate.jsp" method="POST">
	  
	  <h3 align = "center">From</h3>
      <input type="text" name="source" value="" required >
      <br>
	 
	  <h3 align = "center">To</h3>
	  <input type="text" name="destination" value="" required >
	  <br>
	 
	  <h3 align = "center"> Date </h3>
	  <input type="date" name="journey_date" value="" required id = "journey_date" >
	  
	  <br>
	 
	  <h3 align = "center">Number of Tickets</h3>
	  <input type="number" name="no_of_tickets" value="" required min = 1 max = 20 >
	  <br><br><br>
     
      <input type="submit" value="Book" id = "book-ticket-button"/>
	  
 </form>
  </div>
</div>

<script>
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1; //January is 0!
	var yyyy = today.getFullYear();

	if (dd < 10) {
	  dd = '0' + dd
	}

	if (mm < 10) {
	  mm = '0' + mm
	}

	today = yyyy + '-' + mm + '-' + dd;
	document.getElementById('journey_date').setAttribute("min", today);
</script>

</body>
</html>