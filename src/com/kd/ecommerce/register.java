package com.kd.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String query ="";
	
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		PrintWriter out = response.getWriter();
		out.print("<h1>Unsupported get request</h1>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String uname = request.getParameter("username").replaceAll("\\s","");
		String pwd = request.getParameter("password").replaceAll("\\s","");
		String email = request.getParameter("email").replaceAll("\\s","");
		if(uname != null && pwd != null && pwd != null && htmlFilter(uname.trim()).length() != 0 && htmlFilter(pwd.trim()).length() != 0 &&  htmlFilter(email.trim()).length() != 0){
			if(registerUser(uname,pwd,email)){
				session.setAttribute("uname", uname);
				request.setAttribute("msg","Successfully Logged In");
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}else{
				request.setAttribute("msg","Username Taken or Other Error Verified");
	            request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("msg","Please fill in all the fields");
            request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}
	
	public static boolean registerUser(String usr, String pass, String email) {
        query = "insert into customers values( DEFAULT,'"+htmlFilter(usr)+"','"+encrypt(htmlFilter(pass))+"','"+htmlFilter(email)+"', 0)";
        try {
            Connection cn = DBConnect.getInstance();
            Statement st = cn.createStatement();
            st.execute(query);
            return true;
        } catch(SQLException e) {
        	return false;
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
            	default: result.append(aChar);
			}
		}
		return (result.toString());
	}

}
