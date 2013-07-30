<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME</title>
<style type="text/css">
#image{
	text-align: center;
}

#image img{
	position: relative;
	top: 100px;
}

#welcometext{
	margin: 0 auto;
 	color: rgb(0, 173, 255);
	font-size: 30px;
	text-align: center;
	top: 117px;
	position: relative;
	font-weight: 700;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<div id="main-container">
	<div id="image">
		<img src="http://www.biobus.gsu.edu/biobushome_files/gsulogo.gif" />
	</div>
	<div id="welcometext">
		Welcome to the GSU STORE<br /><span>${msg}</span>
		<% if (request.getParameter("login") != null) {  
			if(request.getParameter("login").equals("true")){
				out.println("<span class='greet'>Successfully Logged In</span>");  
			}
		} %>
	</div>
</div>
</body>
</html>