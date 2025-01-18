package com.bank.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

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
@WebServlet("/deposit")
public class Deposit extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bal=req.getParameter("amount");
		String pin=req.getParameter("pin");
		
		double bal1=Double.parseDouble(bal);
		int pin1=Integer.parseInt(pin);

		HttpSession s=req.getSession(false);
	    CustomerDAO cdao=new CustomerDAOImp(s);
	    Customer c=(Customer)s.getAttribute("Customer");
        PrintWriter out=resp.getWriter();
	    c.setBal(c.getBal()+bal1);
	    boolean res=cdao.updateCustomer(c);
	  
	  if(res && pin1==c.getPin())
	  {
		s.setAttribute("Customer", c);
		req.setAttribute("Success","<h4> Amount Rs."+bal1+" Deposited Succesfully. Your Balance after deposit is "+c.getBal()+"</h4>");
        RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
        rd.forward(req, resp);
	
      
	}
	else
	{
//		req.setAttribute("Customer", c);
		req.setAttribute("Failure","<h3>Failed to Deposit Amount</h3>");
		RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
		rd.forward(req, resp);
	}
	} 
	}


