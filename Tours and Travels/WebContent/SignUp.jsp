<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Sign Up</title>
	<style type="text/css">
		p{
			font-size: 1.35em;
			margin:1%;
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
		#signup-button{
		font-weight:700; 
		font-size: 1.35em;
		border-radius: 10%; 
		margin: 3% auto;
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

	<div align="center">

	<h3 align="right" id = "back"><a href="index.jsp">BACK</a></h3>
			<h1 align="Center" >Enter user details</h1>

	<br>

		<form action="addUser.jsp" method="POST">
	  
	  	<p>User_Id</p>
	  	<input type="text" name="user_id" value="" placeholder = "Eg: U1">

      	<br>
	  
		<p>User Name </p>
	  	<input type="text" name="user_name" value="" placeholder = "Enter your name">

	  	<br>
	  
	  	<p>Password</p>
	  	<input type="password" name="user_pwd" value="" placeholder="Set a password">

	  	<br>
	  
	  	<p>Date Of Birth</p>
	  	<input type="date" name="user_dob" value="" min="1940/01/01">

	  	<br>
	  
	  	<p>Email Id</p>
	  	<input type="email" name="user_email_id" value="" placeholder = "abc@xyz.com">
	  	<br>
	  	
	  	<p>Mobile</p>
	  	<input type="text" name="user_mobile" value="" placeholder = "Enter your mobile no">

	  	<br>
	  	<br>
      
      	<input type="submit" value="Sign Me Up" id = "signup-button" />
	
    </form>  
    </div>
</body>

</html>