package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.User_dao;

@WebServlet("/resetPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User_dao userdao = new User_dao();

        try {
            String email = req.getParameter("email");
            String phoneStr = req.getParameter("phoneNo");
            String newPassword = req.getParameter("newPassword");
            String confirmPassword = req.getParameter("confirmPassword");

            // Parse phone number with error handling
            long phoneNo;
            try {
                phoneNo = Long.parseLong(phoneStr);
            } catch (NumberFormatException e) {
                req.setAttribute("message", "Invalid phone number format.");
                req.setAttribute("messageType", "error-message");
                req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
                return;
            }

            // Check if the email and phone number exist
            if (userdao.isUserExist(email, phoneNo)) {
                if (newPassword.equals(confirmPassword)) {
                    // Update the password in the database
                    boolean updateSuccess = userdao.updatePassword(email, phoneNo, newPassword);
                    if (updateSuccess) {
                        req.setAttribute("message", "Password reset successfully. You can now log in.");
                        req.setAttribute("messageType", "success-message");
                        req.getRequestDispatcher("Login.jsp").forward(req, resp);
                    } else {
                        req.setAttribute("message", "Your Entered Details are already exist. Please try again.");
                        req.setAttribute("messageType", "error-message");
                        req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
                    }
                } else {
                    req.setAttribute("message", "Passwords do not match.");
                    req.setAttribute("messageType", "error-message");
                    req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("message", "The provided email or phone number does not match our records.");
                req.setAttribute("messageType", "error-message");
                req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "An unexpected error occurred. Please try again later.");
            req.setAttribute("messageType", "error-message");
            req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
        }
    }
}
