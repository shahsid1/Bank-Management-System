<%@page import="com.bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url("https://www.abbank.vn/uploads/images/2020/09/11/online-banking-1440x550.jpg") no-repeat center center fixed;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    color: #e0e0e0;
  }

  .container {
    background: rgba(0, 0, 0, 0.7); /* Dark background with opacity */
    border-radius: 12px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
    padding: 40px;
    max-width: 500px;
    width: 100%;
    text-align: center;
    position: relative;
  }

  h2 {
    color: #fff;
    margin-bottom: 20px;
    font-size: 24px;
  }

  h3 {
    color: #ccc;
    margin: 10px 0;
  }

  input[type="tel"], input[type="number"] {
    padding: 12px;
    margin: 10px 0;
    width: calc(100% - 24px);
    border: 1px solid #444;
    border-radius: 6px;
    background: #333;
    color: #fff;
    font-size: 16px;
  }

  input[type="submit"], .login-button {
    padding: 12px 24px;
    background-color: #1e90ff; /* Bright blue color */
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
    font-size: 16px;
    font-weight: bold;
  }

  input[type="submit"]:hover, .login-button:hover {
    background-color: #1c86ee; /* Slightly darker blue */
    transform: scale(1.05);
  }

  input[type="submit"]:active, .login-button:active {
    background-color: #187bcd; /* Even darker blue */
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  td {
    padding: 12px;
    vertical-align: middle;
  }

  .button-container {
    display: flex;
    justify-content: center;
    gap: 10px;
  }

  .button-container-right {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
    width: 100%;
    gap: 20px; /* Adjust gap between elements */
    font-size: 14px; /* Adjust font size for alignment */
  }

  .button-container-right .forgot-pin,
  .button-container-right .signup {
    flex: 1; /* Allow divs to take equal width */
  }

  .button-container-right a {
    color: #1e90ff;
    text-decoration: none;
    font-weight: bold;
  }

  .button-container-right a:hover {
    text-decoration: underline;
  }

  /* Responsive design adjustments */
  @media (max-width: 600px) {
    .container {
      padding: 20px;
      width: 90%;
    }
    
    input[type="submit"], .login-button {
      padding: 10px 20px;
      font-size: 14px;
    }
    
    table {
      font-size: 14px;
    }

    .button-container-right {
      flex-direction: column;
      align-items: flex-start;
      font-size: 12px; 
    }

    .button-container-right .signup {
      margin-top: 10px;
    }
  }
</style>
</head>
<body>
 <% Customer c = (Customer) request.getAttribute("Customer"); %>
        <% String Success = (String) request.getAttribute("Success"); %>
        <% String Failure = (String) request.getAttribute("Failure"); %>
<div class="container">
    <form action="Login" method="post">
        <h2>Login Form</h2>
       
        <% if (Success != null && c != null) { %>
            <div style="color: #00ff00; margin-bottom: 15px;"><%= Success %></div>
        <% } %>
        <% if (Failure != null) { %>
            <div style="color: #ff4d4d; margin-bottom: 15px;"><%= Failure %></div>
        <% } %>
        <table>
            <tr>
                <td><h3>Account Number:</h3></td>
                <td><input type="tel" name="accno" required="required"></td>
            </tr>
            <tr>
                <td><h3>PIN:</h3></td>
                <td><input type="number" name="pin" required="required"></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <button type="submit" class="login-button">Login</button>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="button-container-right">
                    <div class="forgot-pin">Forgot PIN? <a href="ForgotPin.jsp">Reset PIN</a></div>
                    <div class="signup">Don't have an Account? <a href="Signup.jsp">Signup</a></div>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
