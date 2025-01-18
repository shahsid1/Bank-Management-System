<%@page import="com.bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Balance</title>
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

    h2, h3 {
        color: #333;
        font-size: 1.2em;
        font-weight: 600;
        margin-bottom: 15px;
        letter-spacing: 0.5px;
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
        margin-bottom: 20px;
        font-size: 1em;
        font-weight: 600;
    }

    .success {
        color: #28a745;
    }

    .failure {
        color: #dc3545;
    }
</style>
</head>
<body>
    <div class="form-container">
        <form action="CheckBalance" method="post">
           <% 
           Customer c = (Customer)session.getAttribute("Customer"); %>
           <h2>Account Balance for <%= c.getAccno() %></h2>
           <h3>Your Balance is <%= c.getBal() %></h3>
  
            <a href="App.jsp" class="button-link">Back to Home</a>
        </form>
    </div>
</body>
</html>
