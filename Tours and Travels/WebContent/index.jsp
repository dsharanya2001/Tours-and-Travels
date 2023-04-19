<html>
<head>
<title>Tours and Travels</title>
<style type="text/css">
	form { 
margin: 0 auto; 
width:50%;
}
h1,h2{
	margin:0 auto;
	width:50%;
}
#signin-button{
		font-weight:700; 
		font-size: 1.35em;
		border-radius: 10%; 
		margin: 3% auto;
		}
a{
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

<br>
<br>

<h1 align="center">Tours and Travels</h1>

<br>
<br>

<h2 align="center">Enter your login credentials</h2>
<br>
<div align="center">
<form action="Validation.jsp" method="POST" >
	 <h3>ID</h3>
	 <input type="text" name="id" value="" placeholder = "Enter your user id">

	 <h3>Password</h3>
	 <input type="password" name="pwd" value="" placeholder = "Enter your password">
	 
	 <br>
	 <br>
	 
	 <h3>Role</h3>
	 <input type="radio" name="role" value="user" checked> User
	 
	 <input type="radio" name="role" value="admin">Admin
	  
	 <br>
	 <br>
	 
     <input type="submit" value="Login"  id = "signin-button"/>
     <br>
     
     <h3>New User? <a href="SignUp.jsp" >Sign Up</a></h3>
     
</form> 
</div>
</body>
</html>