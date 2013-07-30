package com.kd.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/addtocart")
public class addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		shoppingcart shop = (shoppingcart)session.getAttribute("shop");
		if(shop == null) {
		    shop = new shoppingcart();
		    session.setAttribute("shop", shop);
		}
		String name = request.getParameter("product");
		Connection cn = DBConnect.getInstance();
		try {
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from inventory where productID ="+name+"");
			while(rs.next()){
				Products p = new Products(rs.getString(2),rs.getString(3),rs.getString(4),rs.getFloat(5));
				System.out.println(p.getName()+":"+ p.getPrice());
				shop.ins(p);	
				response.sendRedirect("inventory.jsp?addedto=success");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
