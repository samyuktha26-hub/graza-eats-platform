package com.tap.controller;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.FavoriteDAOImpl;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("User");
		if(user==null) {
			resp.sendRedirect("login.jsp");
		}
		int userID = user.getUserID();
		
		OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
		List<Order> allByUserId = orderDAOImpl.getAllByUserId(userID);
		req.setAttribute("orderHistory", allByUserId);
		
		FavoriteDAOImpl favoriteDAOImpl = new FavoriteDAOImpl();
		List<Restaurant> favorites = favoriteDAOImpl.getFavoritesByUserId(userID);
		System.out.println("DEBUG: User ID: " + userID);
		System.out.println("DEBUG: Favorites found: " + (favorites != null ? favorites.size() : "null"));
		req.setAttribute("favorites", favorites);
		
		RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
		rd.forward(req, resp);
	}

}
