package com.user.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.userDAO;


/**
 * Servlet implementation class UpdatedPassword
 */
@WebServlet("/UpdatedPassword")
public class UpdatedPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatedPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        
        // Instantiate userDAO
        userDAO dao = new userDAO();
        // Check if user exists
        boolean userExists = dao.checkUser(username);
        
        if (userExists) {
            // Update the password
            boolean isUpdated = dao.updatepassword(username,newPassword);

            if (isUpdated) {
                // Redirect back with success message
                response.sendRedirect("Updatepassword.jsp?success=true");
            } else {
                // Error in updating password
                response.sendRedirect("Updatepassword.jsp?error=fail");
            }
        } else {
            // User does not exist
            response.sendRedirect("Updatepassword.jsp?error=notfound");
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
