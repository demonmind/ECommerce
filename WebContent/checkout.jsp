<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kd.ecommerce.*" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CheckOut</title>
<style type="text/css">

table{
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

.error{
	position: relative;
	color: red;
	font-size: 15px;
}

.form-row label{
margin-left: 15px;
}

tr.border_top td {
	border-top: 2pt solid rgb(236, 106, 106);
	padding-top: 10px;
	border-bottom: 2pt solid rgb(236, 106, 106);
	padding-bottom: 10px;
}

tr.payment{
text-align: center;
font-size: 20px;
font-weight: 700;
color: rgb(21, 126, 185);
}

.btn{
float: right;
width: 135px;
height: 33px;
font-size: 13px;
background-color: rgb(109, 236, 145);
border: 0;
border-radius: 7px;
color: rgb(231, 10, 10);
font-weight: 700;
}

.price a{
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
}.price a:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #6dc1f2), color-stop(1, #d1e1e6) );
	background:-moz-linear-gradient( center top, #6dc1f2 5%, #d1e1e6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6dc1f2', endColorstr='#d1e1e6');
	background-color:#6dc1f2;
}.price a:active {
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
	String query = "select * from customers where username='"+session.getAttribute("uname")+"'";
	Statement st = cn.createStatement();
	ResultSet rs = st.executeQuery(query);
	while(rs.next()){
		session.setAttribute("address", rs.getString(6));
	}
	}catch(SQLException e){
	
}
	if(session.getAttribute("shop") != null){
		shoppingcart sh = (shoppingcart)session.getAttribute("shop");
		ArrayList<Products> pd = sh.getIt();
		float total = 0;
		out.println("<table class='checkout'>");
		for(int i = 0; i< pd.size(); i++){
			out.println("<tr>");
			out.println("<td><span class='name'>"+pd.get(i).getName()+"</span></td>");
			out.println("<td>");out.println("</td>");
			out.println("<td><span class='price'>$"+pd.get(i).getPrice()+"</span></td>");
			out.println("</tr>");
			total += pd.get(i).getPrice();
		}
		out.println("<tr  class='border_top'>");
			out.println("<td>");out.println("</td>");
			out.println("<td>");out.println("<span class='price right'>Total</span>");out.println("</td>");
			out.println("<td>");out.println("<span class='price'>$"+total+"</span>");out.println("</td>");
		out.println("</tr>");
		out.println("<tr  class='payment'>");
		out.println("<td colspan='4'>");out.println("<span>Payment</span>");out.println("</td>");
		out.println("</tr>");
		out.println("<tr style='text-align: center;'>");
			out.println("<td colspan='3'>");
			String se = (String)session.getAttribute("address");
			if(se != null && se.length() != 0){
				%>
				<form action="checkout.do" method="POST" id="payment-form">
  				<span class="payment-errors"></span>
<span class="error">${msg}</span>
  <div class="form-row" style="margin: 10px;">
    <label>
      <span>Card Number</span>
      <input type="text" size="20" name="cnumber" style="height: 23px;width: 230px;"/>
      <input type="hidden" name="total" value="<%= total %>"/>
      <input type="hidden" name="items" value="<%= pd.size() %>"/>
    </label>
    <label>
      <span>CVC</span>
      <input type="text" size="4" name="cvc" style="height: 23px;width: 50px;"/>
    </label>
  </div>

  <div class="form-row" style="margin: 10px;">
    <label>
      <span>Expiration (MM/YYYY)</span>
      <input type="text" size="2" name="exp-month" style="height: 23px;width: 50px;"/>
    </label>
    <span> / </span>
    <input type="text" size="4" name="exp-year" style="height: 23px;width: 50px;"/>
  </div>

  <button type="submit" style="float: right;" class='btn'>Submit Payment</button>
</form>
				<%
			}else{
				out.println("<span class='price right'>Address Missing for Shipping. Please <a href='profile.jsp?edit=do'>Edit</a> Your Profile</span>");
			}
			out.println("</td>");
		out.println("<tr>");
		out.println("</table>");
	}else{
		out.println("<span class='empty'>Shopping cart empty</span>");
	}
%>
</body>
</html>