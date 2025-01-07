package com.user.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.userDAO;
import com.user.model.Seats;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
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

        // Retrieve form parameters
        String seatNoStr = request.getParameter("seatNo");
        String reservationDate = request.getParameter("reservationDate");

        // Validate input
        if (seatNoStr == null || reservationDate == null || seatNoStr.isEmpty() || reservationDate.isEmpty()) {
            request.setAttribute("reservationStatus", "unavailable");
            request.getRequestDispatcher("BookReservation.jsp").forward(request, response);
            return;
        }

        int seatNo;
        try {
            seatNo = Integer.parseInt(seatNoStr);
        } catch (NumberFormatException e) {
            request.setAttribute("reservationStatus", "unavailable");
            request.getRequestDispatcher("BookReservation.jsp").forward(request, response);
            return;
        }

        // Check if the slot is available
        userDAO dao = new userDAO();
        boolean isAvailable = dao.checkSlot(seatNo, reservationDate);

        if (!isAvailable) {
            // If the slot is not available, set reservation status to "unavailable"
            request.setAttribute("reservationStatus", "unavailable");
            request.getRequestDispatcher("BookReservation.jsp").forward(request, response);
            return;
        }

        // If the slot is available, reserve the seat
        Seats seat = new Seats();
        seat.setS_username(email); // Set the username (email)
        seat.setSeats(seatNo); // Set the seat number
        seat.setDate(reservationDate); // Set the reservation date

        dao.allotseat(seat); // Reserve the seat

        // Set reservation status to "success"
        request.setAttribute("reservationStatus", "success");
        request.getRequestDispatcher("BookReservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
