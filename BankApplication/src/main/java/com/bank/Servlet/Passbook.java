package com.bank.Servlet;

import com.bank.DAO.transactionDAO;
import com.bank.DAO.transactionDAOImp;
import com.bank.DTO.Customer;
import com.bank.DTO.transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/passbook")
public class Passbook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session and retrieve the customer object
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("Customer");

        if (customer != null) {
            // Fetch transaction history
            transactionDAO tDao = new transactionDAOImp();
            List<transaction> transactionList = tDao.getTranscationList(customer.getAccno());

            // Set transactions list as request attribute
            request.setAttribute("transactions", transactionList);

            // Forward to JSP page
            request.getRequestDispatcher("Passbook.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login.jsp"); // Redirect to login if no customer in session
        }
    }
}
