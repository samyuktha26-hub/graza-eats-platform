package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;

public interface FavoriteDAO {
    void addFavorite(int userID, int restaurantID);
    void removeFavorite(int userID, int restaurantID);
    boolean isFavorite(int userID, int restaurantID);
    List<Restaurant> getFavoritesByUserId(int userId);
}
