package com.bank.DAO;

import java.util.List;

import com.bank.DTO.transaction;

public interface transactionDAO {
	public boolean insertTranscation(transaction t);
	public List<transaction> getTranscationList(long accno);
}
