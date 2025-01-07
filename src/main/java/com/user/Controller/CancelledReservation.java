package com.user.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.userDAO;

/**
 * Servlet implementation class CancelledReservation
 */
@WebServlet("/CancelledReservation")
public class CancelledReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelledReservation() {
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
        boolean userExists = dao.checkUserinReservation(username); // Check user existence in DB

        if (userExists) {
            dao.deleteSeats(username); // Proceed to delete the user
            response.sendRedirect("Cancelreservation.jsp?success=exists");
        } else {
            response.sendRedirect("Cancelreservation.jsp?error=notfound");
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
