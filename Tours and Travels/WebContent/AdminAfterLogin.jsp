<html>
<head>
	<title>Admin Home</title>
	<style type="text/css">
		li{
			font-size: 100%;
			font-weight: bold;
			padding:5%;
		}
		ul#admin-priviliges li {
  			display:inline;
		}
		p{
			font-size: 1.5em;
			font-weight: bold;
			margin:3%;
		}
		div{
			/*width:50%;*/
			margin:0 auto;
			padding:5%;
		}
		#logout{
			margin-top: -1.5em;
			margin-right:1.5em;
			padding:2%;
		}
		#logout a{
		text-decoration:none;
		}
		body{
		background-image:url("img1.jpg");
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
		}
	</style>
</head>

<body>


<div align = "center">
	<h3 align="right" id = "logout"><a href="index.jsp">LOGOUT</a></h3>
	<h1> Welcome Admin!</h1>
<br>

<!--  ul id="admin-priviliges">
<li><a href ="ViewBusList.jsp">List of Buses</a></li>
<li><a href ="Schedule.jsp">View Schedule</a></li>
<li><a href ="Bookings.jsp">View all bookings</a></li>
</ul>-->


<p><a href ="ViewBusList.jsp">List of Buses</a></p>
<p><a href ="Schedule.jsp">View Schedule</a></p>
<p><a href ="Bookings.jsp">View all bookings</a></p>


</div>
</body>
</html>