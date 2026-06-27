package com.tap.model;

import java.util.HashMap;

public class Cart {
   HashMap<Integer, CartItem> items;

   public Cart() {
	   items=new HashMap<Integer, CartItem>();
   }

   public HashMap<Integer, CartItem> getItems() {
	return items;
   }

   public void addItem(int menuId, CartItem cartItem) {
	if(items.containsKey(menuId)) {
		CartItem existingCartItem = items.get(menuId);
		existingCartItem.setQuantity(existingCartItem.getQuantity()+1);
	}
	else {
		items.put(menuId, cartItem);
	}
	
   }

   public void update(int menuId, int quantity) {
	if(quantity<=0) {
		items.remove(menuId);
	}else if(items.containsKey(menuId)) {
		CartItem cartItem = items.get(menuId);
		cartItem.setQuantity(quantity);
	}
	
   }

   public void deleteItem(int menuId) {
	items.remove(menuId);
	
   }
   
}
