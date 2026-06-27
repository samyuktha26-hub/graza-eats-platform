package com.tap.DAO;

import java.util.List;

import com.tap.model.Order;

public interface OrderDAO {
	  
	   int addOrder(Order order);
	   void updateOrder(Order order);
	   void deleteOrder(int id);
	   Order getOrder(int id);
	   List<Order> getAll();
	   List<Order> getAllByUserId(int userId);
}
