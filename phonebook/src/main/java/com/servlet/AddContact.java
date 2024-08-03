package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.contactDAO;
import com.entity.contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String about = req.getParameter("about");
            int userId = Integer.parseInt(req.getParameter("userid")); // Parsing userId

            // Create contact object
            contact c = new contact(name, email, phno, about, userId);
            contactDAO dao = new contactDAO(DbConnect.getConn());

            // Save contact and handle result
            boolean f = dao.saveContact(c);
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Contact saved successfully...");
            } else {
                session.setAttribute("failedMsg", "Something went wrong...");
            }
            resp.sendRedirect("addContact.jsp"); // Redirect to JSP page
        } catch (NumberFormatException e) {
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Invalid user ID format. Please provide a valid numeric ID.");
            resp.sendRedirect("addContact.jsp");
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error occurred.");
        }
    }
}
