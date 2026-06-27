package com.tap.model;

import java.sql.Date;

public class Menu {
   private int menuID;
   private int restaurantID;
   private String itemName;
   private String description;
   private String imageURL;
   private double price;
   private int isAvailable;
   private String category;
   private Date createdAt;
   private Date updatedAt;
   private Date deletedAt;
   public Menu(int menuID, int restaurantID, String itemName, String description,String imageUrl, double price, int isAvailable,
		String category, Date createdAt, Date updatedAt, Date deletedAt) {
	super();
	this.menuID = menuID;
	this.restaurantID = restaurantID;
	this.itemName = itemName;
	this.description = description;
	this.imageURL=imageUrl;
	this.price = price;
	this.isAvailable = isAvailable;
	this.category = category;
	this.createdAt = createdAt;
	this.updatedAt = updatedAt;
	this.deletedAt = deletedAt;
}
   public Menu() {
	super();
   }
   public Menu(String itemName, String description, double price, int isAvailable, String category) {
	super();
	this.itemName = itemName;
	this.description = description;
	this.price = price;
	this.isAvailable = isAvailable;
	this.category = category;
   }
   public int getMenuID() {
	return menuID;
   }
   public void setMenuID(int menuID) {
	this.menuID = menuID;
   }
   public int getRestaurantID() {
	return restaurantID;
   }
   public void setRestaurantID(int restaurantID) {
	this.restaurantID = restaurantID;
   }
   public String getItemName() {
	return itemName;
   }
   public void setItemName(String itemName) {
	this.itemName = itemName;
   }
   public String getDescription() {
	return description;
   }
   public void setDescription(String description) {
	this.description = description;
   }
   public double getPrice() {
	return price;
   }
   public void setPrice(double price) {
	this.price = price;
   }
   public int getIsAvailable() {
	return isAvailable;
   }
   public void setIsAvailable(int isAvailable) {
	this.isAvailable = isAvailable;
   }
   public String getCategory() {
	return category;
   }
   public void setCategory(String category) {
	this.category = category;
   }
   public Date getCreatedAt() {
	return createdAt;
   }
   public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
   }
   public Date getUpdatedAt() {
	return updatedAt;
   }
   public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
   }
   public Date getDeletedAt() {
	return deletedAt;
   }
   public void setDeletedAt(Date deletedAt) {
	this.deletedAt = deletedAt;
   }
   public String getImageURL() {
		return imageURL;
	}
	   public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	   }
	   @Override
	   public String toString() {
		return "Menu [menuID=" + menuID + ", restaurantID=" + restaurantID + ", itemName=" + itemName + ", description="
				+ description + ", imageURL=" + imageURL + ", price=" + price + ", isAvailable=" + isAvailable
				+ ", category=" + category + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", deletedAt="
				+ deletedAt + "]";
	   }
  
}
