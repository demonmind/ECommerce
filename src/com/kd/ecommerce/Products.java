package com.kd.ecommerce;

public class Products {
	private String name;
	private Float price;
	private String desc;
	private String img;
	
	public Products(String n, String i, String d,Float p){
		name = n;
		desc = d;
		img = i;
		price = p;
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
