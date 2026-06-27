package com.tap.controller;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurant")
public class RestaurantSevlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // Pass the POST request directly to your existing doGet logic
	    doGet(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    RestaurantDAOImpl rdao = new RestaurantDAOImpl();
	    String searchQuery = req.getParameter("search");
	    List<Restaurant> allRestaurants;

	    // Logic: If there is a search, filter; otherwise get all.
	    if (searchQuery != null && !searchQuery.isEmpty()) {
	        allRestaurants = rdao.searchByCuisine(searchQuery);
	    } else {
	        allRestaurants = rdao.getAll();
	    }
	    
	    // Set the attribute ONCE
	    req.setAttribute("allRestaurant", allRestaurants);
	    
	    // Forward to the JSP
	    RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");
	    rd.forward(req, resp);
	}

}
