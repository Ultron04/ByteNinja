package com.user.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.user.dao.userDAO;
import com.user.model.User;

/**
 * Servlet implementation class Reservationlist
 */
@WebServlet("/Reservationlist")
public class Reservationlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDAO dao; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservationlist() {
        super();
        dao = new userDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Fetch reservations from the database using the DAO
		List<User> listUsers = dao.selectAllUsers();

        // Set the list as a request attribute
        request.setAttribute("listuser", listUsers);

        // Forward the request to the JSP page
        request.getRequestDispatcher("Reservation.jsp").forward(request, response);
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
