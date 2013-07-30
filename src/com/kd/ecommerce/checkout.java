package com.kd.ecommerce;

import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class checkout
 */
@WebServlet("/checkout.do")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("Unsupported Get Request");
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String cc = (String)request.getParameter("cnumber");
		if(!cc.equals("4111111111111111")){
			request.setAttribute("msg","Wrong Credit Card Number");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
		}else{
			String name = (String)session.getAttribute("uname");
			int items = Integer.parseInt(request.getParameter("items"));
			float total = Float.parseFloat(request.getParameter("total"));
			try{
				Connection c = DBConnect.getInstance();
				Statement s = c.createStatement();
				ResultSet rs = s.executeQuery("select * from customers where username='"+name+"'");
				while(rs.next()){
					saveOrder(rs.getInt(1), items, total);
					session.setAttribute("shop", null);
					request.setAttribute("msg","Purchase Successfully Completed");
		            request.getRequestDispatcher("main.jsp").forward(request, response);
				}
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}
	}
	
	private void saveOrder(int user_id, int items,float total){
		String query = "INSERT INTO orders VALUES("+user_id+", DEFAULT,"+items+", CURRENT_TIMESTAMP,"+total+")";
		try{
			Connection con = DBConnect.getInstance();
			Statement st = con.createStatement();
			st.execute(query);
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}

}
