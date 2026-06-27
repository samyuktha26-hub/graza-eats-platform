package com.tap.DAOImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO{
	
	private static final String INSERT_QUERY="INSERT INTO users(userName,email,password,address,role,lastLoginDate) VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_QUERY="UPDATE users SET userName=?,email=?,password=?,address=?,role=?,lastLoginDate=? WHERE userID=?";
	private static final String DELETE_QUERY="DELETE FROM users WHERE userID=?";
	private static final String SELECT_QUERY="SELECT* FROM  users where userID=?";
	private static final String SELECT_QUERY_1="SELECT * FROM  users where email=?";
	private static final String SELECT_ALL_QUERY="SELECT * FROM  users";
	
	@Override
	public int addUser(User user) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);
			
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			
			System.out.println("DAO: Attempting to insert user into database...");
			int rows = pstmt.executeUpdate();
			System.out.println("DAO: Rows affected = " + rows);
			return rows;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public void updateUser(User user) {
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt=con.prepareStatement(UPDATE_QUERY);
			
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(7, user.getUserID());
			
			int res = pstmt.executeUpdate();
			System.out.println(res);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteUser(int id) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, id);
			
			int res = pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

//	@Override
//	public User getUser(int id) {
//		Connection con = DBConnection.getConnection();
//		User u=null;
//		try {
//			PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);
//			pstmt.setInt(1, id);
//			
//			ResultSet res = pstmt.executeQuery();
//			
//			while(res.next()) {
//				u = getUserByResultSet(res);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return u;
//	}
	
	@Override
	public User getUser(String email) {
		Connection connection = DBConnection.getConnection();
		User user=null;
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY_1);
			pstmt.setString(1, email);
			
			
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {
				user=getUserByResultSet(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
	}


	@Override
	public List<User> getAll() {
		Connection con = DBConnection.getConnection();
		List<User> allUser=new ArrayList<User>();
		User u=null;
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);
			
			while(res.next()) {
				u=getUserByResultSet(res);
				allUser.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allUser;
	}
	
	private static User getUserByResultSet(ResultSet res) {
		User u=null;
		try {
			int userID=res.getInt("userID");
			String userName=res.getString("userName");
			String email=res.getString("email");
			String password=res.getString("password");
			String address=res.getString("address");
			String role=res.getString("role");
			Timestamp createdDate=res.getTimestamp("createdDate");
			Timestamp lastLoginDate=res.getTimestamp("lastLoginDate");
			u=new User(userID,userName,email,password,address,role,createdDate,lastLoginDate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	
}
