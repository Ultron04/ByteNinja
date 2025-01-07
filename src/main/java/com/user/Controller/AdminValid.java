package com.user.Controller;
import java.io.IOException;


import com.user.dao.userDAO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminValid")
public class AdminValid extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve username and password from the request
        String username = request.getParameter("Username");
        String password = request.getParameter("password");

        // Instantiate userDAO and validate admin credentials
        userDAO dao = new userDAO();
        boolean isValidAdmin = dao.validateAdmin(username, password);

        if (isValidAdmin) {
            // If valid, redirect to AdminDashboard.jsp
           request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
        } else {
            // If invalid, set error message and redirect back to Adminlogin.jsp
        	request.setAttribute("errorMessage", "Invalid credentials");
            request.getRequestDispatcher("Adminlogin.jsp").forward(request, response);
        }
    }
}
