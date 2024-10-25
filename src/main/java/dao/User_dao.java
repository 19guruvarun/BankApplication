package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.UserProfile_dto;

public class User_dao {
    
    public  Connection getConnection() throws Exception
    {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/project_1?user=root&password=root");
    }
    
    public void createUserTable() throws SQLException, Exception
    {
    	PreparedStatement ps=getConnection().prepareStatement("Create table if not exist user (FirstName varchar(45),"
    			+ "LastName varchar(45) Not null,"
    			+ "Email varchar(45) Not null,"
    			+"Password varchar(45)  Not null,"
    			+ "Age int  Not null,"
    			+ "Mobile Bigint(10),"
    			+ "Gender varchar(45)  Not null,"
    			+ "Address varchar(100)  Not null,"
    			+ "Primary Key (Mobile);");
    }
    public void insert(UserProfile_dto user) throws SQLException, Exception
    {
    	
    	PreparedStatement ps=getConnection().prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");
    	ps.setString(1, user.getfName());
		ps.setString(2, user.getlName());
		ps.setString(3, user.getEmail());
		ps.setString(4,user.getPassword());
		ps.setInt(5,user.getAge());
		ps.setLong(6,user.getPhone());
		ps.setString(7,user.getGender());
		ps.setString(8,user.getAddress());
		ps.execute();
		System.out.println("done");
    }
    public ResultSet fetchBasedOnEmail(String email) throws SQLException, Exception
    {
    	PreparedStatement ps=getConnection().prepareStatement("select * from user where email=?");
    	ps.setString(1, email);
    	
    	return ps.executeQuery();
    }
    public boolean isUserExist(String email, long phoneNo) throws Exception {
        String query = "SELECT COUNT(*) FROM user WHERE email = ? OR Mobile = ?";
        		Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setLong(2, phoneNo);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                return res.getInt(1) > 0; 
            }
        return false;
    }
	public boolean updatePassword(String email, String phoneNo) {
        String query = "update user set password=? where email=? and Mobile=?";
        Connection con;
		try {
			con = getConnection();
			 PreparedStatement ps = con.prepareStatement(query);
			 ps.execute();
			 int mod=ps.executeUpdate();
			 if(mod>0)
			 {
				 return true;
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

		
	}

}
