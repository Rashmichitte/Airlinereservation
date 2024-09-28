<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" import="com.airline.model.Flight" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/newindex.jpg" type="image/x-icon">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-image: url("images/newbc1.png");
            background-size: cover;
            background-position: center;
            height: 100vh;
            position: relative;
        }

        /* Add a transparent overlay */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        h1, p, table, .button-container {
            position: relative;
            z-index: 2;
        }

        h1 {
            color: black;
            margin-bottom: 20px;
            text-shadow: 3px 3px 5px rgba(255, 255, 255, 0.4);
        }

        p {
            font-size: 16px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #35424a;
            color: #ffffff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e0e0e0;
        }

        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
            color: #fff;
        }

        .button-logout {
            background-color: #dc3545; /* Cancel Button */
        }

        .button-logout:hover {
            background-color: #c82333;
        }

        .button-confirm {
            background-color: #007bff; /* Confirm Button */
        }

        .button-confirm:hover {
            background-color: #0056b3;
        }

        .button-home {
            background-color: #28a745; /* Go to Home Button */
        }

        .button-home:hover {
            background-color: #218838;
        }

        .button-back {
            background-color: #17a2b8; /* Back Button */
        }

        .button-back:hover {
            background-color: #138496;
        }

        .button-container {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container .button {
            margin: 0 10px;
        }

        @media (max-width: 768px) {
            .button-container {
                flex-direction: column;
                align-items: center;
            }

            .button-container .button {
                margin: 10px 0;
            }
        }
    </style>
</head>

<body>
    <h1>Booking Confirmation</h1>

    <!-- Buttons for Confirm and Cancel -->
    <div class='button-container'>
        <form action='jsp/domestic_booking.jsp' method='post'>
            <input type="hidden" name="flightId" value="<%= request.getAttribute("flightId") %>">
            <input type="hidden" name="passengerName" value="<%= request.getAttribute("passengerName") %>">
            <input type="hidden" name="source_city" value="<%= request.getAttribute("source_city") %>">
            <input type="hidden" name="destination_city" value="<%= request.getAttribute("destination_city") %>">
            <input type="hidden" name="seatClass" value="<%= request.getAttribute("seatClass") %>">
            <input type="hidden" name="numPassengers" value="<%= request.getAttribute("numPassengers") %>">
            <input type="hidden" name="Sel" value="<%= session.getAttribute("Sel") %>">
            <input type="hidden" name="Sor" value="<%= session.getAttribute("Sor") %>">
            <input type="hidden" name="Des" value="<%= session.getAttribute("Des") %>">
            <input type="hidden" name="action" value="cancel">
            <input type='submit' name='click' value='Cancel' class='button button-logout' />
        </form>
        <form action='bookDomesticFlight' method='post'>
            <input type="hidden" name="flightId" value="<%= request.getAttribute("flightId") %>">
            <input type="hidden" name="passengerName" value="<%= request.getAttribute("passengerName") %>">
            <input type="hidden" name="seatClass" value="<%= request.getAttribute("seatClass") %>">
            <input type="hidden" name="numPassengers" value="<%= request.getAttribute("numPassengers") %>">
            <input type="hidden" name="isD" value="<%= request.getAttribute("isD") %>">
            <input type="hidden" name="action" value="Confirm">
            <input type='submit' name='click' value='Confirm' class='button button-confirm' />
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>Flight ID</th>
                <th>Passenger Name</th>
                <th>Seat Class</th>
                <th>Number of Passengers</th>
                <th>Total Amount</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= request.getAttribute("flightId") %></td>
                <td><%= request.getAttribute("passengerName") %></td>
                <td><%= request.getAttribute("seatClass") %></td>
                <td><%= request.getAttribute("numPassengers") %></td>
                <td><%= request.getAttribute("paid") %></td>
            </tr>
        </tbody>
    </table>

    <% Boolean a = (Boolean) session.getAttribute("a"); %>
    <!-- Button container with alignment -->
    <div class='button-container'>
        <a href="jsp/domestic_booking.jsp?flightId=<%= request.getAttribute("flightId") %>&source_city=<%= request.getAttribute("source_city") %>&destination_city=<%= request.getAttribute("destination_city") %>">
            <button class='button button-back'>Back</button>
        </a>

        <a href='index.jsp'>
            <button class='button button-home'>Go to Home</button>
        </a>
    </div>
</body>

</html>
