package com.bank.Servlet;

import com.bank.DAO.CustomerDAO;
import com.bank.DAO.CustomerDAOImp;
import com.bank.DAO.transactionDAO;
import com.bank.DAO.transactionDAOImp;
import com.bank.DTO.Customer;
import com.bank.DTO.transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/transfer")
public class Transfer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("transfer") != null) {
            double amount = Double.parseDouble(request.getParameter("amount"));
            long receiverAccNo = Long.parseLong(request.getParameter("benf"));
            int pin = Integer.parseInt(request.getParameter("pin"));

            HttpSession session = request.getSession();
            Customer sender = (Customer) session.getAttribute("Customer");
            String resultMessage;

            if (sender != null) {
                CustomerDAO cDao = new CustomerDAOImp(session);
                transactionDAO tDao = new transactionDAOImp();

                Customer receiver = cDao.getCustomer(receiverAccNo);

                if (receiver != null) {
                    if (sender.getAccno() != receiver.getAccno() && sender.getBal() >= amount && amount > 0) {
                        if (pin == sender.getPin()) {
                            sender.setBal(sender.getBal() - amount);
                            boolean senderUpdated = cDao.updateCustomer(sender);

                            receiver.setBal(receiver.getBal() + amount);
                            boolean receiverUpdated = cDao.updateCustomer(receiver);

                            if (senderUpdated && receiverUpdated) {
                                long transactionId = Transaction_id.generateTransactionID();

                                transaction debitTransaction = new transaction();
                                debitTransaction.setTransactionId(transactionId);
                                debitTransaction.setAcc_no(sender.getAccno());
                                debitTransaction.setBalance(sender.getBal());
                                debitTransaction.setAmount(amount);
                                debitTransaction.setTransaction("Debited");
                                debitTransaction.setTransaction_acc(receiver.getAccno());

                                boolean debitTransactionRecord = tDao.insertTranscation(debitTransaction);

                                transaction creditTransaction = new transaction();
                                creditTransaction.setTransactionId(transactionId);
                                creditTransaction.setAcc_no(receiver.getAccno());
                                creditTransaction.setBalance(receiver.getBal());
                                creditTransaction.setAmount(amount);
                                creditTransaction.setTransaction("Credited");
                                creditTransaction.setTransaction_acc(sender.getAccno());

                                boolean creditTransactionRecord = tDao.insertTranscation(creditTransaction);

                                if (debitTransactionRecord && creditTransactionRecord) {
                                    resultMessage = "Transaction Completed Successfully!";
                                    request.setAttribute("Success", resultMessage);
                                } else {
                                    resultMessage = "Error in recording transactions.";
                                    request.setAttribute("Failure", resultMessage);
                                }
                            } else {
                                resultMessage = "Error in updating accounts.";
                                request.setAttribute("Failure", resultMessage);
                            }
                        } else {
                            resultMessage = "Pin Mismatch.";
                            request.setAttribute("Failure", resultMessage);
                        }
                    } else {
                        resultMessage = "Error: Invalid transaction details.";
                        request.setAttribute("Failure", resultMessage);
                    }
                } else {
                    resultMessage = "Error: Beneficiary account not found.";
                    request.setAttribute("Failure", resultMessage);
                }
            } else {
                resultMessage = "Error: Sender not authenticated.";
                request.setAttribute("Failure", resultMessage);
                // For debugging purposes, print session ID and attribute status
                System.out.println("Session ID: " + session.getId());
                System.out.println("Sender object: " + sender);
            }
        }

        request.getRequestDispatcher("Transfer.jsp").forward(request, response);
    }
}
