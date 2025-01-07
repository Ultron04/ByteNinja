<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Landing Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
      body {
        background-image: url('IMAGE/landing back 1.avif'); /* Set your background image */
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .custom-container {
        display: flex;
        background: rgba(255, 255, 255, 0.9); /* Slight transparency */
        padding: 20px 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        align-items: center;
        max-width: 900px;
      }

      .image-section {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-right: 20px;
      }

      .image-section img {
        max-width: 100%;
        max-height: 200px;
        border-radius: 10px;
      }

      .content-section {
        flex: 2;
        text-align: center;
      }

      h1 {
        font-weight: bold;
        margin-bottom: 20px;
      }

      .btn-container {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
      }

      .custom-btn {
        background-color: #4ce6c1; /* Teal color */
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
    </style>
  </head>
  <body>
    <div class="custom-container">
      <div class="image-section">
        <img src="IMAGE/landing side 1.jpeg" alt="Side Image"> <!-- Set your side image -->
      </div>
      <div class="content-section">
        <h1>WELCOME TO BYTE NINJA</h1>
        <div class="btn-container">
          <form action="Adminlogin" method="post">
            <button type="submit" class="custom-btn">Admin Login</button>
          </form>
          <form action="Userlogin" method="post">
            <button type="submit" class="custom-btn">Student Login</button>
          </form>
        </div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>