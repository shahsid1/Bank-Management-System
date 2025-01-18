<%@page import="com.bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application</title>
<style type="text/css">
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url("https://www.abbank.vn/uploads/images/2020/09/11/online-banking-1440x550.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #fff;
    }
    
    .container {
        width: 100%;
        max-width: 990px;
        height: auto;
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        padding: 20px;
        box-sizing: border-box;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    
    h1, h2 {
        color: #333;
        margin-bottom: 20px;
    }
    
    .button-link {
        display: inline-block;
        background-color: #007BFF;
        color: #ffffff;
        text-decoration: none;
        padding: 12px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
        margin-top: 20px;
    }
    
    .button-link:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }
    
    .button-link:active {
        background-color: #004080;
    }
</style>
</head>
<body>
    <div class="container">
        <% Customer c = (Customer) session.getAttribute("Customer"); %>
        <h1>Welcome, <%= c.getName() %></h1>
        <a href="CheckBalance.jsp" class="button-link">Check Balance</a>
        <a href="deposit.jsp" class="button-link">Deposit</a>
        <a href="Transfer.jsp" class="button-link">Transfer Amount</a>
        <a href="UpdateAccount.jsp" class="button-link">Update Account</a>
        <a href="Passbook.jsp" class="button-link">Passbook</a>
        <a href="ResetPin.jsp" class="button-link">Reset Pin</a>
        <form action="logout" method="post">
           <a href="Login.jsp" class="button-link">Logout</a>
        </form>
    </div>
</body>
</html>
