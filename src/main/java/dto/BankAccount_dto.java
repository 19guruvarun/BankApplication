package dto;

import java.util.Random;

public class BankAccount_dto {
    private String fullName;
    private String email;
    private long accountNo;
    private final String ifscCode = "UTIB0002345"; // Default IFSC code
    private int age;
    private String gender;
    private String address;
    private long phoneNo;
    private long aadharNumber;
    private String accountType;

    
    public BankAccount_dto(String fullName, String email, int age, String gender, String address, 
                           long phoneNo, long aadharNumber, String accountType) {
        Random random = new Random();
        this.fullName = fullName;
        this.email = email;
        this.accountNo = random.nextLong(10000000000L, 99999999999L);
        this.age = age;
        this.gender = gender;
        this.address = address;
        this.phoneNo = phoneNo;
        this.aadharNumber = aadharNumber;
        this.accountType = accountType;
    }

    // Getters and Setters
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getAccountNo() {
        return accountNo;
    }

    public String getIfscCode() {
        return ifscCode;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getPhoneNumber() {
        return phoneNo;
    }

    public void setPhoneNumber(long phoneNo) {
        this.phoneNo = phoneNo;
    }

    public long getAadharNumber() {
        return aadharNumber;
    }

    public void setAadharNumber(long aadharNumber) {
        this.aadharNumber = aadharNumber;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
}
