<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kd.ecommerce.DBConnect" %> 
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<style>
table{
	background-color: #DEECF7;
	width: 100%;
	margin-top: 45px;
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
		out.println("<TD><a href='addtocart?product="+rs.getString(2)+"'>Add To Cart</a></TD>"); 
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