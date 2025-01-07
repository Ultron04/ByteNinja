<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<!-- Include Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Include Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
body {
	background-image: url('IMAGE/Dashboard2.avif');
	/* Set your background image */
	background-size: cover;
	background-repeat: no-repeat;
	height: 100vh;
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

.form-container {
	background-color: rgba(255, 255, 255, 0.9);
	padding: 30px;
	border-radius: 10px;
	width: 400px;
	margin: 50px auto;
}

.form-container .btn {
	background-color: #4ce6c1;
	color: #fff;
	border: none;
}

.form-container .btn:hover {
	background-color: #3bb59a;
}

.error-message {
	color: red;
	font-size: 0.9em;
	margin-top: 5px;
}

.success-popup {
	position: fixed;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #4ce6c1;
	color: white;
	padding: 15px;
	border-radius: 5px;
	z-index: 1000;
	display: none;
}

/* Style for the password toggle icon */
.password-toggle {
	position: relative;
}

.password-toggle .toggle-icon {
	position: absolute;
	top: 75%; /* Adjusted from 50% to 55% to move the icon down */
	right: 10px;
	transform: translateY(-50%);
	cursor: pointer;
}
</style>

<title>Password Updation</title>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<!-- Back Button -->
			<a class="btn btn-outline-dark me-3" href="AdminDashboard"
				role="button"> ← Back </a> <a class="navbar-brand"
				href="Updatepassword.jsp"> <img src="IMAGE/landing side 1.jpeg"
				alt="Logo" style="height: 30px; width: 30px; margin-right: 10px;">
				Reset Password
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<!-- Search Box -->
				<form class="d-flex w-50" action="SearchServlet" method="GET">
					<input class="form-control me-2" type="search" name="query"
						placeholder="Search..." aria-label="Search" required>
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<!-- Logout Nav Item -->
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="AdminLogout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Success Popup -->
	<div class="success-popup" id="successPopup">Password updated
		successfully!</div>

	<!-- Form Container -->
	<div class="form-container">
		<h2 class="text-center">Update Password</h2>
		<form id="updatePasswordForm" method="POST" action="UpdatedPassword">
			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="email" class="form-control" id="username" name="username"
					required>
			</div>
			<div class="mb-3 password-toggle">
				<label for="newPassword" class="form-label">New Password</label> <input
					type="password" class="form-control" id="newPassword"
					name="newPassword" required>
				<!-- Eye icon to toggle password visibility -->
				<i class="fas fa-eye toggle-icon" id="togglePassword"></i>
			</div>
			<%
			String errorMessage = request.getParameter("error");
			if ("notfound".equals(errorMessage)) {
			%>
			<div class="error-message">User does not exist.</div>
			<%
			} else if ("fail".equals(errorMessage)) {
			%>
			<div class="error-message">Failed to update password. Please
				try again.</div>
			<%
			}
			%>
			<button type="submit" class="btn btn-primary w-100">Update
				Password</button>
		</form>
	</div>

	<!-- Optional JavaScript -->
	<!-- Include Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JavaScript to handle password visibility toggle -->
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            // Display success popup if "success" message exists in the query string
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get("success") === "true") {
                const successPopup = document.getElementById("successPopup");
                successPopup.style.display = "block";
                setTimeout(() => {
                    successPopup.style.display = "none";
                    window.location.href = "Updatepassword.jsp"; // Reset the page
                }, 2000);
            }

            // Toggle password visibility
            const togglePassword = document.getElementById("togglePassword");
            const passwordField = document.getElementById("newPassword");

            togglePassword.addEventListener("click", function () {
                // Toggle the type attribute
                const type = passwordField.getAttribute("type") === "password" ? "text" : "password";
                passwordField.setAttribute("type", type);
                // Toggle the eye slash icon
                this.classList.toggle("fa-eye-slash");
            });
        });
    </script>
</body>
</html>