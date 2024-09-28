<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.util.*" import = "com.airline.model.Flight"%>
<!DOCTYPE html>
<html>
<head>
    <title>Domestic Flights</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/newindex.jpg" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .logo {
            height: 60px;
            margin-right: 20px;
        }

        .header-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #333;
            padding: 30px;
            color: white;
            position: relative;
        }

        h1 {
            margin: 0;
            padding: 0;
            text-align: center;
            flex-grow: 1;
        }

        /* Attractive Back button styling */
        .back-button {
            position: absolute;
            right: 20px;
        }

        .back-button input {
            padding: 10px 20px;
            background-color: #ff5733; /* Vivid orange */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .back-button input:hover {
            background-color: #c70039; /* Deeper red */
            transform: scale(1.05);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Styling for Book button */
        .button {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #28a745;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            align-items: center;
        }

        .button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* Attractive Back to Home button */
        .button-home {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            background: linear-gradient(45deg, #ffcc00, #ff5733); /* Gradient from yellow to orange */
            color: white;
            border-radius: 5px;
            transition: background 0.3s, transform 0.3s;
            align-items: center;
        }

        .button-home:hover {
            background: linear-gradient(45deg, #ff5733, #ffcc00); /* Reverse gradient on hover */
            transform: scale(1.05);
        }

        .center-button {
            text-align: center;
            margin: 20px 0;
        }

        @media (max-width: 768px) {
            .header-container {
                padding: 20px;
                flex-direction: column;
                align-items: flex-start;
            }

            h1 {
                font-size: 20px;
                text-align: center;
                margin-bottom: 10px;
            }

            table, th, td {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }

            a, .back-button input {
                font-size: 16px;
                padding: 8px 16px;
            }
        }

        @media (max-width: 480px) {
            table {
                font-size: 12px;
            }

            th, td {
                padding: 6px;
            }

            a, .back-button input {
                font-size: 14px;
                padding: 6px 12px;
            }

            .header-container {
                padding: 15px;
            }

            h1 {
                font-size: 18px;
                margin-bottom: 10px;
            }
        }
    </style>
</head>

<body>
    <div class="header-container">
        <h1>Domestic Flights</h1>
        <div class="back-button">
            <form action="index.jsp"> 
                <input type="submit" value="Back">
            </form>
        </div>
    </div>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
            out.println("<p class='error'>" + error + "</p>");
        }

        List<Flight> flights = (List<Flight>) request.getAttribute("flights");
        
        if (flights != null && !flights.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>Flight ID</th>
                    <th>Source City</th>
                    <th>Destination City</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Economy Fare</th>
                    <th>Business Fare</th>
                    <th>Seats Available</th>
                    <th>Book Now</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (Flight flight : flights) {
                %>
                    <tr>
                        <td><%= flight.getFlightId() %></td>
                        <td><%= flight.getSourceCity() %></td>
                        <td><%= flight.getDestinationCity() %></td>
                        <td><%= flight.getDepartureTime() %></td>
                        <td><%= flight.getArrivalTime() %></td>
                        <td><%= flight.getEconomyFare() %></td>
                        <td><%= flight.getBusinessFare() %></td>
                        <td><%= flight.getSeatsAvailable() %></td>
                        <td><a class="button" href="jsp/domestic_booking.jsp?flightId=<%= flight.getFlightId() %>&source_city=<%= flight.getSourceCity() %>&destination_city=<%= flight.getDestinationCity() %>&DepartureTime=<%= flight.getDepartureTime() %>&ArrivalTime=<%= flight.getArrivalTime() %>">Book</a></td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    <% 
        } else {
            out.println("<p>No flights available.</p>");
        }
    %>

    <div class="center-button">
        <a class="button-home" href="<%= request.getContextPath() %>/index.jsp">Back to Home</a>
    </div>

</body>
</html>
