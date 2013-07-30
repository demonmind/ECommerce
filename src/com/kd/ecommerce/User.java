package com.kd.ecommerce;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class User {
	
	private String username = null;
	private String email = null;
	private String address = null;
	private String city = null;
	private String state = null;
	private String zip = null;
	
	public String getUsername(){
		return username;
	}
	
	public String getEmail(){
		return email;
	}
	
	public String getAddress(){
		return address;
	}
	
	public String getCity(){
		return city;
	}
	
	public String getState(){
		return state;
	}
	
	public String getZip(){
		return zip;
	}
	
	public void setUsername(String uname){
		username = uname;
	}
	
	public void setEmail(String em){
		email = em;
	}
	
	public void setAddress(String addr){
		address = addr;
	}
	
	public void setCity(String c){
		city = c;
	}
	
	public void setState(String s){
		state = s;
	}
	
	public void setZip(String z){
		zip = z;
	}
	
	public void updateUser(HttpServletRequest request){
		try { 
			HttpSession ses = request.getSession();
			String query = "UPDATE users SET name='"+username+"' email='"+email+"' address='"+address+"' city='"+city+"' state='"+state+"' zip ='"+zip+"' WHERE username='"+ses.getAttribute("uname")+"'";
			Connection cn = DBConnect.getInstance();
			Statement st = cn.createStatement();
			st.execute(query);
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
}
