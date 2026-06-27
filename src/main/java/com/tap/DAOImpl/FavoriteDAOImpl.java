package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.FavoriteDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class FavoriteDAOImpl implements FavoriteDAO{
	private static final String INSERT_QUERY="INSERT INTO `user_favorites`( userID, restaurantID) VALUES (?,?) ";
	private static final String DELETE_QUERY="DELETE FROM `user_favorites`WHERE userID=? AND restaurantID=? ";
	private static final String IS_FAVORITE_QUERY="SELECT COUNT(*) FROM `user_favorites` WHERE userID=? AND restaurantID=?";
	private static final String JOIN_QUERY="SELECT r.* FROM restaurant r " +
            "INNER JOIN user_favorites uf ON r.restaurantID = uf.restaurantID " +
            "WHERE uf.userID = ?";;

	@Override
	public void addFavorite(int userID, int restaurantID) {
		
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, restaurantID);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void removeFavorite(int userID, int restaurantID) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, restaurantID);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean isFavorite(int userID, int restaurantID) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(IS_FAVORITE_QUERY);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, restaurantID);
			
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				int count=res.getInt(1);
				return count>0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Restaurant> getFavoritesByUserId(int userId){
		List<Restaurant> list = new ArrayList<Restaurant>();
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(JOIN_QUERY);
			pstmt.setInt(1, userId);
			
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				Restaurant r;
				
			    r = RestaurantDAOImpl.getRestaurantFromResultSet(res);
				
	            list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}

}
