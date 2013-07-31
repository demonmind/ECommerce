package com.kd.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String query = "";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<h1>Unsupported get request</h1>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String uname = request.getParameter("username");
		String pwd = request.getParameter("password");
		if(uname != null && pwd != null && uname != "" && pwd != ""){
			if(logged(request.getParameter("username"), request.getParameter("password"))) {
				session.setAttribute("uname", uname);
				response.sendRedirect("main.jsp?login=true");
			}else{
				request.setAttribute("msg","Invalid Login");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}else {
        	request.setAttribute("msg","Invalid Login");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
	}
	
	public static String encrypt(String md5) {
	   try {
	        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
	        byte[] array = md.digest(md5.getBytes());
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < array.length; ++i) {
	          sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
	       }
	        return sb.toString();
	    } catch (java.security.NoSuchAlgorithmException e) {
	    }
	    return null;
	}
	
	public static boolean logged(String usr, String pass) {
        query = "select * from customers where username = '"+htmlFilter(usr)+"' and password = '"+encrypt(pass)+"'";
        Boolean found = false;
        try {
            Connection cn = DBConnect.getInstance();
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next()){
            	found = true;
            }
            return found;
        } catch (SQLException e) {
            e.printStackTrace();
            return found;
        }

    }
	
	private static String htmlFilter(String message){
		if(message == null) return null;
		int len = message.length();
		StringBuffer result = new StringBuffer(len + 20);
		char aChar;
		
		for(int i =0; i< len; i++){
			aChar = message.charAt(i);
			switch (aChar) {
            	case '<': result.append("&lt;"); break;
            	case '>': result.append("&gt;"); break;
            	case '&': result.append("&amp;"); break;
            	case '"': result.append("&quot;"); break;
            	case ';': result.append("&no;"); break;
            	case '-': result.append("&no;"); break;
            	default: result.append(aChar);
			}
		}
		return (result.toString());
	}


}
