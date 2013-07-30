<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kd.ecommerce.DBConnect" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PROFILE</title>
<style type="text/css">
table{
	top: 63px;
	width: 30%;
	margin: 0 auto;
	position: relative;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<%try { 
	String name = (String)session.getAttribute("uname"); 
	Connection cn = DBConnect.getInstance();
	String query = "select * from customers where username ='"+name+"'";
	Statement st = cn.createStatement();
	ResultSet rs = st.executeQuery(query);
%>
<TABLE cellpadding="15" border="0">
<%
while (rs.next()) {
%>
<TR>
<TD><div class='name'>Name:</div></TD>
<TD><div class='image'><%=rs.getString(2)%></div></TD>
</TR>
<TR>
<TD><div class='name'>Email:</div></TD>
<TD><div class='image'><%=rs.getString(4)%></div></TD>
</TR>
<TR>
<TD><div class='name'>Address:</div></TD>
<TD><div class='image'><%= rs.getString(6) == null ? "Not Set" : rs.getString(6) %></div></TD>
</TR>
<TR>
<TD><div class='name'>City:</div></TD>
<TD><div class='image'><%=rs.getString(7) == null ? "Not Set" : rs.getString(7)%></div></TD>
</TR>
<TR>
<TD><div class='name'>State:</div></TD>
<TD><div class='image'><%=rs.getString(8) == null ? "Not Set" : rs.getString(8)%></div></TD>
</TR>
<TR>
<TD><div class='name'>Zip:</div></TD>
<TD><div class='image'><%=rs.getString(9) == null ? "Not Set" : rs.getString(9)%></div></TD>
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
<div class='edit'><a href='#' id='edit'>Edit Profile</a></div>
<script type="text/javascript">
	var f = document.createElement("form");
	f.setAttribute('method',"post");
	f.setAttribute('action',"profile.jsp");

	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"text");
	i.setAttribute('name',"username");
	
	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"text");
	i.setAttribute('name',"username");
	
	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"text");
	i.setAttribute('name',"username");
	
	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"text");
	i.setAttribute('name',"username");
	
	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"text");
	i.setAttribute('name',"username");
	
	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"text");
	i.setAttribute('name',"username");

	var s = document.createElement("input"); //input element, Submit button
	s.setAttribute('type',"submit");
	s.setAttribute('value',"Submit");

	f.appendChild(i);
	f.appendChild(s);

//and some more input elements here
//and dont forget to add a submit button

document.getElementsByTagName('body')[0].appendChild(f);
</script>
</body>
</html>