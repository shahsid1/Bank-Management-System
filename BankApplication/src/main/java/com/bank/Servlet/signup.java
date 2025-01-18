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
@WebServlet("/Signup")

public class signup extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Collecting the data from the user
		String name=req.getParameter("name");
		String mobile=req.getParameter("phone");
		String mail=req.getParameter("mail");
		String s_pin=req.getParameter("pin");
		String c_pin=req.getParameter("confirm");
		
		//Conversion or parsing the data
		long phone=Long.parseLong(mobile);
		int pin=Integer.parseInt(s_pin);
		int confirm=Integer.parseInt(c_pin);	
		
		//JDBC Logic
		Customer c=new Customer();
		HttpSession s=req.getSession(false);

		CustomerDAO cdao=new CustomerDAOImp(s);
	    //PrintWriter out=resp.getWriter();
		c.setName(name);
		c.setPhone(phone);
		c.setMail(mail);
		if(pin==confirm)
		{
		c.setPin(pin);
		}
		boolean res=cdao.insertCustomer(c);
		//RequestDispatcher is an interface which is present in jakarta.servlet package
		//RequestDispatcher rd=req.getRequestDispatcher(String resourse_nam);
				//->forward(req,resp)
				//->include(req,resp)
		
		if(res)
		{
			 c=cdao.getCustomer(phone,mail);
			req.setAttribute("Customer", c);
			req.setAttribute("Success", "<h5> Account Created Succefully. Your Account number is</h5>"+c.getAccno());
			RequestDispatcher rd=req.getRequestDispatcher("Signup.jsp"); 
			rd.forward(req, resp);
			
//			 c=cdao.getCustomer(phone, mail);
//			out.println("<h1>Hi "+name+", Your account has been created </h1>");
//			out.println("<h2>Your account number is: "+c.getAccno()+"</h2>");
		}
		else {
			req.setAttribute("Customer", c);
			req.setAttribute("Failure", "<h5>Failed to Create a Account</h5>");
			RequestDispatcher rd=req.getRequestDispatcher("Signup.jsp"); 
			rd.forward(req, resp);
//			out.println("<h1>Failed to create a account. Try again</h1>");
		}
		}
	}

