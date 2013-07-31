<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kd.ecommerce.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PROFILE</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<style type="text/css">
table{
	top: 63px;
	width: 30%;
	margin: 0 auto;
	position: relative;
}

#profileform{
background-color: #DEECF7;
width: 19%;
margin: 0 auto;
position: relative;
top: 110px;
box-shadow: 10px 10px 5px #888888;
padding: 10px;
color: rgb(21, 126, 185);
font-weight: 700;
}

#profileform input{
width: 250px;
height: 27px;
font-size: 16px;
font-weight: bold;
background-color: rgb(220, 249, 252);
margin: 10px;
border-radius: 6px;
}

#profileform div{
float: left;
position: relative;
left: -136px;
width: 0px;
height: 54px;
clear: both;
top: 19px;
font-weight: 700;
color: rgb(85, 141, 141);
}

#username{
background-color:rgb(238, 211, 211) !important;
}

#profiletable{
background-color: #DEECF7;
width: 37%;
margin: 0 auto;
position: relative;
top: 110px;
box-shadow: 10px 10px 5px #888888;
padding: 10px;
color: rgb(21, 126, 185);
font-weight: 700;
}

tr.border_top td {
	border-bottom: 2pt solid rgb(236, 106, 106);
	padding-bottom: 10px;
}

.edit{
position: relative;
top: 144px;
text-align: center;
}

.edit a{
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
}.edit a:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #6dc1f2), color-stop(1, #d1e1e6) );
	background:-moz-linear-gradient( center top, #6dc1f2 5%, #d1e1e6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6dc1f2', endColorstr='#d1e1e6');
	background-color:#6dc1f2;
}.edit a:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<% if(request.getParameter("submit") != null) {
	System.out.println("Executing");
	String uname = (String)session.getAttribute("uname");
	String em = (String)request.getParameter("email");
	String ad = (String)request.getParameter("address");
	String c = (String)request.getParameter("city");
	String s = (String)request.getParameter("state");
	String z = (String)request.getParameter("zip");

	User u = new User(uname, em, ad, c, s, z);
	u.updateUser();
}
%>
<%try { 
	String name = (String)session.getAttribute("uname"); 
	Connection cn = DBConnect.getInstance();
	String query = "select * from customers where username ='"+name+"'";
	Statement st = cn.createStatement();
	ResultSet rs = st.executeQuery(query);
%>
<TABLE cellpadding="15" border="0" id='profiletable'>
<%
while (rs.next()) {
	session.setAttribute("address", rs.getString(6));
%>
<TR class='border_top'>
<TD><div class='name'>Name:</div></TD>
<TD><div class='image'><%=rs.getString(2)%></div></TD>
</TR>
<TR class='border_top'>
<TD><div class='name'>Email:</div></TD>
<TD><div class='image'><%=rs.getString(4)%></div></TD>
</TR>
<TR class='border_top'>
<TD><div class='name'>Address:</div></TD>
<TD><div class='image'><%= rs.getString(6) == null ? "Not Set" : rs.getString(6) %></div></TD>
</TR>
<TR class='border_top'>
<TD><div class='name'>City:</div></TD>
<TD><div class='image'><%=rs.getString(7) == null ? "Not Set" : rs.getString(7)%></div></TD>
</TR>
<TR class='border_top'>
<TD><div class='name'>State:</div></TD>
<TD><div class='image'><%=rs.getString(8) == null ? "Not Set" : rs.getString(8)%></div></TD>
</TR>
<TR class='border_top'>
<TD><div class='name'>Zip:</div></TD>
<TD><div class='image'><%=rs.getString(9) == null ? "Not Set" : rs.getString(9)%></div></TD>
</TR>
</TABLE>
<script type="text/javascript">
function createedit(){
	var f = document.createElement("form");
	f.setAttribute('method',"post");
	f.setAttribute('action',"profile.jsp");
	f.setAttribute('id',"profileform");

	var name = document.createElement("div");
	name.innerHTML = 'Name: ';
	f.appendChild(name);
	
	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"text");
	i.setAttribute('name',"username");
	i.setAttribute('value','<%= rs.getString(2) == null ? "" : rs.getString(2) %>');
	i.setAttribute('disabled', true);
	i.setAttribute('id','username');
	
	var name = document.createElement("div");
	name.innerHTML = 'Email: ';
	f.appendChild(name);
	var j = document.createElement("input"); //input element, text
	j.setAttribute('type',"text");
	j.setAttribute('name',"email");
	j.setAttribute('value','<%= rs.getString(4) == null ? "" : rs.getString(4) %>');
	
	var name = document.createElement("div");
	name.innerHTML = 'Address: ';
	f.appendChild(name);
	var k = document.createElement("input"); //input element, text
	k.setAttribute('type',"text");
	k.setAttribute('name',"address");
	k.setAttribute('value','<%= rs.getString(6) == null ? "" : rs.getString(6) %>');
	
	var name = document.createElement("div");
	name.innerHTML = 'City: ';
	f.appendChild(name);
	var l = document.createElement("input"); //input element, text
	l.setAttribute('type',"text");
	l.setAttribute('name',"city");
	l.setAttribute('value','<%= rs.getString(7) == null ? "" : rs.getString(7) %>');
	
	var name = document.createElement("div");
	name.innerHTML = 'State: ';
	f.appendChild(name);
	var m = document.createElement("input"); //input element, text
	m.setAttribute('type',"text");
	m.setAttribute('name',"state");
	m.setAttribute('value','<%= rs.getString(8) == null ? "" : rs.getString(8) %>');
	
	var name = document.createElement("div");
	name.innerHTML = 'ZIP: ';
	f.appendChild(name);
	var n = document.createElement("input"); //input element, text
	n.setAttribute('type',"text");
	n.setAttribute('name',"zip");
	n.setAttribute('value','<%= rs.getString(9) == null ? "" : rs.getString(9) %>');

	var s = document.createElement("input"); //input element, Submit button
	s.setAttribute('type',"submit");
	s.setAttribute('value',"Submit");
	s.setAttribute('name', 'submit');

	f.appendChild(i);
	f.appendChild(j);
	f.appendChild(k);
	f.appendChild(l);
	f.appendChild(m);
	f.appendChild(n);
	f.appendChild(s);
	
	var elem = document.getElementById('profiletable');
	elem.parentNode.removeChild(elem);
	var edit = document.getElementById('editing');
	edit.parentNode.removeChild(edit);
	document.getElementsByTagName('body')[0].appendChild(f);
}
</script>
<% } %>
<%
// close all the connections.
} catch (Exception ex) {
%>

<%
out.println("<span style='position: relative;top: 200px;text-align:center;font-size: 22px;color: red;'>Unable to connect to database.<span>");
}
%>
<div class='edit'><a href='#' id='editing' onclick='createedit();'>Edit Profile</a></div>
<%
	if (request.getParameter("edit") != null){
%>
<script type="text/javascript">
$(document).ready(function(){
	$("#editing").click();
});
</script>
<%		
	}
%>
</body>
</html>