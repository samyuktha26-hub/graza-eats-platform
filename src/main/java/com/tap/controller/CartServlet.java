package com.tap.controller;



import java.io.IOException;
import java.util.HashMap;

import com.mysql.cj.Session;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet{
     @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String action = req.getParameter("action");
    	HttpSession session = req.getSession();
    	Cart cart=(Cart)session.getAttribute("cart");
    	
    	Integer restaurantId = (Integer)session.getAttribute("restaurantId");
    	restaurantId = (restaurantId != null) ? restaurantId : 0;
    	
    	Integer newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));
    	
    	if(cart==null||restaurantId!=newRestaurantId) {
    		cart=new Cart();
    		session.setAttribute("cart", cart);
    		session.setAttribute("restaurantId", newRestaurantId);
    	}
    	if("add".equals(action)) {
    		addCartItem(req,cart);
    	}
    	else if("update".equals(action)) {
    		updateCart(req,cart);
    	}
    	else if("delete".equals(action)) {
    	    removeCartItem(req,cart);
    	}
    	
    	resp.sendRedirect("cart.jsp");
    }

	 private void removeCartItem(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		
		cart.deleteItem(menuId);
		
	}

	 private void updateCart(HttpServletRequest req, Cart cart) {
		int menuId=Integer.parseInt(req.getParameter("menuId"));
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		
		cart.update(menuId,quantity);
		//decide based on how cart.jsp sends input
//		cartItem.setQuantity(quantity);
		
	}

	 private void addCartItem(HttpServletRequest req, Cart cart) {
		 
		Integer menuId = Integer.parseInt(req.getParameter("menuId"));
		Integer quantity = Integer.parseInt(req.getParameter("quantity"));
		Integer restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		MenuDAOImpl mdao=new MenuDAOImpl();
		
		Menu menu = mdao.getMenu(menuId);
		CartItem cartItem = new CartItem(menuId, menu.getItemName(), quantity, menu.getPrice(), menu.getRestaurantID());
		
		cart.addItem(menuId,cartItem);
	 }
}
