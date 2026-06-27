package com.tap.model;

public class CartItem {
  private int menuId;
  private String name;
  private int quantity;
  private double price;
  private int restaurantId;
  
  
  public CartItem(int menuId, String name, int quantity, double price, int restaurantId) {
	super();
	this.menuId = menuId;
	this.name = name;
	this.quantity = quantity;
	this.price = price;
	this.restaurantId = restaurantId;
}
  public int getMenuId() {
	return menuId;
  }
  public void setMenuId(int menuId) {
	this.menuId = menuId;
  }
  public String getName() {
	return name;
  }
  public void setName(String name) {
	this.name = name;
  }
  public int getQuantity() {
	return quantity;
  }
  public void setQuantity(int quantity) {
	this.quantity = quantity;
  }
  public double getPrice() {
	return price;
  }
  public void setPrice(double price) {
	this.price = price;
  }
  public int getRestaurantId() {
	return restaurantId;
  }
  public void setRestaurantId(int restaurantId) {
	this.restaurantId = restaurantId;
  }
  public double getItemTotal() {
	return price*quantity;

}
  
}
