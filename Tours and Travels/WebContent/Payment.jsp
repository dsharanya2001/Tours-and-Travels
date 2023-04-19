<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<style type="text/css">
	.form {
		margin: 0 auto;
		width: 210px;
	}

	.form label{
		display: inline-block;
		text-align: right;
		float: left;
	}

	.form input{
		display: inline-block;
		text-align: left;
		float: right;
	}
		body{
background-image:url("img2.jpg");
background-repeat: no-repeat;
height: 780px;
background-position: center;
background-size: cover;
}
</style>
</head>
<body>
<div class="form">
<form action="PaymentSuccess.jsp" method = "POST">
<label>
  Credit Card No:
  <input type="text"> 
</label>

<label>
  Expiry Date:
  <input type="text" placeholder="mm/yy"> 
</label>
 
 <input type="submit" value="submit">
</form>
</div>
</body>
</html>