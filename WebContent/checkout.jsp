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
	position: relative;
	margin: 0 auto;
	top: 200px;
	box-shadow: 10px 10px 5px #888888;
	border-left: 1px solid gray;
	border-top: 1px solid gray;
	width: 400px;
	background-color: rgb(223, 223, 223);
}

.error{
	position: relative;
	color: red;
	font-size: 15px;
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
		out.println("<tr>");
			out.println("<td>");out.println("</td>");
			out.println("<td>");out.println("<span class='price right'>Total</span>");out.println("</td>");
			out.println("<td>");out.println("<span class='price'>$"+total+"</span>");out.println("</td>");
		out.println("<tr>");
		out.println("<tr>");
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
  </div>

  <div class="form-row" style="margin: 10px;">
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

  <button type="submit" style="float: right;">Submit Payment</button>
</form>
				<%
			}else{
				out.println("<span class='price right'>Address Missing for Shipping. Please <a href='profile.jsp?edit=do'>Edit</a> Profile</span>");
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