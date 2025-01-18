package com.bank.Servlet;

import java.io.IOException;

import com.bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Sessions")
public class Session extends HttpServlet{

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession s=req.getSession();
	Customer c=(Customer)s.getAttribute("Customer");
	if(c!=null) {
		req.setAttribute("Success", "Login Successfull!!");
		RequestDispatcher rd=req.getRequestDispatcher("App.jsp");
		rd.forward(req, resp);
	}
	else{
		req.setAttribute("Failure", "Session expired!");
		RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
		rd.forward(req, resp);	
	}
}
}
