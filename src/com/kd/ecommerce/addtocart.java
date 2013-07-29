package com.kd.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addtocart
 */
@WebServlet("/addtocart")
public class addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Products> s = new ArrayList<Products>();
	private shoppingcart shop = new shoppingcart(s);
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext thisContext = getServletContext(); 
		String name = request.getParameter("product");
		Connection cn = DBConnect.getInstance();
		try {
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from inventory where productID ="+name+"");
			while(rs.next()){
				Products p = new Products(rs.getString(2),rs.getString(3),rs.getString(4),rs.getFloat(5));
				System.out.println(p.getName()+":"+ p.getPrice());
				shop.ins(p);
				thisContext.setAttribute("shop", shop.getIt());
				for(int i = 0; i< shop.getIt().size(); i++){
					System.out.println(shop.getIt().get(i)+":"+ shop.getIt().get(i).getPrice());
				}
				response.sendRedirect("inventory.jsp?addedto=success");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
