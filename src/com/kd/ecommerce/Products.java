package com.kd.ecommerce;

public class Products {
	private String name;
	private Float price;
	private String desc;
	private String img;
	
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
