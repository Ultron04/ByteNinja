<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
body {
	background-image: url('IMAGE/Dashboard2.avif');
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

.form-container {
	background-color: rgba(255, 255, 255, 0.9);
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	z-index: 1000;
	display: none;
}
</style>

<title>Delete User</title>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<!-- Back Button -->
			<a class="btn btn-outline-dark me-3" href="AdminDashboard"
				role="button"> ← Back </a> <a class="navbar-brand" href="#"> <img
				src="IMAGE/landing side 1.jpeg" alt="Logo"
				style="height: 30px; width: 30px; margin-right: 10px;"> Delete
				User
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
	<div class="success-popup" id="successPopup">User Exists.
		Proceeding to Deletion!</div>

	<!-- Form Container -->
	<div class="form-container">
		<h2 class="text-center">Delete User</h2>
		<form id="deleteUserForm" method="POST" action="UserDeleted">
			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="text" class="form-control" id="username" name="username"
					required>
				<%
				String errorMessage = request.getParameter("error");
				if ("notfound".equals(errorMessage)) {
				%>
				<div class="error-message">User not found.</div>
				<%
				}
				%>
			</div>
			<button type="submit" class="btn btn-primary w-100">Delete
				User</button>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script>
        // Display success popup if "success" message exists in the query string
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get("success") === "exists") {
            const successPopup = document.getElementById("successPopup");
            successPopup.style.display = "block";
            setTimeout(() => {
                successPopup.style.display = "none";
                window.location.href = "Deleteuser.jsp"; // Reset the page to default
            }, 2000);
        }
    </script>
</body>
</html>
