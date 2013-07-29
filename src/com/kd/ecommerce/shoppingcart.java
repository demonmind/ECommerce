package com.kd.ecommerce;

import java.util.ArrayList;

public class shoppingcart {
	private static ArrayList<Products> items;

	public shoppingcart(){
		items = new ArrayList<Products>();
	}
	
	public void ins(Products p){
		items.add(p);
	}
	
	public void remove(Products p){
		items.remove(p);
	}
	
	public int getSize(){
		return items.size();
	}
	
	public ArrayList<Products> getIt(){
		return items;
	}
}
