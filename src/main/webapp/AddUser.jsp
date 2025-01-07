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
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	height: 100vh;
	margin: 0;
	display: flex;
	flex-direction: column;
}

.navbar {
	background-color: #4ce6c1;
}

.navbar-brand {
	font-size: 15px;
	font-weight: bold;
	color: #000000 !important;
}

.navbar-nav .nav-link {
	color: #FFFAED !important;
}

h1 {
	font-weight: bold;
	margin-bottom: 20px;
	color: #FFFAED;
	text-align: center;
}

h2 {
	font-weight: bold;
	margin-bottom: 20px;
	text-align: center;
}

.form-container {
	background-color: rgba(255, 255, 255, 0.9);
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	width: 400px;
	margin: auto;
	margin-top: auto;
	margin-bottom: auto;
}

.form-container .btn {
	background-color: #4ce6c1;
	color: #fff;
	border: none;
}

.form-container .btn:hover {
	background-color: #3bb59a;
}
</style>

<title>New User Registration</title>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<!-- Back Button -->
			<a class="btn btn-outline-dark me-3" href="AdminDashboard"
				role="button"> ← Back </a> <a class="navbar-brand" href="AddUser">User
				Registration</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="AdminLogout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Welcome Text -->
	<h1>Welcome, Add New Members!</h1>

	<!-- Form Container -->
	<div class="form-container">
		<h2>New Member Registration!</h2>

		<form id="addUserForm" action="AddedUser" method="POST"
			onsubmit="return validateForm()">
			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="text" class="form-control" id="username" name="username"
					required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					required>
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">Name</label> <input type="text"
					class="form-control" id="name" name="name" required>
			</div>
			<button type="submit" class="btn btn-primary w-100">Add User</button>
		</form>
	</div>

	<!-- JavaScript -->
	<script>
        function validateForm() {
            const username = document.getElementById("username").value.trim();
            const password = document.getElementById("password").value.trim();
            const name = document.getElementById("name").value.trim();

            if (!username || !password || !name) {
                alert("All fields are required.");
                return false;
            }
            return true;
        }

        // Display success message popup
        <%if (request.getAttribute("message") != null) {%>
        alert('<%=request.getAttribute("message")%>
		');
	<%}%>
		
	</script>
</body>
</html>
