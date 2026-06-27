package com.tap.controller;

import java.io.IOException;
import java.sql.Date;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("User");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		Cart cart = (Cart)session.getAttribute("cart");
		Double itemTotal = (Double)session.getAttribute("itemTotal");
		
		
		if (user == null || cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("login.jsp");
            return;
        }
		Order order = new Order();
		
		order.setUserID(user.getUserID());
		order.setRestaurantID(restaurantId);
		order.setOrderDate(new Date(System.currentTimeMillis()));
		order.setTotalAmount(itemTotal);
		order.setStatus("Pending");
		order.setPaymentMethod(req.getParameter("paymentMode"));
		
		OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
		int newOrderId=orderDAOImpl.addOrder(order);
         if (newOrderId > 0) {
            
            OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
            
            for (CartItem item : cart.getItems().values()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderID(newOrderId); 
                orderItem.setMenuID(item.getMenuId());
                orderItem.setQuantity(item.getQuantity());
                orderItem.setItemTotal(item.getPrice() * item.getQuantity()); 
                
                orderItemDAOImpl.addOrderItem(orderItem);
            }
        // 5. Clear the cart so they can't accidentally order twice
        session.removeAttribute("cart");
        session.removeAttribute("restaurantId");
        
        // 6. Send to the success page
        resp.sendRedirect("OrderSuccess.jsp");
         }else {
             // If newOrderId is 0, the DB insert failed!
             // Redirect them back to checkout with an error, or to a failure page
             resp.sendRedirect("checkout.jsp?error=true");
         }
    
	}

}
