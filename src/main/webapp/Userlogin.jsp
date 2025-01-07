<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Meta tags and Bootstrap CSS -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <style>
        body {
            background-image: url('IMAGE/landing back 1.avif'); /* Same background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: 'Arial', sans-serif; /* Matching font */
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            font-weight: bold;
            margin-bottom: 20px;
        }

        .custom-btn {
            background-color: #4ce6c1; /* Teal color to match landing page */
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .custom-btn:hover {
            background-color: #3acba9; /* Slightly darker teal */
        }

        /* Added CSS for the back button */
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            text-decoration: none;
            font-size: 18px;
            color: #000;
            font-weight: bold;
            background-color: #ffffffcc; /* Semi-transparent background */
            padding: 5px 10px;
            border-radius: 5px;
        }

        .back-button:hover {
            background-color: #f0f0f0cc;
        }

        /* Added CSS for error message and 'or' text */
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }

        .or-text {
            text-align: center;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <center><h1>USER LOGIN</h1></center>
        <form action="/Byteninjas/UserValid" method="post">
            <div class="mb-3">
                <label for="Username" class="form-label">Username</label>
                <input type="email" class="form-control" id="Username" name="Username" aria-describedby="emailHelp" required>
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <!-- Error Message Display -->
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
            <div class="error-message">
                *<%= errorMessage %>
            </div>
            <%
                }
            %>

            <button type="submit" class="custom-btn w-100">Login</button>
            <div class="or-text">or</div>
            <button type="button" class="custom-btn w-100" onclick="window.location.href='/Byteninjas/Adminlogin'">Admin? Login here!</button>
        </form>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>