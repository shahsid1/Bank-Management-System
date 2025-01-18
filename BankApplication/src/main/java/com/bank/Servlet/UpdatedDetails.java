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
@WebServlet("/UpdatedDetails")
public class UpdatedDetails extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
    String name = req.getParameter("name");
    String phone = req.getParameter("phone");
    String email = req.getParameter("mail");

    long phno=Long.parseLong(phone);
    HttpSession s=req.getSession(false);
    CustomerDAO cdao=new CustomerDAOImp(s);
    Customer c=(Customer)s.getAttribute("Customer");
    c.setName(name);
    c.setPhone(phno);
    c.setMail(email);
   boolean res=cdao.updateCustomer(c);
   if(res)
   {
	   s.setAttribute("Customer", c);
	   req.setAttribute("Success","<h4> Updated Successfully"+"</h4>");
	        RequestDispatcher rd=req.getRequestDispatcher("UpdateAccount.jsp");
	        rd.forward(req, resp);
	 }
       
  else
	{
		req.setAttribute("Failure","<h3>Failed to Update</h3>");
		RequestDispatcher rd=req.getRequestDispatcher("UpdateAccount.jsp");
		rd.forward(req, resp);
	}
	   
   


}
}
