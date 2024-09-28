<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>Forgot Password</title>
<link rel="icon" href="images/newindex.jpg" type="image/x-icon">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: url("images/index.jpg");
        background-size: cover;
    }

    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
        box-sizing: border-box;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
        color: #555;
    }

    input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .container {
            padding: 15px;
        }
        input[type="email"], input[type="submit"] {
            padding: 8px;
        }
    }

    @media (max-width: 480px) {
        input[type="email"], input[type="submit"] {
            padding: 8px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <form action="../SendOtpServlet" method="post">
            <label for="email">Enter your registered email:</label>
        	<input type="email" name="email" id="email" required>
        	<input type="submit" value="Send OTP">
        </form>
    </div>
</body>
</html>
