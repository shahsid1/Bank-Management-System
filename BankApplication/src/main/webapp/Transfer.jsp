<%@page import="com.bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Page</title>
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
 background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url("https://www.abbank.vn/uploads/images/2020/09/11/online-banking-1440x550.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
                margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        width: 100%;
        max-width: 400px;
        padding: 20px;
        background: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        box-sizing: border-box;
        text-align: center;
    }

    h3 {
        color: #333;
        font-size: 1.2em;
        font-weight: 600;
        margin-bottom: 15px;
        letter-spacing: 0.5px;
    }

    input[type="number"] {
        width: calc(100% - 22px);
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    button {
        background-color: #007BFF;
        color: #ffffff;
        border: none;
        padding: 12px 20px;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    button:active {
        background-color: #004494;
    }

    .button-link {
        display: inline-block;
        background-color: #007BFF;
        color: #ffffff;
        text-decoration: none;
        padding: 12px 20px;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        margin-top: 20px;
    }

    .button-link:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .button-link:active {
        background-color: #004494;
    }

    .message {
        color: #d9534f; /* Red for failure */
        font-weight: bold;
        margin-bottom: 20px;
    }

    .message.success {
        color: #5bc0de; /* Blue for success */
    }
</style>
</head>
<body>
<% 
    Customer c = (Customer) session.getAttribute("Customer");
    String success = (String) request.getAttribute("Success");
    String failure = (String) request.getAttribute("Failure");
%>

<div class="form-container">
    <% if (success != null) { %>
        <div class="message success"><%= success %></div>
    <% } %>
    <% if (failure != null) { %>
        <div class="message"><%= failure %></div>
    <% } %>

    <form action="transfer" method="post">
        <div>
            <h3>Enter the Amount to be Transferred:</h3>
            <input type="number" name="amount" required>
        </div>
        <div>
            <h3>Enter the Beneficiary's Account Number:</h3>
            <input type="number" name="benf" required>
        </div>
        <div>
            <h3>Enter the Pin:</h3>
            <input type="number" name="pin" required>
        </div>
        <button type="submit" name="transfer">Transfer</button>
        <br>
        <a href="App.jsp" class="button-link">Back to Home</a>
    </form>
</div>
</body>
</html>
