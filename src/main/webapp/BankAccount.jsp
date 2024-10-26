<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Bank Account</title>
</head>
<style>
    body {
        font-family: 'Lucida Sans', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        background-color: #e6f7f7;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    .form-container {
        width: 400px;
        background-color: #fff;
        box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        border-radius: 10px;
        padding: 30px;
        box-sizing: border-box;
        margin-top: 8%;
    }

    .form-title {
        text-align: center;
        font-size: 28px;
        font-weight: 800;
        color: #005555;
        margin-bottom: 20px;
    }

    .form {
        display: flex;
        flex-direction: column;
        gap: 18px;
    }

    .input, .select, .textarea {
        border-radius: 20px;
        border: 1px solid #c0c0c0;
        padding: 12px 15px;
        font-size: 14px;
        outline: none;
        width: 100%;
        box-sizing: border-box;
    }

    .form-btn {
        padding: 12px;
        font-size: 16px;
        font-weight: bold;
        color: white;
        background-color: teal;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        transition: background-color 0.3s;
    }

    .form-btn:hover {
        background-color: #007777;
    }

    .error-message {
        color: red;
        font-size: 12px;
    }
</style>
<body>
    <div class="form-container">
        <p class="form-title">Create Bank Account</p>
        <form class="form" action="createAccount" method="post" onsubmit="return validateForm()">
            <input type="text" class="input" placeholder="Full Name" name="fullName" id="fullName">
            <span id="fullNameError" class="error-message"></span>
            
            <input type="email" class="input" placeholder="Email" name="email" id="email">
            <span id="emailError" class="error-message"></span>

            <input type="number" class="input" placeholder="Age" name="age" id="age">
            <span id="ageError" class="error-message"></span>

            <select class="select" name="gender" id="gender">
                <option value="" disabled selected>Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <span id="genderError" class="error-message"></span>

            <textarea class="textarea" placeholder="Address" name="address" id="address" rows="3"></textarea>
            <span id="addressError" class="error-message"></span>
            
            <input type="tel" class="input" placeholder="Phone Number" name="phoneNo" id="phone">
            <span id="phoneError" class="error-message"></span>

            <input type="text" class="input" placeholder="Aadhar Number" name="aadharNumber" id="aadharNumber">
            <span id="aadharError" class="error-message"></span>

            <select class="select" name="accountType" id="accountType">
                <option value="" disabled selected>Select Account Type</option>
                <option value="savings">Savings</option>
                <option value="current">Current</option>
            </select>
            <span id="accountTypeError" class="error-message"></span>

            <button class="form-btn" type="submit">Submit</button>
        </form>
    </div>

    <script>
        function validateForm() {
            let isValid = true;

            // Full Name Validation
            const fullName = document.getElementById("fullName").value;
            if (fullName.trim() === "") {
                document.getElementById("fullNameError").innerText = "Full Name is required";
                isValid = false;
            } else {
                document.getElementById("fullNameError").innerText = "";
            }
            
            // Email Validation
            const email = document.getElementById("email").value;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email.trim() === "" || !emailPattern.test(email)) {
                document.getElementById("emailError").innerText = "Enter a valid email";
                isValid = false;
            } else {
                document.getElementById("emailError").innerText = "";
            }

            // Age Validation
            const age = document.getElementById("age").value;
            if (!/^\d+$/.test(age) || age < 18 || age > 100) {
                document.getElementById("ageError").innerText = "Enter a valid age between 18 and 100";
                isValid = false;
            } else {
                document.getElementById("ageError").innerText = "";
            }

            // Gender Validation
            const gender = document.getElementById("gender").value;
            if (gender === "") {
                document.getElementById("genderError").innerText = "Please select a gender";
                isValid = false;
            } else {
                document.getElementById("genderError").innerText = "";
            }

            // Address Validation
            const address = document.getElementById("address").value;
            if (address.trim() === "") {
                document.getElementById("addressError").innerText = "Address is required";
                isValid = false;
            } else {
                document.getElementById("addressError").innerText = "";
            }

            // Phone Number Validation
            const phone = document.getElementById("phone").value;
            if (!/^\d{10}$/.test(phone)) {
                document.getElementById("phoneError").innerText = "Phone Number must be 10 digits";
                isValid = false;
            } else {
                document.getElementById("phoneError").innerText = "";
            }

            // Aadhar Number Validation
            const aadharNumber = document.getElementById("aadharNumber").value;
            if (!/^\d{12}$/.test(aadharNumber)) {
                document.getElementById("aadharError").innerText = "Aadhar Number must be 12 digits";
                isValid = false;
            } else {
                document.getElementById("aadharError").innerText = "";
            }

            // Account Type Validation
            const accountType = document.getElementById("accountType").value;
            if (accountType === "") {
                document.getElementById("accountTypeError").innerText = "Please select an account type";
                isValid = false;
            } else {
                document.getElementById("accountTypeError").innerText = "";
            }

            return isValid;
        }
    </script>
</body>
</html>
