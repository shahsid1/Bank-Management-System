package com.bank.Servlet;

import java.util.Random;

public class Transaction_id {
	public static long generateTransactionID() {
        Random rd = new Random();
        // Generate a random number up to 15 digits
        long id = Math.abs(rd.nextLong() % 1000000000000000L); // Ensures 15-digit length
        
        // In case the generated number is shorter than 15 digits
        while (String.valueOf(id).length() < 15) {
            id = id * 10 + rd.nextInt(10); // Append random digits to make it 15 digits
        }
        
        return id;
    }
}
