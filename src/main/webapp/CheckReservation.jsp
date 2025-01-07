<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.Seats" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  
    <style>
      body {
        background-image: url('IMAGE/Dashboard2.avif');
        background-size: cover;
      }
  
      .navbar {
        background-color: #4ce6c1;
      }
  
      .navbar-brand {
        font-size: 15px; 
        font-weight: bold;
        color: #000000 !important;
      }
  
      .nav-link {
        color: #FFFAED !important;
      }
  
      h1 {
        font-weight: bold;
        margin-bottom: 20px;
        color: #FFFAED;
        text-align: center;
      }
  
      .welcome-text {
        text-align: center;
        font-size: 2em;
        margin-top: 20px;
        color: #FFFAED;
      }
  
      /* Table Styles */
      .table-container {
        margin: 50px auto;
        width: 80%;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
      }
  
      .table-container table {
        color: #000;
      }
  
      .table-container table th,
      .table-container table td {
        text-align: center;
      }

      /* Animation Styles */
      .table-row {
        opacity: 0;
        transform: translateY(20px);
        animation: fadeInUp 0.5s ease forwards;
      }

      @keyframes fadeInUp {
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
    </style>
  
    <title>User Reservation Details</title>
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
      <div class="container-fluid">
        <!-- Back Button -->
        <a class="btn btn-outline-dark me-3" href="UserDashboard" role="button">
          ← Back
        </a>
        <!-- Logo and Title -->
        <a class="navbar-brand" href="#">
          <img src="IMAGE/landing side 1.jpeg" alt="Logo" style="height: 30px; width: 30px; margin-right: 10px;">Reservation Details
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <!-- Logout Nav Item -->
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link" href="UserLogout">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  
    <!-- Welcome Text -->
    <h1 class="welcome-text">Your Reservation Details</h1>
  
    <!-- Table Container -->
    <div class="table-container">
      <!-- Bootstrap Table -->
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>Serial No</th>
            <th>Seat Number</th>
            <th>Reservation Date</th>
          </tr>
        </thead>
        <tbody>
          <!-- Fetching Data from Servlet -->
          <%
            List<Seats> reservations = (List<Seats>) request.getAttribute("reservations");
            if (reservations != null && !reservations.isEmpty()) {
              int serialNo = 1;
              int delay = 0; // Delay for animation
              for (Seats seat : reservations) {
          %>
          <tr class="table-row" style="animation-delay: <%= delay %>ms;">
            <td><%= serialNo++ %></td>
            <td><%= seat.getSeats() %></td>
            <td><%= seat.getDate() %></td>
          </tr>
          <%
                delay += 100; // Increase delay for each row
              }
            } else {
          %>
          <tr>
            <td colspan="3">No reservations found.</td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
    </div>
  
    <!-- Optional JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>