package com.bank.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/Login")
public class Login extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Collecting the data from the user
		String accnum=req.getParameter("accno");
		String s_pin=req.getParameter("pin");

		
		//Conversion or parsing the data
		long accno=Long.parseLong(accnum);
		int pin=Integer.parseInt(s_pin);	
		
		//JDBC Logic
		HttpSession s=req.getSession();
		PrintWriter out=resp.getWriter();
		CustomerDAO cdao=new CustomerDAOImp(s);
		Customer c=cdao.getCustomer(accno,pin);
		
		if(c!=null && c.getPin()==pin && c.getAccno()==accno )
		{
			s.setAttribute("Customer", c);
			resp.sendRedirect("Sessions");
			//s.setAttribute("Success","<h3>Login Successfull, Welcome "+c.getName() +"</h3>");
			//RequestDispatcher rd=req.getRequestDispatcher("App.jsp");
			//rd.forward(req, resp);

	    
		}
		else
		{
			req.setAttribute("Customer", c);
			//s.setAttribute("Failure","<h3>Login Failed</h3>");
			//RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			//rd.forward(req, resp);
		}
		}
}
