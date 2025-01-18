<%@page import="com.bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.21.0/jquery.validate.min.js"></script>
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
        overflow: hidden; /* Prevent scrollbar */
    }
    .container {
        background: rgba(0, 0, 0, 0.7); /* Dark background with opacity */
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
        padding: 20px; /* Adjusted padding */
        max-width: 500px; /* Increased width */
        width: 100%;
        text-align: center;
        overflow: hidden; /* Prevent scrollbars */
    }
    h1, h2, h3 {
        color: #fff;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    input[type="text"], input[type="tel"] {
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
    .login-button {
        background-color: #1e90ff; /* Same blue color as the submit button */
        border-radius: 6px;
        text-decoration: none;
        display: inline-block;
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
    .button-container .login-button {
        margin-left: 10px;
    }
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
        .button-container {
            flex-direction: column;
        }
        .button-container .login-button {
            margin-left: 0;
            margin-top: 10px;
        }
    }
</style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
    $("#signup").validate({
        rules: {
            name: {
                required: true,
                minlength: 2
            },
            phone: {
                required: true,
                maxlength: 10,
                minlength: 10
            },
            mail: {
                required: true,
                email: true
            },
            pin: {
                required: true,
                minlength: 4
            },
            confirm: {
                required: true,
                minlength: 4,
                equalTo: "#pin"
            }
        },
        messages: {
            name: {
                required: "Please enter your username",
                minlength: "Your username must be at least 2 characters long"
            },
            phone: {
                required: "Please enter your phone number",
                maxlength: "Your phone number must be 10 digits long",
                minlength: "Your phone number must be 10 digits long"
            },
            mail: {
                required: "Please enter your email",
                email: "Please enter a valid email address"
            },
            pin: {
                required: "Please provide a pin",
                minlength: "Your pin must be at least 4 characters long"
            },
            confirm: {
                required: "Please confirm your pin",
                minlength: "Your pin must be at least 4 characters long",
                equalTo: "Pin mismatch"
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});
</script>
<div class="container">
    <form action="Signup" method="post" id="signup">
        <h1>Welcome to New Bank</h1>
        <h2>Application Form</h2>
        <% Customer c = (Customer) request.getAttribute("Customer"); %>
        <% String Success = (String) request.getAttribute("Success"); %>
        <% String Failure = (String) request.getAttribute("Failure"); %>
        <% if (Success != null && c != null) { %>
            <div style="color: #00ff00; margin-bottom: 15px;"><%= Success %></div>
        <% } %>
        <% if (Failure != null) { %>
            <div style="color: #ff4d4d; margin-bottom: 15px;"><%= Failure %></div>
        <% } %>
        <table>
            <tr>
                <td><h3>Enter your name:</h3></td>
                <td><input type="text" name="name" required="required"></td>
            </tr>
            <tr>
                <td><h3>Enter your Phone number:</h3></td>
                <td><input type="tel" name="phone" required="required"></td>
            </tr>
            <tr>
                <td><h3>Enter your Mail ID:</h3></td>
                <td><input type="text" name="mail" required="required"></td>
            </tr>
            <tr>
                <td><h3>Set a Pin:</h3></td>
                <td><input type="text" id="pin" name="pin" required="required"></td>
            </tr>
            <tr>
                <td><h3>Confirm a Pin:</h3></td>
                <td><input type="text" name="confirm" required="required"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="button-container">
                        <input type="submit" value="Signup">
                        <a href="Login.jsp" class="login-button">Login</a>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
