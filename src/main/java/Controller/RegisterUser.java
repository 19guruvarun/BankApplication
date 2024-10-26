package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

import dao.User_dao;
import dto.UserProfile_dto;

@WebServlet("/signup")
public class RegisterUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User_dao userdao = new User_dao();
        
        try {
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            long phoneNo = Long.parseLong(req.getParameter("phoneNo"));
            int age = Integer.parseInt(req.getParameter("age"));
            String gender = req.getParameter("gender");
            String address = req.getParameter("address");

            // Check if user already exists
            if (userdao.isUserExist(email, phoneNo)) {
                req.setAttribute("errorMessage", "Email or phone number already exists.");
                req.getRequestDispatcher("Register.jsp").forward(req, resp); 
            } else {
                try {
                    UserProfile_dto user = new UserProfile_dto(firstName, lastName, email, password, phoneNo, age, gender, address);
                    userdao.insert(user);
                    resp.sendRedirect("Login.jsp"); 
                } catch (SQLException e) {
                    if (e.getMessage().contains("Duplicate entry")) {
                        req.setAttribute("errorMessage", "Phone number already exists. Please use a different number.");
                        req.getRequestDispatcher("Register.jsp").include(req, resp);
                    } else {
                        e.printStackTrace();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
