package com.kd.ecommerce;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class User {
	
	private String username = null;
	private String email = null;
	private String address = null;
	private String city = null;
	private String state = null;
	private String zip = null;
	
	public User( String un, String em, String ad, String c, String s, String z){
		username = un;
		email=em;
		address =ad;
		city =c;
		state = s;
		zip = z;
	}
	
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
	
	public void updateUser(){
		try { 
			String query = "UPDATE customers SET email='"+email+"', address='"+address+"', city='"+city+"', state='"+state+"', zip ='"+zip+"' WHERE username='"+username+"'";
			Connection cn = DBConnect.getInstance();
			Statement st = cn.createStatement();
			st.executeUpdate(query);
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
}
