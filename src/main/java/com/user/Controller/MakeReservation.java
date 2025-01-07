package com.user.Controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MakeReservation
 */
@WebServlet("/MakeReservation")
public class MakeReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false); // Retrieve existing session

        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect("Userlogin.jsp");
            return;
        }

        String userName = (String) session.getAttribute("userName");
        String email = (String) session.getAttribute("Email");


        request.setAttribute("userName", userName);
        request.setAttribute("Email", email);

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