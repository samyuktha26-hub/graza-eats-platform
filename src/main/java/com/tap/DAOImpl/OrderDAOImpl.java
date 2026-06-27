package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.model.Order;
import com.tap.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO{
    
	private static final String ADD_QUERY="INSERT INTO `order`(userID,restaurantID,orderDate,totalAmount,status,paymentMethod) VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_QUERY="UPDATE order SET userID=?,restaurantID=?,orderDate=?,totalAmount=?,status=?,paymentMethod=? WHERE orderID=?";
	private static final String DELETE_QUERY="DELETE FROM order WHERE orderID=?";
	private static final String GET_QUERY="SELECT * FROM order where orderID=?";
	private static final String GET_ORDER_QUERY="SELECT * FROM `order` where userID=?";
	private static final String GET_ALL_QUERY="SELECT * FROM order";
	@Override
	public int addOrder(Order order) {
		Connection con = DBConnection.getConnection();
		int orderId=0;
		try {
			PreparedStatement pstmt = con.prepareStatement(ADD_QUERY,Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, order.getUserID());
			pstmt.setInt(2, order.getRestaurantID());
			pstmt.setDate(3, order.getOrderDate());
			pstmt.setDouble(4,order.getTotalAmount());
			pstmt.setString(5,order.getStatus());
			pstmt.setString(6,order.getPaymentMethod());
			
			int res=pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				orderId=rs.getInt(1);
			}
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return orderId;
	}

	@Override
	public void updateOrder(Order order) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, order.getUserID());
			pstmt.setInt(2, order.getRestaurantID());
			pstmt.setDate(3, order.getOrderDate());
			pstmt.setDouble(4,order.getTotalAmount());
			pstmt.setString(5,order.getStatus());
			pstmt.setString(6,order.getStatus());
			pstmt.setInt(7, order.getOrderID());
			
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOrder(int id) {
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
    public Order getOrder(int id) {
        Connection con = DBConnection.getConnection();
        Order order = null;
        try {
            PreparedStatement stmt = con.prepareStatement(GET_QUERY);
            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();
            
            // Changed to 'if' because we only expect one order
            if (res.next()) { 
                order = getOrderFromResultSet(res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

   
	@Override
	public List<Order> getAll() {
		List<Order> list = new ArrayList<Order>();
		Connection con = DBConnection.getConnection();
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(GET_ALL_QUERY);
			Order order=null;
			while(res.next()) {
				order=getOrderFromResultSet(res);
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Order> getAllByUserId(int userId) {
		List<Order> orders = new ArrayList<Order>();
		Order order=null;
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_ORDER_QUERY);
			pstmt.setInt(1, userId);
			
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				order=getOrderFromResultSet(res);
				orders.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	 // Removed the while(res.next()) loop!
    private Order getOrderFromResultSet(ResultSet res) throws SQLException {
        int orderID = res.getInt("orderID");
        int userID = res.getInt("userID");
        int restaurantID = res.getInt("restaurantID");
        Date orderDate = res.getDate("orderDate");
        double totalAmount = res.getDouble("totalAmount");
        String status = res.getString("status");
        String paymentMethod = res.getString("paymentMethod");
        
        return new Order(orderID, userID, restaurantID, orderDate, totalAmount, status, paymentMethod);
    }

	

	

}


