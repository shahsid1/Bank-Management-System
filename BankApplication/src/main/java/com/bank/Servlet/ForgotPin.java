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
@WebServlet("/ForgotPin")

public class ForgotPin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String phone=req.getParameter("phone");
		String Mail=req.getParameter("mail");
		String newpin=req.getParameter("pass");
		String newcpin=req.getParameter("confirm");
		
		long Phone=Long.parseLong(phone);
		int pin=Integer.parseInt(newpin);
		int confirmpin=Integer.parseInt(newcpin);
		HttpSession s=req.getSession(false);

		CustomerDAO cdao= new CustomerDAOImp(s);
		Customer c=cdao.getCustomer(Phone, Mail);
		if(c!=null && c.getPhone()==Phone && c.getMail().equals(Mail))
		{
		if(pin==confirmpin) {
			c.setPin(pin);
		
		boolean res = cdao.updateCustomer(c);
		if(res) {
			req.setAttribute("Customer", c);
			req.setAttribute("Success", "<h4>Pin Reset Successfull</h4>");
			RequestDispatcher rd=req.getRequestDispatcher("ForgotPin.jsp");
			rd.forward(req, resp);
		}
		}
		}
		else {
			req.setAttribute("Customer", c);
			req.setAttribute("Failure", "<h4>Failed to Reset Pin</h4>");
			RequestDispatcher rd = req.getRequestDispatcher("ForgotPin.jsp");
			rd.forward(req, resp);
		}
		
		
	}

}
