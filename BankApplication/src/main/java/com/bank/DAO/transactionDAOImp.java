package com.bank.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bank.Connector.Connector;
import com.bank.DTO.transaction;


public class transactionDAOImp implements transactionDAO {
	Connection con=null;
	public transactionDAOImp() {
		con = Connector.requestConnection();
	}

	@Override
	public boolean insertTranscation(transaction t) {
		PreparedStatement ps= null;
		 int res=0;
		 
		 try {
			ps = con.prepareStatement("insert into passbook1(Transaction_id,user_acc_no,date,amount,balance,transaction_acc,transaction_type) values(?,?,sysdate(),?,?,?,?);");
			ps.setLong(1, t.getTransactionId());
			ps.setLong(2, t.getAcc_no());
			ps.setDouble(3,t.getAmount());
			ps.setDouble(4, t.getBalance());
			ps.setLong(5, t.getTransaction_acc());
			ps.setString(6,t.getTransaction());
			
			res = ps.executeUpdate();
			if (res>0) {
				return true;
				
				
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<transaction> getTranscationList(long accno) {
List<transaction> list = new ArrayList<>();
		transaction t=null;
		
		ResultSet rs=null;
		String query="select * from passbook1 where user_acc_no="+accno+";";
		
		try {
			Statement st= con.createStatement();
			
			
			rs=st.executeQuery(query);
			
			
			while(rs.next()) {
				 t=new transaction();
				t.setAcc_no(rs.getLong(2));
				t.setTransactionId(rs.getLong(1));
				t.setDate(rs.getDate(3));
				t.setAmount(rs.getDouble(4));
				t.setBalance(rs.getDouble(5));
				t.setTransaction_acc(rs.getLong(6));
				t.setTransaction(rs.getString(7));
				
				list.add(t);
				
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	}


