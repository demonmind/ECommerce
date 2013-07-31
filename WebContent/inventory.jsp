<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kd.ecommerce.DBConnect" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<style>
table{
background-color: #DEECF7;
width: 80%;
margin: 0 auto;
position: relative;
top: 64px;
box-shadow: 10px 10px 5px #888888;
padding-bottom: 10px;
}
.name{
float: left;
margin-left: 40px;
}

.image{
float: left;
margin-left: 40px;
}

.desc{
float: left;
margin-left: 40px;
}

.price{
float: left;
margin-left: 40px;
}

.addtocart {
	-moz-box-shadow:inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 0px 0px 0px #ffffff;
	box-shadow:inset 0px 0px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d1e1e6), color-stop(1, #6dc1f2) );
	background:-moz-linear-gradient( center top, #d1e1e6 5%, #6dc1f2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d1e1e6', endColorstr='#6dc1f2');
	background-color:#d1e1e6;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:1px 1px 0px #ffffff;
}.addtocart:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #6dc1f2), color-stop(1, #d1e1e6) );
	background:-moz-linear-gradient( center top, #6dc1f2 5%, #d1e1e6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6dc1f2', endColorstr='#d1e1e6');
	background-color:#6dc1f2;
}.addtocart:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<%
try {
Connection cn = DBConnect.getInstance();
String query = "select * from inventory";
Statement st = cn.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<TABLE cellpadding="15" border="0">
<%
while (rs.next()) {
%>
<TR>
<TD><div class='name'><%=rs.getString(2)%></div></TD>
<TD><div class='image'><img src='<%=rs.getString(3)%>' width='160px' height='160px'/></div></TD>
<TD><div class='desc'><%=rs.getString(4)%></div></TD>
<TD><div class='price'>$<%=rs.getString(5)%></div></TD>
<% String sess = (String) session.getAttribute("uname");
	if(sess == null || sess == "") { 
		
	} else { 
		out.println("<TD style='width: 150px;'><a href='addtocart?product="+rs.getString(1)+"' class='addtocart'>Add To Cart</a></TD>"); 
	} 
%>
</TR>
<% } %>
<%
// close all the connections.
} catch (Exception ex) {
%>
<%
out.println("<span style='position: relative;top: 200px;text-align:center;font-size: 22px;color: red;'>Unable to connect to database.<span>");
}
%>
</TABLE>
</body>
</html>