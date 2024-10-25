package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_dao;
@WebServlet("/resetPassword")
public class ForgotPassword extends HttpServlet{
	 @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        User_dao userdao = new User_dao();
	        
	        try {
	            String email = req.getParameter("email");
	            long phoneNo = Long.parseLong(req.getParameter("phoneNo"));
	            String newPassword = req.getParameter("newPassword");
	            String confirmPassword = req.getParameter("confirmPassword");

	            // Check if the email and phone number exist
	            if (userdao.isUserExist(email, phoneNo)) {
	                if (newPassword.equals(confirmPassword)) {
	                    // Update the password in the database
	                    userdao.updatePassword(email, newPassword);
	                    req.setAttribute("message", "Password reset successfully. You can now log in.");
	                    req.setAttribute("messageType", "success-message"); // Class for success message
	                    req.getRequestDispatcher("Login.jsp").forward(req, resp);
	                } else {
	                    req.setAttribute("message", "Passwords do not match.");
	                    req.setAttribute("messageType", "error-message"); // Class for error message
	                    req.getRequestDispatcher("forgot_password.jsp").forward(req, resp);
	                }
	            } else {
	                req.setAttribute("message", "Email or phone number does not exist.");
	                req.setAttribute("messageType", "error-message"); // Class for error message
	                req.getRequestDispatcher("forgot_password.jsp").forward(req, resp);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            req.setAttribute("message", "An error occurred. Please try again.");
	            req.setAttribute("messageType", "error-message"); // Class for error message
	            req.getRequestDispatcher("forgot_password.jsp").forward(req, resp);
	        }
	    }
}
