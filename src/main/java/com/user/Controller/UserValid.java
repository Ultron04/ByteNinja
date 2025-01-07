package com.user.Controller;
import java.io.IOException;


import com.user.dao.userDAO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserValid")
public class UserValid extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve username and password from the request
    	 String username = request.getParameter("Username");
         String password = request.getParameter("password");

         userDAO dao = new userDAO();
         boolean isValidUser = dao.validateUser(username, password);

         if (isValidUser) {
             String userNameFromDB = dao.getUserName(username);

             // Invalidate the old session and create a new one
             HttpSession session = request.getSession();
             
             

             // Set the username and email in the session
             session.setAttribute("userName", userNameFromDB);
             session.setAttribute("Email", username);

             request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
         } else {
             // If invalid, set error message and redirect back to login
             request.setAttribute("errorMessage", "Invalid credentials");
             request.getRequestDispatcher("Userlogin.jsp").forward(request, response);
         }

    }
}