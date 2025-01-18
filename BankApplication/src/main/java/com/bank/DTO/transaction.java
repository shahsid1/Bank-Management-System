package com.bank.DTO;

import java.sql.Date;

public class transaction {
	private Date date;
	private long acc_no;
	private String transaction;
	private double Amount;
	private long TransactionId;
	private double balance;
	private long Transaction_acc;
	public transaction(Date date, long acc_no, String transaction, double amount, long transactionId, double balance,
			long transaction_acc) {
		super();
		this.date = date;
		this.acc_no = acc_no;
		this.transaction = transaction;
		Amount = amount;
		TransactionId = transactionId;
		this.balance = balance;
		Transaction_acc = transaction_acc;
	}
	public transaction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public long getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(long acc_no) {
		this.acc_no = acc_no;
	}
	public String getTransaction() {
		return transaction;
	}
	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}
	public double getAmount() {
		return Amount;
	}
	public void setAmount(double amount) {
		Amount = amount;
	}
	public long getTransactionId() {
		return TransactionId;
	}
	public void setTransactionId(long transactionId) {
		TransactionId = transactionId;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public long getTransaction_acc() {
		return Transaction_acc;
	}
	public void setTransaction_acc(long transaction_acc) {
		Transaction_acc = transaction_acc;
	}
	
	
	
}
