package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO{
	private static final String ADD_QUERY="INSERT INTO menu(restaurantID,itemName,description,price,isAvailable,category,createdAt,updatedAt,deletedAt) VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_QUERY="UPDATE menu SET restaurantID=?,itemName=?,description=?,price=?,isAvailable=?,category=?,createdAt=?,updatedAt=?,deletedAt=? WHERE menuID=?";
    private static final String DELETE_QUERY="DELETE FROM menu WHERE menuID=?";
    private static final String GET_QUERY="SELECT * FROM menu where menuID=?";
    private static final String GET_NAME_QUERY="SELECT itemName FROM menu where menuID=?";
    private static final String GET_PRICE_QUERY="SELECT price FROM menu where menuID=?";
    private static final String GET_ALL_QUERY="SELECT * FROM menu where restaurantID=?";
	@Override
	public void addMenu(Menu menu) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(ADD_QUERY);
			pstmt.setInt(1, menu.getRestaurantID());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3,menu.getDescription());
			pstmt.setDouble(4,menu.getPrice());
			pstmt.setInt(5,menu.getIsAvailable());
			pstmt.setString(6,menu.getCategory());
			pstmt.setDate(7, menu.getCreatedAt());
			pstmt.setDate(8, menu.getUpdatedAt());
			pstmt.setDate(9, menu.getDeletedAt());
			
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void updateMenu(Menu menu) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, menu.getRestaurantID());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3,menu.getDescription());
			pstmt.setDouble(4,menu.getPrice());
			pstmt.setInt(5,menu.getIsAvailable());
			pstmt.setString(6,menu.getCategory());
			pstmt.setDate(7, menu.getCreatedAt());
			pstmt.setDate(8, menu.getUpdatedAt());
			pstmt.setDate(9, menu.getDeletedAt());
			pstmt.setInt(10, menu.getMenuID());
			
			int res = pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteMenu(int id) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, id);
			int res = pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Menu getMenu(int id) {
		Connection con = DBConnection.getConnection();
		Menu menu=null;
		try {
			PreparedStatement stmt = con.prepareStatement(GET_QUERY);
			stmt.setInt(1, id);
			ResultSet res = stmt.executeQuery();
			while(res.next()) {
				menu=getMenuFromResultSet(res);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return menu;
	}
	@Override
	public List<Menu> getAllByRestaurantId(int restaurantId) {
		List<Menu> list = new ArrayList<Menu>();
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_ALL_QUERY);
			pstmt.setInt(1, restaurantId);
			ResultSet res = pstmt.executeQuery();
			Menu menu=null;
			while(res.next()) {
				menu=getMenuFromResultSet(res);
				list.add(menu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

//	@Override
//	public List<Menu> getAll() {
//		List<Menu> list = new ArrayList<Menu>();
//		Connection con = DBConnection.getConnection();
//		try {
//			Statement stmt = con.createStatement();
//			ResultSet res = stmt.executeQuery(GET_ALL_QUERY);
//			Menu menu=null;
//			while(res.next()) {
//				menu=getMenuFromResultSet(res);
//				list.add(menu);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return list;
//	}
	private Menu getMenuFromResultSet(ResultSet res) throws SQLException {
		Menu menu=null;
		
			int menuID = res.getInt("menuID");
			int restaurantID = res.getInt("restaurantID");
			String itemName = res.getString("itemName");
			String description = res.getString("description");
			String imageURL = res.getString("imageURL");
			double price = res.getDouble("price");
			int isAvailable = res.getInt("isAvailable");
			String category = res.getString("category");
			Date createdAt = res.getDate("createdAt");
			Date updatedAt = res.getDate("updatedAt");
			Date deletedAt = res.getDate("deletedAt");
			menu=new Menu(menuID,restaurantID,itemName,description,imageURL,price,isAvailable,category,createdAt,updatedAt,deletedAt);
		
		return menu;
	}

	@Override
	public String getMenuName(int id) {
		Connection con = DBConnection.getConnection();
		String name=null;
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_NAME_QUERY);
			pstmt.setInt(1, id);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				name = res.getString("itemName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public int getMenuPrice(int id) {
		Connection  con = DBConnection.getConnection();
		int price=0;
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_PRICE_QUERY);
			pstmt.setInt(1, id);
			
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				price = res.getInt("price");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}

	

}
