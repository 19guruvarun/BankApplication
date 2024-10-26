package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.UserProfile_dto;

public class User_dao {

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/project_1?user=root&password=root");
    }

    public void createUserTable() throws SQLException, Exception {
        String query = "CREATE TABLE IF NOT EXISTS user (" +
                       "FirstName VARCHAR(45)," +
                       "LastName VARCHAR(45) NOT NULL," +
                       "Email VARCHAR(45) NOT NULL," +
                       "Password VARCHAR(45) NOT NULL," +
                       "Age INT NOT NULL," +
                       "Mobile BIGINT(10)," +
                       "Gender VARCHAR(45) NOT NULL," +
                       "Address VARCHAR(100) NOT NULL," +
                       "PRIMARY KEY (Mobile)" +
                       ")";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.executeUpdate();
        }
    }

    public void insert(UserProfile_dto user) throws SQLException, Exception {
        String query = "INSERT INTO user (FirstName, LastName, Email, Password, Age, Mobile, Gender, Address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getfName());
            ps.setString(2, user.getlName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getAge());
            ps.setLong(6, user.getPhone());
            ps.setString(7, user.getGender());
            ps.setString(8, user.getAddress());
            ps.executeUpdate();
            System.out.println("User inserted successfully.");
        }
    }

    public ResultSet fetchBasedOnEmail(String email) throws SQLException, Exception {
        String query = "SELECT * FROM user WHERE email = ?";
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);
        return ps.executeQuery(); // Caller should close resources
    }

    public boolean isUserExist(String email, long phoneNo) throws Exception {
        String query = "SELECT COUNT(*) FROM user WHERE email = ? AND Mobile = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setLong(2, phoneNo);
            try (ResultSet res = ps.executeQuery()) {
                return res.next() && res.getInt(1) > 0;
            }
        }
    }


    public boolean updatePassword(String email, long phoneNo, String newPassword) {
        String query = "UPDATE user SET Password = ? WHERE email = ? AND Mobile = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.setLong(3, phoneNo);
            return ps.executeUpdate() > 0; // Returns true if at least one row was updated
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
