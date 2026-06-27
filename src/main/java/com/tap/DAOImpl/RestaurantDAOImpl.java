package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO{
    private static final String ADD_QUERY="INSERT INTO restaurant(name,cuisineType,deliveryTime,address,adminUserID,rating,isActive) VALUES(?,?,?,?,?,?,?)";
    private static final String UPDATE_QUERY="UPDATE restaurant SET name=?,cuisineType=?,deliveryTime=?,address=?,adminUserID=?,rating=?,isActive=? WHERE restaurantID=?";
    private static final String DELETE_QUERY="DELETE FROM restaurant WHERE restaurantID=?";
    private static final String GET_QUERY="SELECT * FROM restaurant where restaurantID=?";
    private static final String GET_ALL_QUERY="SELECT * FROM restaurant";
	@Override
	public void addRestaurant(Restaurant restaurant) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(ADD_QUERY);
			pstmt.setString(1, restaurant.getName());
			pstmt.setString(2, restaurant.getCuisineType());
			pstmt.setInt(3,restaurant.getDeliveryTime());
			pstmt.setString(4,restaurant.getAddress());
			pstmt.setInt(5,restaurant.getAdminUserID());
			pstmt.setDouble(6,restaurant.getRating());
			pstmt.setInt(7, restaurant.getIsActive());
			
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1, restaurant.getName());
			pstmt.setString(2, restaurant.getCuisineType());
			pstmt.setInt(3,restaurant.getDeliveryTime());
			pstmt.setString(4,restaurant.getAddress());
			pstmt.setInt(5,restaurant.getAdminUserID());
			pstmt.setDouble(6,restaurant.getRating());
			pstmt.setInt(7, restaurant.getIsActive());
			pstmt.setInt(8, restaurant.getRestaurantID());
			
			int res = pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteRestaurant(int id) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, id);
			
			int res = pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public Restaurant getRestaurant(int id) {
		Connection con = DBConnection.getConnection();
		Restaurant rest=null;
		try {
			PreparedStatement stmt = con.prepareStatement(GET_QUERY);
			stmt.setInt(1, id);
			ResultSet res = stmt.executeQuery();
			while(res.next()) {
				rest=getRestaurantFromResultSet(res);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rest;
	}

	@Override
	public List<Restaurant> getAll() {
		List<Restaurant> list = new ArrayList<Restaurant>();
		Connection con = DBConnection.getConnection();
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(GET_ALL_QUERY);
			Restaurant rest=null;
			while(res.next()) {
				rest=getRestaurantFromResultSet(res);
				list.add(rest);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
    
	public static Restaurant getRestaurantFromResultSet(ResultSet res) throws SQLException {
		Restaurant rest=null;
		
			int restaurantID = res.getInt("restaurantID");
			String name = res.getString("name");
			String cuisineType = res.getString("cuisineType");
			int deliveryTime = res.getInt("deliveryTime");
			String address = res.getString("address");
			String imageURL = res.getString("imageURL");
			int adminUserID = res.getInt("adminUserID");
			double rating = res.getDouble("rating");
			int isActive = res.getInt("isActive");
			rest=new Restaurant(restaurantID,name,cuisineType,deliveryTime,address,imageURL,adminUserID,rating,isActive);
		
		return rest;
	}

	public List<Restaurant> searchByCuisine(String cuisine) {
		List<Restaurant> searchResults = new ArrayList<>();
	    // The LIKE operator allows for partial matches
	    String query = "SELECT * FROM `restaurant` WHERE cuisineType LIKE ?";
	    
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(query)) {
	        
	        // Wrap the search term in '%' wildcards so "Ital" matches "Italian"
	        pstmt.setString(1, "%" + cuisine + "%");
	        
	        ResultSet rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            Restaurant r = getRestaurantFromResultSet(rs);
	            searchResults.add(r);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return searchResults;
	}

	
		
	}

