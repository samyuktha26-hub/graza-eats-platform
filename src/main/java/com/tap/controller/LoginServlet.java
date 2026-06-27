package com.tap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/html");
	   String email = req.getParameter("email");
	   String password = req.getParameter("password");
	   
	   UserDAOImpl udao=new UserDAOImpl();
	   User user = udao.getUser(email);
	   boolean checkpw = BCrypt.checkpw(password, user.getPassword());
	   
	   HttpSession session = req.getSession();
	   if (checkpw) {
		    session.setAttribute("User", user);
		    resp.sendRedirect("restaurant");
		} else {
		    session.setAttribute("loginError", "Invalid email or password."); // Set the error
		    resp.sendRedirect("login.jsp");
		}
	}

}
