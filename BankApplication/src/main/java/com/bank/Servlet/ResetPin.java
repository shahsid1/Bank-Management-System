package com.bank.Servlet;

import java.io.IOException;

import com.bank.DAO.CustomerDAO;
import com.bank.DAO.CustomerDAOImp;
import com.bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/ResetPin")
public class ResetPin extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String newpin=req.getParameter("newpin");
	String confirm=req.getParameter("conf");
	
	int pin=Integer.parseInt(newpin);
	int conf=Integer.parseInt(confirm);
	
	HttpSession s=req.getSession(false);
	CustomerDAO cdao=new CustomerDAOImp(s);
	Customer c=(Customer)s.getAttribute("Customer");
	if(pin==conf && c.getPin()!=pin) 
	{
		c.setPin(pin);
	
		boolean res=cdao.updateCustomer(c);
		if(res)
		{
			s.setAttribute("Customer", c);
  			req.setAttribute("Success","<h4>Pin Updation Successfull"+"</h4>");
  	        RequestDispatcher rd=req.getRequestDispatcher("ResetPin.jsp");
  	        rd.forward(req, resp);
	      
		}
	}
		else
		{
			req.setAttribute("Failure","<h3>Failed to Reset Pin</h3>");
			RequestDispatcher rd=req.getRequestDispatcher("ResetPin.jsp");
			rd.forward(req, resp);
		}
		
	
}
}
