package com.tap.controller;

import java.io.IOException;

import com.tap.DAOImpl.FavoriteDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("User");
		
		if(user==null) {
			resp.sendRedirect("login.jsp");
		}
		
		int userID = user.getUserID();
		Integer restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		FavoriteDAOImpl favoriteDAOImpl = new FavoriteDAOImpl();
		boolean favorite = favoriteDAOImpl.isFavorite(userID, restaurantId);
		if(favorite) {
			favoriteDAOImpl.removeFavorite(userID, restaurantId);
		}
		else {
			favoriteDAOImpl.addFavorite(userID, restaurantId);
		}
		
		resp.sendRedirect("restaurant");
	}

}
