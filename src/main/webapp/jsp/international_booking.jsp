<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.airline.model.Flight" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/logo.jpg" type="image/x-icon">
    <title>Welcome to International Flights Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: #333;
            background: url('../images/bookflight.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
            z-index: 1;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.5);
            z-index: -1;
        }

        h1 {
            color: black;
            margin-bottom: 20px;
            text-align: center;
            text-shadow: 3px 3px 5px rgba(255, 255, 255, 0.4);
        }

        .form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
            box-sizing: border-box;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"], input[type="radio"] {
            margin-bottom: 12px;
        }

        input[type="text"], input[type="number"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .radio-group {
            margin-bottom: 12px;
        }

        .radio-group label {
            display: inline-block;
            margin-right: 20px;
            font-size: 16px;
        }

        /* Button styles */
        input[type="submit"], .back-home, .back-back {
            border: none;
            color: #ffffff;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            box-sizing: border-box;
            display: block; /* Set to block to center */
            margin: 10px auto; /* Center the button */
        }

        /* Main Submit Button */
        input[type="submit"] {
            background-color: #1abc9c; /* Teal */
        }

        input[type="submit"]:hover {
            background-color: #16a085; /* Darker Teal */
            transform: scale(1.05);
        }

        input[type="submit"]:active {
            background-color: #148f77; /* Even Darker Teal */
            transform: scale(0.98);
        }

        /* Back to Home Button */
        .back-home {
            background-color: #3498db; /* Vibrant Blue */
            width: 150px; /* Set fixed width for Home button */
            text-align: center; /* Center text */
        }

        .back-home:hover {
            background-color: #2980b9; /* Darker Blue */
            transform: scale(1.05);
        }

        .back-home:active {
            background-color: #2471a3; /* Even Darker Blue */
            transform: scale(0.98);
        }

        /* Back Button */
        .back-back {
            background-color: #9b59b6; /* Bold Purple */
        }

        .back-back:hover {
            background-color: #8e44ad; /* Darker Purple */
            transform: scale(1.05);
        }

        .back-back:active {
            background-color: #7d3c98; /* Even Darker Purple */
            transform: scale(0.98);
        }

        .from-to-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 5px;
            margin-top: 5px;
        }

        .from-to-label {
            display: inline-block;
            margin-right: 10px;
            font-weight: bold;
        }

        .from-to-input {
            width: 45%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .from-to-container {
                flex-direction: column;
                align-items: flex-start;
            }

            .from-to-input {
                width: 100%;
                margin-bottom: 10px;
            }

            input[type="submit"], .back-home {
                font-size: 16px;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 20px;
            }

            h1 {
                font-size: 1.5em;
            }

            .form {
                width: 100%;
                padding: 15px;
            }

            label {
                font-size: 14px;
            }

            input[type="text"], input[type="number"], .from-to-input {
                font-size: 14px;
                padding: 8px;
            }

            input[type="submit"], .back-home {
                font-size: 14px;
                padding: 8px 12px;
            }

            .from-to-container {
                flex-direction: column;
            }

            .from-to-label {
                margin-bottom: 5px;
            }
        }
    </style>

</head>

<body>
<% Boolean a = (Boolean) session.getAttribute("a"); %>
    <%if(a) {%>
     <h1>Book International Flight</h1>

    <%
    // Retrieve flightId, source_city, and destination_city from the request parameter
    String flightId = request.getParameter("flightId");
    String source_city = request.getParameter("source_city");
    String destination_city = request.getParameter("destination_city");
    String ArrivalTime = request.getParameter("ArrivalTime");
    String DepartureTime = request.getParameter("DepartureTime");
    
    if(DepartureTime != null && ArrivalTime != null){
        session.setAttribute("DepartureTime", DepartureTime);
        session.setAttribute("ArrivalTime", ArrivalTime);
    }
    %>
	
    <form action="../bookInternationalFlight" method="post" class="form">
        <input type="hidden" value="false" name="isD">
        <input type="hidden" name="a" value=<%= true %>>
        <label for="flightId">Flight ID:</label>
        <input type="text" id="flightId" name="flightId" value="<%= flightId != null ? flightId : "" %>" readonly required><br>

        <div class="from-to-container">
            <label class="from-to-label" for="source_city">From:</label>
            <input type="text" id="source_city" class="from-to-input" name="source_city" value="<%= source_city != null ? source_city : "" %>" readonly required>
            <label class="from-to-label" for="destination_city" style="margin-left: 10px;">To:</label>
            <input type="text" id="destination_city" class="from-to-input" name="destination_city" value="<%= destination_city != null ? destination_city : "" %>" readonly required>
        </div>

        <label for="passengerName">Passenger Name:</label>
        <input type="text" id="passengerName" name="passengerName" required><br>

        <label>Seat Class:</label>
        <div class="radio-group">
            <label>
                <input type="radio" name="seatClass" value="Economy" required> Economy
            </label>
            <label>
                <input type="radio" name="seatClass" value="Business" required> Business
            </label>
        </div>

        <label for="numPassengers">Number of Passengers:</label>
        <input type="number" id="numPassengers" name="numPassengers" min="1" max="9" required><br>

        <input type="submit" value="Book Flight">
    </form>

    <a href="../index.jsp" class="back-home">Home</a>
    <form action="../internationalFlight" method="get">
        <input type="hidden" name="b" value="false">
        <input type="submit" value="Back" class="back-back">
    </form>

    <%} %>
</body>

</html>
