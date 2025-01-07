package com.user.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.userDAO;
import com.user.model.Seats;

/**
 * Servlet implementation class CheckReservation
 */
@WebServlet("/CheckReservation")
public class CheckReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("Email") == null) {
            // If session is invalid or user is not logged in, redirect to login page
            response.sendRedirect("Userlogin.jsp");
            return;
        }

        // Retrieve the email (username) from the session
        String email = (String) session.getAttribute("Email");

        // Fetch reservation details from the database
        userDAO dao = new userDAO();
        List<Seats> reservations = dao.selectUserReservation(email);

        // Set the reservations as a request attribute
        request.setAttribute("reservations", reservations);

        // Forward to the JSP page
        request.getRequestDispatcher("CheckReservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
