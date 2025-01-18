package com.bank.DAO;

import java.util.List;

import com.bank.DTO.Customer;

public interface CustomerDAO {
	
public boolean insertCustomer(Customer c);
public Customer getCustomer(long accno,int pin);
public Customer getCustomer(long phone,String mail);
public Customer getCustomer(long accno);
public Customer getInfo();
public boolean updateCustomer(Customer c);
public boolean deleteCustomer(Customer c);

}
