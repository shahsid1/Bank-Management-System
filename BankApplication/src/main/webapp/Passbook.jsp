<%@page import="com.bank.DTO.Customer"%>
<%@page import="com.bank.DTO.transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.DAO.transactionDAOImp"%>
<%@page import="com.bank.DAO.transactionDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Passbook</title>
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
        max-width: 80%;
        width: 100%;
        text-align: center;
        position: relative;
    }
    h1 {
        color: #fff;
        margin-bottom: 20px;
        font-size: 36px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: rgba(255, 255, 255, 0.95);
        border-radius: 12px;
        overflow: hidden;
    }
    th {
        background: linear-gradient(135deg, #1e90ff, #1c86ee);
        color: #fff;
        font-size: 1.2em;
        font-weight: 600;
        padding: 15px;
        text-align: center;
        border-bottom: 2px solid #187bcd;
    }
    td {
        background-color: #333;
        color: #e0e0e0;
        border-bottom: 1px solid #444;
        padding: 15px;
    }
    th, td {
        text-align: left;
    }
    tr:nth-child(even) {
        background-color: #444;
    }
    tr:hover {
        background-color: #555;
        transition: background-color 0.3s ease;
    }
    .button-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .button-container button {
        background-color: #1e90ff; 
        color: white; 
        border: none; 
        padding: 12px 24px; 
        text-align: center;
        text-decoration: none;
        display: inline-block; 
        font-size: 16px; 
        margin: 4px 2px;
        cursor: pointer; 
        border-radius: 6px;
        transition: background-color 0.3s ease, box-shadow 0.3s ease; 
    }
    .button-container button:hover {
        background-color: #1c86ee; 
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
    }
</style>
</head>
<body>
<div class="container">
    <h1>Transaction List</h1>

    <% 
        // Fetch Customer object from session
        Customer c = (Customer) session.getAttribute("Customer");

        if (c != null) {
            transactionDAO tDao = new transactionDAOImp();
            List<transaction> list = tDao.getTranscationList(c.getAccno());

            if (list != null && !list.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Date</th>
            <th>Transaction ID</th>
            <th>Account Number</th>
            <th>Transaction Account Number</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Balance</th>
        </tr>
        <% 
            for (transaction t : list) { 
        %>
        <tr>
            <td><%= t.getDate() %></td>
            <td><%= t.getTransactionId() %></td>
            <td><%= t.getAcc_no() %></td>
            <td><%= t.getTransaction_acc() %></td>
            <td><%= t.getTransaction() %></td>
            <td><%= t.getTransaction().equals("Credited") ? "+" + t.getAmount() : "-" + t.getAmount() %></td>
            <td><%= t.getBalance() %></td>
        </tr>
        <% 
            } 
        %>
    </table>
    <% 
        } else { 
    %>
    <p>No transactions found for this customer.</p>
    <% 
        }
    } else { 
    %>
    <p>Customer information is not available.</p>
    <% 
    } 
    %>

    <div class="button-container">
        <button type="button" onclick="window.location.href='App.jsp';">Back to Main Page</button>
    </div>
    
</div>
</body>
</html>
