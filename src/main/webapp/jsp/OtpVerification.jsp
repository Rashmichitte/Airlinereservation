<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Verify OTP</title>
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
            background-position: center;
        }
        
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        h1 {
            color: #4CAF50;
            font-size: 24px;
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
            border-color: #007bff; /* Change border color on focus */
            outline: none; /* Remove outline */
        }

        input[type="submit"] {
            background-color: #28a745; /* Changed button color to a vibrant green */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s; /* Smooth transition */
        }

        input[type="submit"]:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .message {
            margin-bottom: 20px;
            color: #333;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            input[type="text"], input[type="submit"] {
                padding: 8px;
                font-size: 14px;
            }
            h1 {
                font-size: 22px;
            }
            h2 {
                font-size: 18px;
            }
        }

        @media (max-width: 480px) {
            input[type="text"], input[type="submit"] {
                padding: 8px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>OTP Sent Successfully</h1>
        <h2>Enter OTP</h2>
        <form action="../VerifyOtpServlet" method="post">
            <label for="otp">Enter the OTP:</label>
            <input type="text" name="otp" id="otp" required>
            <input type="submit" value="Verify OTP">
        </form>
    </div>
</body>
</html>
