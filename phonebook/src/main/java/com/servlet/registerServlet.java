package com.servlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.userDAO;
import com.entity.user;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/register")
public class registerServlet extends HttpServlet{

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		user u=new user(name, email, password);
		
		userDAO dao=new userDAO(DbConnect.getConn());
		boolean f=dao.userRegister(u);
		
		HttpSession session=request.getSession();
		if(f) {
			session.setAttribute("sucessMsg", "User Resgistration Success...");
			response.sendRedirect("register.jsp");
			//System.out.println("Success");
		}else {
			session.setAttribute("errorMsg", "User Resgistration Failed...");
			response.sendRedirect("register.jsp");
			System.out.println("fail");
		}
	}
}
