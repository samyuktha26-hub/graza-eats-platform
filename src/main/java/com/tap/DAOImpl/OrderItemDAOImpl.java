package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{
    
	private static final String ADD_QUERY="INSERT INTO orderitem(orderID,menuID,quantity,itemTotal) VALUES(?,?,?,?)";
	private static final String UPDATE_QUERY="UPDATE orderitem SET orderID=?,menuID=?,quantity=?,itemTotal=? WHERE orderItemID=?";
	private static final String DELETE_QUERY="DELETE FROM orderitem WHERE orderItemID=?";
	private static final String GET_QUERY="SELECT * FROM orderitem where orderItemID=?";
	private static final String GET_ALL_QUERY="SELECT * FROM orderitem";
	@Override
	public void addOrderItem(OrderItem orderItem) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(ADD_QUERY);
			pstmt.setInt(1, orderItem.getOrderID());
			pstmt.setInt(2, orderItem.getMenuID());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4,orderItem.getItemTotal());
			
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, orderItem.getOrderID());
			pstmt.setInt(2, orderItem.getMenuID());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4,orderItem.getItemTotal());
			pstmt.setInt(5, orderItem.getOrderItemID());
			
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOrderItem(int id) {
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
    public OrderItem getOrderItem(int id) {
        Connection con = DBConnection.getConnection();
        OrderItem order = null;
        try {
            PreparedStatement stmt = con.prepareStatement(GET_QUERY);
            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();
            
            // Changed to 'if'
            if (res.next()) {
                order = getOrderItemFromResultSet(res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    

	@Override
	public List<OrderItem> getAll() {
		List<OrderItem> list = new ArrayList<OrderItem>();
		Connection con = DBConnection.getConnection();
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(GET_ALL_QUERY);
			OrderItem order=null;
			while(res.next()) {
				order=getOrderItemFromResultSet(res);
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	// Removed the while(res.next()) loop!
    private OrderItem getOrderItemFromResultSet(ResultSet res) throws SQLException {
        int orderItemID = res.getInt("orderItemID");
        int orderID = res.getInt("orderID");
        int menuID = res.getInt("menuID");
        int quantity = res.getInt("quantity");
        double itemTotal = res.getDouble("itemTotal");
        
        return new OrderItem(orderItemID, orderID, menuID, quantity, itemTotal);
    }
	
}
