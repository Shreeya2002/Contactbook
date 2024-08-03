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

@WebServlet("/update")
public class editContact extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve parameters from the request
            int cid = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String about = req.getParameter("about");

            // Create a contact object and set its attributes
            contact c = new contact();
            c.setId(cid); // Assuming the id is set appropriately
            c.setName(name);
            c.setEmail(email);
            c.setPhno(phno);
            c.setAbout(about);

            // Create DAO instance and handle database operations
            contactDAO dao = new contactDAO(DbConnect.getConn());
            HttpSession session = req.getSession();
            boolean f = dao.updateContact(c);

            // Set session attributes based on the result and redirect accordingly
            if (f) {
                session.setAttribute("succMsg", "Contact updated successfully.");
                resp.sendRedirect("viewContact.jsp");
            } else {
                session.setAttribute("failedMsg", "Failed to update contact. Please try again.");
                resp.sendRedirect("editContact.jsp"); // Redirect back to edit page on failure
            }
        } catch (NumberFormatException e) {
            // Handle NumberFormatException (e.g., invalid integer format)
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Invalid contact ID format. Please provide a valid numeric ID.");
            resp.sendRedirect("editContact.jsp");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace(); // Log the exception
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error occurred.");
        }
    }
}
