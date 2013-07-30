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
<style>
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
</style>
<jsp:include page="menu.jsp"></jsp:include>
<% 
	if(session.getAttribute("shop") != null){
		shoppingcart sh = (shoppingcart)session.getAttribute("shop");
		ArrayList<Products> pd = sh.getIt();
		for(int i = 0; i< pd.size(); i++){
			out.println("<span class='price'>"+pd.get(i).getPrice()+"</span>");
		}
	}else{
		out.println("<span class='empty'>Shopping cart empty</span>");
	}
%>
</body>
</html>


