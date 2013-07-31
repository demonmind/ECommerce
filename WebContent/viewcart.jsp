<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="com.kd.ecommerce.*" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CART</title>
</head>
<body>
<style type='text/css'>

.empty{
font-size: 20px;
font-weight: 700;
color: rgb(255, 0, 0);
padding: 12px;
position: relative;
left: 200px;
top: 11px;
}

.price{
font-size: 20px;
font-weight: 700;
color: rgb(255, 0, 0);
padding: 12px;
position: relative;
top: 60px;
}

table{
background-color: #DEECF7;
width: 80%;
margin: 0 auto;
position: relative;
top: 64px;
box-shadow: 10px 10px 5px #888888;
padding: 10px;
}

.right{
float:right
}

.checkout {
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
}.checkout:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #6dc1f2), color-stop(1, #d1e1e6) );
	background:-moz-linear-gradient( center top, #6dc1f2 5%, #d1e1e6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6dc1f2', endColorstr='#d1e1e6');
	background-color:#6dc1f2;
}.checkout:active {
	position:relative;
	top:1px;
}

tr.border_bottom td {
	border-bottom: 2pt solid rgb(236, 106, 106);
	padding-bottom: 10px;
}
</style>
<jsp:include page="menu.jsp"></jsp:include>
<% 
	if(session.getAttribute("shop") != null){
		shoppingcart sh = (shoppingcart)session.getAttribute("shop");
		ArrayList<Products> pd = sh.getIt();
		float total = 0;
		out.println("<table>");
		out.println("<tr class='border_bottom'>");
		out.println("<td><span class='name'>Item Name</span></td>");
		out.println("<td><span class='image'>Image</span></td>");
		out.println("<td><span class='desc'>Description</span></td>");
		out.println("<td><span class='prc'>$ Price</span></td>");
		out.println("</tr>");
		for(int i = 0; i< pd.size(); i++){
			out.println("<tr>");
			out.println("<td><span class='name'>"+pd.get(i).getName()+"</span></td>");
			out.println("<td><span class='image'><img src='"+pd.get(i).getImage()+"' width='160px' height='160px'></span></td>");
			out.println("<td><span class='desc'>"+pd.get(i).getDesc()+"</span></td>");
			out.println("<td><span class='price'>$"+pd.get(i).getPrice()+"</span></td>");
			out.println("</tr>");
			total += pd.get(i).getPrice();
		}
		out.println("<tr class='border_bottom'>");
			out.println("<td>");out.println("</td>");
			out.println("<td>");out.println("</td>");
			out.println("<td>");out.println("<span class='price right'>Total</span>");out.println("</td>");
			out.println("<td>");out.println("<span class='price'>$"+total+"</span>");out.println("<span class='price'><a href='checkout.jsp' class='checkout'>Checkout</a></span>");out.println("</td>");
		out.println("<tr>");
		out.println("<tr>");
			out.println("<td>");out.println("</td>");
			out.println("<td>");out.println("</td>");
			out.println("<td>");out.println("</td>");
			out.println("<td>");out.println("<span class='price'></span>");out.println("</td>");
		out.println("<tr>");
		out.println("</table>");
	}else{
		out.println("<span class='empty'>Shopping cart empty</span>");
	}
%>
</body>
</html>


