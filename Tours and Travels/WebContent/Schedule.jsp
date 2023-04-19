<html>
<head>
<title>Schedule</title>
<style type="text/css">
		p{
			font-size: 1.5em;
			font-weight: bold;
		}
		#back{
			margin-top: -1.5em;
			margin-right:1.5em;
			padding:2%;
		}
		div{
			/*width:50%;*/
			margin:0 auto;
			padding:5%;
		}
		a{
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


<h3 align="right"><a href="AdminAfterLogin.jsp" id = "back">BACK</a></h3>

<h1 align = "center"> Schedule</h1>

<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost:3306/bus_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>
   <%
		ResultSet rs = null;
   		Connection con = null;
   		Statement stmt = null;
   		try{
		  Class.forName(JDBC_DRIVER);
		   con = DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt  = con.createStatement();
		   
		   String sql_query = "select * from BUSES order by START_TIME";
		  rs = stmt.executeQuery(sql_query);
		  %>
		  <br><br>
		  <TABLE cellpadding="15" border="1">
		  <TR>
		 
			<TD> <h3>Bus_Id</h3></TD>
			<TD> <h3>Bus_RegNum</h3></TD>
			<TD> <h3>Source</h3></TD>
			<TD> <h3>Destination</h3></TD>
			<TD> <h3>Start_Time</h3></TD>
			<TD> <h3>End_Time</h3></TD>
			
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
			<TD><%= rs.getTime("START_TIME")%></TD>
			<TD><%= rs.getTime("END_TIME")%></TD>
			</TR>
			<%
		  }			  
		  }catch(Exception e)
		{
			out.println(e);
		}
		
		stmt.close();
		rs.close();
		con.close();
   %>
   
   </TABLE>
   </div>
</body>
</html>