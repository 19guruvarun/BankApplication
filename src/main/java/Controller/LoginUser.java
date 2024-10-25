package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_dao;



	@WebServlet("/login")
	public class LoginUser extends HttpServlet{
			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				try {
					User_dao userdao=new User_dao();
					userdao.getConnection();
					ResultSet res=userdao.fetchBasedOnEmail(email);
					if(res.next())
					{
						if(res.getString("password").equals(password))
						{
							System.out.print("<h1 style='color:green'>Login sucessfull </h1>");
							RequestDispatcher dis=req.getRequestDispatcher("Home.jsp");
							//req.setAttribute("user",new UserProfile_dto(req.getParameter("firstName"),String lname, String email, String password,long phone,int age, String gender,String address));	
							dis.forward(req, resp);
						}
						else
						{
							System.out.print("<h1 style='color:red'>Password is incorrect</h1>");
							req.setAttribute("pass_invalid", "Password is Invalid");
							RequestDispatcher dispatcher=req.getRequestDispatcher("Login.jsp");
							dispatcher.include(req, resp);
						}
					}
					else
					{
						System.out.print("<h1 style='color:red'>Eamil is incorrect</h1>");
						req.setAttribute("email_invalid", "Email is Invalid");
						RequestDispatcher dispatcher=req.getRequestDispatcher("Login.jsp");
						dispatcher.include(req, resp);
					}
				} catch (Exception  e) {
					e.printStackTrace();
				}
			}
	}

