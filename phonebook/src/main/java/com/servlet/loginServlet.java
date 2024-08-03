package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.userDAO;
import com.entity.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class loginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email =req.getParameter("email");
		String pass =req.getParameter("password");
		
		System.out.println(email+" "+pass+" ");
		userDAO dao=new userDAO(DbConnect.getConn());
		user u=dao.loginUser(email,pass);
		
		HttpSession session=req.getSession();
		if(u!=null) {
			session.setAttribute("user", u);
			resp.sendRedirect("index.jsp");
			//System.out.println("User is present "+u);
		}else {
			//System.out.println("User is absent "+u);
			session.setAttribute("invalidMsg", "Invalid Email & Password");
			resp.sendRedirect("login.jsp");
		}
	}
	
}
