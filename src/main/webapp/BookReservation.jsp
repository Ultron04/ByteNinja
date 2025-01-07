<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Get today's date in YYYY-MM-DD format
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Calendar calendar = java.util.Calendar.getInstance();
String today = sdf.format(calendar.getTime());

// Get date 4 days from today
calendar.add(java.util.Calendar.DATE, 4); // Add 4 days to current date
String maxDate = sdf.format(calendar.getTime());

// Check for reservation status from the request attribute
String reservationStatus = (String) request.getAttribute("reservationStatus");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags and Bootstrap CSS -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Book Reservation</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

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
}

.welcome-text {
	text-align: center;
	font-size: 2em;
	margin-top: 20px;
	color: #FFFAED;
}

/* Form Styles */
.reservation-form {
	background: rgba(255, 255, 255, 0.9);
	padding: 30px;
	border-radius: 10px;
	max-width: 400px;
	margin: 50px auto;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<!-- Back Button -->
			<a class="btn btn-outline-dark me-3" href="UserDashboard"
				role="button"> ← Back </a>
			<!-- Logo image -->
			<a class="navbar-brand d-flex align-items-center" href="#"> <img
				src="IMAGE/landing side 1.jpeg" alt="Logo"
				style="height: 30px; width: 30px; margin-right: 10px;"> Admin
				Dashboard
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
	<h1 class="welcome-text">
		<%=(String) session.getAttribute("userName")%>, Make Reservation
		Here!
	</h1>

	<!-- Reservation Form -->
	<div class="reservation-form">
		<form action="ReservationServlet" method="POST">
			<!-- Seat Number Dropdown -->
			<div class="mb-3">
				<label for="seatNo" class="form-label">Seat Number</label> <select
					class="form-select" id="seatNo" name="seatNo" required>
					<option value="" selected disabled>Select Seat Number</option>
					<%
					for (int i = 1; i <= 10; i++) { // Only seats 1-10
					%>
					<option value="<%=i%>">Seat
						<%=i%></option>
					<%
					}
					%>
				</select>
			</div>

			<!-- Date Picker -->
			<div class="mb-3">
				<label for="reservationDate" class="form-label">Reservation
					Date</label> <input type="date" class="form-control" id="reservationDate"
					name="reservationDate" required pattern="\d{4}-\d{2}-\d{2}"
					min="<%=today%>" max="<%=maxDate%>">
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary w-100">Reserve
				Now</button>
		</form>
	</div>

	<!-- JavaScript for Popup -->
	<script>
        // Check if reservation status is set
        const reservationStatus = "<%=reservationStatus != null ? reservationStatus : ""%>
		";

		if (reservationStatus === "success") {
			alert("Reserved successfully!");
		} else if (reservationStatus === "unavailable") {
			alert("Seat Unavailable!");
		}
	</script>

	<!-- Bootstrap JS Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>