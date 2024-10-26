package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dto.BankAccount_dto;

public class BankAccount_dao {
    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/project_1?user=root&password=root");
    }
  
    public void createBankAccountTable() throws SQLException, Exception {
        String query = "CREATE TABLE IF NOT EXISTS bankaccount (" +
                       "FullName VARCHAR(100) NOT NULL," +
                       "Email VARCHAR(100) UNIQUE," +
                       "AccountNo BIGINT PRIMARY KEY," +
                       "IFSCCode VARCHAR(20) NOT NULL," +
                       "Age INT NOT NULL," +
                       "Gender VARCHAR(8) NOT NULL," +
                       "Address VARCHAR(150) NOT NULL," +
                       "PhoneNo BIGINT(10) NOT NULL," +
                       "AadharNo BIGINT(12) NOT NULL," +
                       "AccountType VARCHAR(20) NOT NULL," +
                       "UNIQUE (PhoneNo)," +
                       "UNIQUE (AadharNo)" +
                       ")";
        
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.executeUpdate();
        }
    }

    public boolean isUserExist(long accountNumber) throws Exception {
        String query = "SELECT COUNT(*) FROM bankaccount WHERE AccountNo=?";
        
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setLong(1, accountNumber); // Set parameter for account number
            try (ResultSet res = ps.executeQuery()) {
                return res.next() && res.getInt(1) > 0;
            }
        }
    }

    public void insert(BankAccount_dto bank) throws SQLException, Exception {
        String query = "INSERT INTO bankaccount (FullName, Email, AccountNo, IFSCCode, Age, Gender, Address, PhoneNo, AadharNo, AccountType) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, bank.getFullName());
            ps.setString(2, bank.getEmail());
            ps.setLong(3, bank.getAccountNo());
            ps.setString(4, bank.getIfscCode());
            ps.setInt(5, bank.getAge());
            ps.setString(6, bank.getGender());
            ps.setString(7, bank.getAddress());
            ps.setLong(8, bank.getPhoneNumber());
            ps.setLong(9, bank.getAadharNumber());
            ps.setString(10, bank.getAccountType());
            ps.executeUpdate();
            System.out.println("User inserted successfully.");
        }
    }
}
