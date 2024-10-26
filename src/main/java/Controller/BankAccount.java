package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BankAccount_dao;
import dto.BankAccount_dto;
import dto.UserProfile_dto;

@WebServlet("/createAccount")
public class BankAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    	String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        int age = Integer.parseInt(req.getParameter("age"));
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        long phoneNumber = Long.parseLong(req.getParameter("phoneNo"));
        long aadharNumber = Long.parseLong(req.getParameter("aadharNumber"));
        String accountType = req.getParameter("accountType");

        BankAccount_dto bankAccount = new BankAccount_dto(fullName, email, age, gender, address, phoneNumber, aadharNumber, accountType);
        BankAccount_dao bank =new BankAccount_dao();
        try {
        	if (bank.isUserExist(bankAccount.getAccountNo())) {
                req.setAttribute("errorMessage", "Email or phone number already exists.");
                req.getRequestDispatcher("BankAccount.jsp").forward(req, resp); 
            } 
        	else {
                try {
                    bank.insert(bankAccount);
                    resp.sendRedirect("BankAccount.jsp"); 
                } catch (Exception e) {
                    if (e.getMessage().contains("Duplicate entry")) {
                        req.setAttribute("errorMessage", "Phone number already exists. Please use a different number.");
                        req.getRequestDispatcher("BankAccount.jsp").include(req, resp);
                    } else {
                        e.printStackTrace();
                    }
                }
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//        System.out.println("Full Name: " + bankAccount.getFullName());
//        System.out.println("Email: " + bankAccount.getEmail());
//        System.out.println("Account Number: " + bankAccount.getAccountNo());
//        System.out.println("IFSC Code: " + bankAccount.getIfscCode());
//        System.out.println("Age: " + bankAccount.getAge());
//        System.out.println("Gender: " + bankAccount.getGender());
//        System.out.println("Address: " + bankAccount.getAddress());
//        System.out.println("Phone Number: " + bankAccount.getPhoneNumber());
//        System.out.println("Aadhar Number: " + bankAccount.getAadharNumber());
//        System.out.println("Account Type: " + bankAccount.getAccountType());
  
    }
}
