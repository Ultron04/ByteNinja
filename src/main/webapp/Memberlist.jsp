<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.dao.userDAO" %>
<%@ page import="com.user.model.User" %>
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
        color: #808080;
      }
  
      .table-container table th,
      .table-container table td {
        text-align: center;
      }

      /* Animation Styles */
      .table-row {
        opacity: 0;
        transform: translateY(20px);
        animation: fadeInUp 0.5s forwards;
      }

      @keyframes fadeInUp {
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
    </style>
  
    <title>Membership Details</title>
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
      <div class="container-fluid">
        <!-- Back Button -->
        <a class="btn btn-outline-dark me-3" href="AdminDashboard" role="button">
          ← Back
        </a>
        <!-- Logo and Title -->
        <a class="navbar-brand" href="Memberslist">
          <img src="IMAGE/landing side 1.jpeg" alt="Logo" style="height: 30px; width: 30px; margin-right: 10px;">Members Details
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <!-- Search Box -->
          <form class="d-flex w-50" action="SearchServlet" method="GET">
            <input class="form-control me-2" type="search" name="query" placeholder="Search..." aria-label="Search" required>
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
          <!-- Logout Nav Item -->
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link" href="AdminLogout">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  
    <!-- Welcome Text -->
    <h1 class="welcome-text">Members Details, Here!</h1>
  
    <!-- Table Container -->
    <div class="table-container">
      <!-- Bootstrap Table -->
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>Serial No</th>
            <th>Username</th>
            <th>Password</th>
            <th>Name</th>
          </tr>
        </thead>
        <tbody>
          <!-- Fetching Data from Database -->
          <%
            userDAO dao = new userDAO();
            List<User> users = dao.selectAllUsers();

            int serialNo = 1;
            int delay = 0;
            for (User user : users) {
          %>
          <tr class="table-row" style="animation-delay: <%= delay %>ms;">
            <td><%= serialNo++ %></td>
            <td><%= user.getUsername() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getName() %></td>
          </tr>
          <%
              delay += 100; // Increase delay for each row
            }
          %>
        </tbody>
      </table>
    </div>
  
    <!-- Optional JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
