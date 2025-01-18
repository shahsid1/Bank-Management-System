
<%@page import="com.bank.DAO.CustomerDAOImp"%>
<%@page import="com.bank.DAO.CustomerDAO"%>
<%@page import="com.bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Account</title>
<style type="text/css">
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url("https://www.abbank.vn/uploads/images/2020/09/11/online-banking-1440x550.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;       
         margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        height: 100vh;
        color: #333;
    }

    .form-container {
        width: 100%;
        max-width: 900px;
        padding: 20px;
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        margin-top: 30px;
        box-sizing: border-box;
        text-align: center;
        overflow-x: auto;
    }

    h1 {
        font-size: 28px;
        color: #333;
        margin-bottom: 30px;
        font-weight: 700;
        border-bottom: 2px solid #007BFF;
        display: inline-block;
        padding-bottom: 10px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 30px;
    }

    th, td {
        padding: 18px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        font-size: 16px;
    }

    th {
        background-color: #007BFF;
        color: #ffffff;
        text-transform: uppercase;
        font-weight: 700;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #e1e5ea;
    }

    .button-link {
        display: inline-block;
        background-color: #007BFF;
        color: #ffffff;
        text-decoration: none;
        padding: 12px 24px;
        font-size: 18px;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        margin-top: 20px;
        margin-left:450px;
    }

    .button-link:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .button-link:active {
        background-color: #004494;
    }

    .message {
        margin: 20px 0;
        padding: 15px;
        font-size: 16px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }

    .failure {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }

    .EditForm {
        margin-top: 40px;
        text-align: left;
        background: #f1f3f5;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .EditForm h2 {
        font-size: 22px;
        margin-bottom: 20px;
        font-weight: 700;
        color: #333;
    }

    .EditForm label {
        display: block;
        font-weight: 500;
        margin-bottom: 8px;
        font-size: 14px;
        color: #555;
    }

    .EditForm input[type="text"],
    .EditForm input[type="tel"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box;
        font-size: 16px;
    }

    .EditForm button {
        display: inline-block;
        background-color: #007BFF;
        color: #ffffff;
        text-decoration: none;
        padding: 12px 24px;
        font-size: 18px;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        margin-top: 10px;
        border: none;
    }

    .EditForm button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .EditForm button:active {
        background-color: #004494;
    }
</style>
</head>
<body>
  <% if (session.getAttribute("uname") != null) {
        CustomerDAO reg = new CustomerDAOImp(session);
        Customer c1 = reg.getInfo(); %>
<div class="form-container">
    <% 
        Customer c = (Customer) session.getAttribute("Customer");
        String userName = (c != null) ? c.getName() : "Customer"; 
    %>

    <h1><%= userName %> - Your Details</h1>

    <form action="UpdateAccount" method="post">
    <% 
    String Success = (String) request.getAttribute("Success");
    String Failure = (String) request.getAttribute("Failure");
%>
<% if (Success != null) { %>
    <div class="success"><%= Success %></div>
<% } %>
<% if (Failure != null) { %>
    <div class="failure"><%= Failure %></div>
<% } %>

        <table>
            <tr>
                <th>Account Number</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email ID</th>
                <th>Balance</th>
            </tr>
            <% if (c != null) { %>
                <tr>
                    <td><%= c.getAccno() %></td>
                    <td><%= c.getName() %></td>
                    <td><%= c.getPhone() %></td>
                    <td><%= c.getMail() %></td>
                    <td><%= c.getBal() %></td>
                </tr>
            <% } else { %>
                <tr>
                    <td colspan="5">No Customer found</td>
                </tr>
            <% } %>
        </table>
       
       
    </form>
    
    <div class="EditForm" id="EditForm">
    <h2>Edit Your Details</h2>
    <form action="UpdatedDetails" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%=c1.getName() %>">
    <label for="phone">Phone Number:</label>
    <input type="tel" id="phone" name="phone" value="<%=c1.getPhone() %>" >
    <label for="mail">Email ID:</label>
    <input type="text" id="mail" name="mail" value="<%=c1.getMail() %>">
      <button type="submit">Save Changes</button>
     <a href="App.jsp" class="button-link">Back to Home</a>
    </form>
        
    </div>

</div>
<script type="text/javascript">
    function showEditForm() {
        document.getElementById('EditForm').style.display = 'block';
    }
</script>
 <%} %>
</body>
</html>
