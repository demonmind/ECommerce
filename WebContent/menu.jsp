<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body{
	margin:0;
}
#menu{
	position: absolute;
	margin: 0 auto;
	top: 0;
	background-color: #ededed;
	width: 100%;
	height: 50px;
}

.home {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:22px;
	font-weight:bold;
	padding:11px 24px;
	text-decoration:none;
	text-shadow:1px 1px 0px #ffffff;
	float:right;
}.home:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
	background-color:#dfdfdf;
}.home:active {
	position:relative;
	top:1px;
}

.greet{
	font-size: 34px;
	font-weight: 700;
	color: rgb(124, 124, 163);
	padding: 12px;
}
</style>
</head>
<body>
<div id="menu">
	<% String sess = (String) session.getAttribute("uname");

	if(sess == null || sess == "") { 
		out.println("<a href='login.jsp' class='home'>Login</a><a href='register.jsp' class='home'>Register</a>"); 
	} else { 
		out.println("<span class='greet'>Hello "+ sess+ "</span><a href='login.jsp?logout=do' class='home'>Logout</a>"); 
	} %>
	<a href='profile.jsp' class='home'>Profile</a>
	<a href='viewcart.jsp' class='home'>View Cart</a>
	<a href='inventory.jsp' class='home'>Browse Products</a>
	<a href='main.jsp' class='home'>Home</a>
</div>

</body>
</html>