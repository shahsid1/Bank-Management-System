package com.bank.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.bank.Connector.Connector;
import com.bank.DTO.Customer;

import jakarta.servlet.http.HttpSession;

public class CustomerDAOImp implements CustomerDAO {
   
	private Connection con;
	HttpSession session;
	public CustomerDAOImp(HttpSession se) {
		this.con=Connector.requestConnection();
		session=se;
	}
	
	
	@Override
	public boolean insertCustomer(Customer c) {
		PreparedStatement ps;
		int res=0;
		String query="INSERT INTO CUSTOMER(NAME,PHONE,MAIL,PIN)VALUES(?,?,?,?)";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,c.getName());
			ps.setLong(2,c.getPhone());
			ps.setString(3, c.getMail());
			ps.setInt(4,c.getPin());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0)
		{
			return true;
		}
		else {
		return false;
		}
	}

	
	
	@Override
	public Customer getCustomer(long accno, int pin) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE ACC_NO=? AND PIN=?";
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1,accno);
			ps.setInt(2, pin);
			rs=ps.executeQuery();
			if(rs.next())
			{
				c=new Customer();
				c.setAccno(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
			    c.setMail(rs.getString(4));
				c.setBal(rs.getDouble(5));
				c.setPin(rs.getInt(6));
				session.setAttribute("uname",rs.getString(2));
				session.setAttribute("phno", rs.getString(3));
				session.setAttribute("mail", rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}

	@Override
	public Customer getCustomer(long phone, String mail) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE PHONE=? OR MAIL=?";
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			rs=ps.executeQuery();
			if(rs.next())
			{
				 
				c=new Customer();
				c.setAccno(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
			    c.setMail(rs.getString(4));
				c.setBal(rs.getDouble(5));
				c.setPin(rs.getInt(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public Customer getCustomer(long accno) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE ACC_NO=?";
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, accno);
			rs=ps.executeQuery();
			if(rs.next())
			{
				 
				c=new Customer();
				c.setAccno(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
			    c.setMail(rs.getString(4));
				c.setBal(rs.getDouble(5));
				c.setPin(rs.getInt(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	
	@Override
	public Customer getInfo() {
		Statement st=null;
		ResultSet rs=null;
		Customer c=null;
		
		try {
			st=con.createStatement();
			rs=st.executeQuery("SELECT * FROM CUSTOMER WHERE MAIL ='"+session.getAttribute("mail")+"';");
			boolean b=rs.next();
			if(b==true)
			{
				 c= new Customer();
				 c.setName(rs.getString("name"));
				 c.setPhone(rs.getLong("phone"));
				 c.setMail(rs.getString("mail"));
			}
			else {
				c=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
		
	}

	

	@Override
	public boolean updateCustomer(Customer c) {
		PreparedStatement ps=null;
		int res=0;
		String query="UPDATE CUSTOMER SET NAME=?,PHONE=?,MAIL=?,BALANCE=?,PIN=? WHERE ACC_NO=?";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1,c.getName());
			ps.setLong(2,c.getPhone());
			ps.setString(3, c.getMail());
			ps.setDouble(4,c.getBal());
			ps.setInt(5, c.getPin());
			ps.setLong(6, c.getAccno());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
		}
	}

	@Override
	public boolean deleteCustomer(Customer c) {
		return false;
	}

}
