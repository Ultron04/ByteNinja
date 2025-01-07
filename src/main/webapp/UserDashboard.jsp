<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
body {
	background-image: url('IMAGE/Dashboard2.avif');
	/* Set your background image */
	background-size: cover;
}

.navbar {
	background-color: #4ce6c1;
}

.navbar-brand {
	font-size: 15px;
	font-weight: bold; /* Reduced font size */
	color: #000000 !important; /* Set text color to black */
}

.nav-link {
	color: #FFFAED !important; /* Set font color for nav items */
}

h1 {
	font-weight: bold;
	margin-bottom: 20px;
	color: #FFFAED; /* Set font color for h1 */
}

.welcome-text {
	text-align: center;
	font-size: 2em;
	margin-top: 20px;
	color: #FFFAED; /* Set font color for welcome text */
}

/* Card Styles */
.card-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 20px; /* Space between cards */
	margin-top: 250px; /* Push the cards down */
}

.card {
	width: 200px; /* Square shape */
	height: 200px; /* Square shape */
	background-color: #ffffff; /* White background */
	border-radius: 15px; /* Curved corners */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8); /* Subtle black shadow */
	display: flex;
	flex-direction: column; /* Stack content vertically */
	justify-content: flex-end; /* Align text to the bottom */
	align-items: center; /* Center text horizontally */
	text-align: center;
	font-weight: bold;
	font-size: 1.2em;
	color: #ffffff; /* White text for better contrast */
	cursor: pointer; /* Pointer cursor on hover */
	transition: transform 0.3s, box-shadow 0.3s; /* Smooth hover effect */
	padding: 10px; /* Add padding inside the card */
}

/* Specific Backgrounds for Each Card */
.card-0 {
	background-image: url('IMAGE/Card 0.webp'); /* Background for Card 1 */
	background-size: cover;
	background-position: center;
}

.card-1 {
	background-image: url('IMAGE/Card 1.jpg'); /* Background for Card 1 */
	background-size: cover;
	background-position: center;
}

.card-2 {
	background-image: url('IMAGE/Card 2.jpeg'); /* Background for Card 2 */
	background-size: cover;
	background-position: center;
}

/* Hover Effect with Black Shadow */
.card:hover {
	transform: scale(1.05); /* Slightly enlarge on hover */
	box-shadow: 0 8px 16px rgba(255, 255, 255, 0.8);
	/* Darker black shadow on hover */
}
</style>

<title>User Dashboard</title>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<!-- Added logo image -->
			<a class="navbar-brand d-flex align-items-center" href="#"> <img
				src="IMAGE/landing side 1.jpeg" alt="Logo"
				style="height: 30px; width: 30px; margin-right: 10px;"> <!-- Adjust image path and size -->
				User Dashboard
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
					<li class="nav-item"><a class="nav-link"
						onclick="window.location.href='UserLogout';">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Welcome Text -->
	<!-- Welcome Message -->
	<h1 class="welcome-text">
		Welcome Back,
		<%=session.getAttribute("userName")%>!
	</h1>

	<!-- Card Panel -->
	<div class="card-container">
		<!-- Card 1 -->
		<div class="card card-0"
			onclick="window.location.href='MakeReservation';">Book
			Reservations</div>
		<div class="card card-1"
			onclick="window.location.href='CheckReservation';">Check
			Reservation</div>

		<%
		String userName = (String) session.getAttribute("userName");
		String email = (String) session.getAttribute("Email");
		%>
	</div>

	<!-- Optional JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>