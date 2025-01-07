package com.user.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.userDAO;

/**
 * Servlet implementation class UserDeleted
 */
@WebServlet("/UserDeleted")
public class UserDeleted extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleted() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userDAO dao = new userDAO();
		String username = request.getParameter("username");
        boolean userExists = dao.checkUser(username); // Check user existence in DB

        if (userExists) {
            dao.deleteUser(username); // Proceed to delete the user
            response.sendRedirect("Deleteuser.jsp?success=exists");
        } else {
            response.sendRedirect("Deleteuser.jsp?error=notfound");
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
