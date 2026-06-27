package com.tap.controller;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      String name = req.getParameter("userName");
	      String email = req.getParameter("email");
	      String password = req.getParameter("password");
	      String address = req.getParameter("address");
	      String role = req.getParameter("role");
	      
	      System.out.println("SERVLET: Received data for: " + name);
	      
	      String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));
	      User u=new User(name,email,hashpw,address,role);
	      UserDAOImpl udao=new UserDAOImpl();
	      int user=udao.addUser(u);
	      
	      if(user==1) {
	    	  resp.sendRedirect("login.jsp");
	      }
	      else {
              resp.sendRedirect("register.jsp");
	      }
	      
	     
//	      resp.sendRedirect("LoginServlet");
	}

}
