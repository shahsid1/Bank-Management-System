<%@page import="com.bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Pin</title>
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
 background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url("https://www.abbank.vn/uploads/images/2020/09/11/online-banking-1440x550.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;        margin: 0;
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
        font-size: 1em;
        font-weight: 600;
        margin: 0;
        letter-spacing: 0.5px;
    }

    input[type="number"], input[type="text"], input[type="tel"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
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
        margin-top: 20px;
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
        text-align: center;
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

    .form-container table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
    }

    .form-container td {
        padding: 10px;
    }
</style>
</head>
<body>
    <div class="form-container">
        <form action="ForgotPin" method="post">
            <% 
                Customer c = (Customer)request.getAttribute("Customer");
                String Success = (String)request.getAttribute("Success");
                String Failure = (String)request.getAttribute("Failure");
            %>
            <% if (Success != null && c != null) { %>
                <div class="message success"><%= Success %></div>
            <% } %>
            <% if (Failure != null) { %>
                <div class="message failure"><%= Failure %></div>
            <% } %>
            <table>
                <tr>
                    <td><h3>Enter the Phone Number:</h3></td>
                    <td><input type="number" name="phone" required="required"></td>
                </tr>
                <tr>
                    <td><h3>Enter the Mail ID:</h3></td>
                    <td><input type="text" name="mail" required="required"></td>
                </tr>
                <tr>
                    <td><h3>Enter the New Password:</h3></td>
                    <td><input type="tel" name="pass" required="required"></td>
                </tr>
                <tr>
                    <td><h3>Confirm the New Password:</h3></td>
                    <td><input type="tel" name="confirm" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit">Submit</button></td>
                </tr>
            </table>
            <a href="Login.jsp" class="button-link">Back to Login Form</a>
        </form>
    </div>
</body>
</html>
