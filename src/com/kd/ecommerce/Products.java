package com.kd.ecommerce;

public class Products {
	private static String name;
	private static Float price;
	private static String desc;
	private static String img;
	
	public Products(String n, String d, String i,Float p){
		name = n;
		price = p;
		desc = d;
		img = i;
	}
	
	public String getName(){
		return name;
	}
	
	public Float getPrice(){
		return price;
	}
	
	public String getImage(){
		return img;
	}
	
	public String getDesc(){
		return desc;
	}
}
