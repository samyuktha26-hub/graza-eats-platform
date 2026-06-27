package com.tap.model;

public class Favorite {
	private int favoriteID;
	private int userID;
	private int restaurantID;
	
	public Favorite(int favoriteID, int userID, int restaurantID) {
		super();
		this.favoriteID = favoriteID;
		this.userID = userID;
		this.restaurantID = restaurantID;
	}

	public int getFavoriteID() {
		return favoriteID;
	}

	public void setFavoriteID(int favoriteID) {
		this.favoriteID = favoriteID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getRestaurantID() {
		return restaurantID;
	}

	public void setRestaurantID(int restaurantID) {
		this.restaurantID = restaurantID;
	}
	
	

}
