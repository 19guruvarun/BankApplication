<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="dto.UserProfile_dto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
/* CSS Styling */
body {
    width: 100vw;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
    background-color: #f3f3f3;
}

.form-container {
    width: 400px;
    background-color: #fff;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    border-radius: 10px;
    padding: 20px 30px;
    box-sizing: border-box;
}

.title {
    text-align: center;
    font-family: "Lucida Sans", Geneva, Verdana, sans-serif;
    margin: 10px 0 20px 0;
    font-size: 28px;
    font-weight: 800;
}

.form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.input {
    border-radius: 10px;
    border: 1px solid #c0c0c0;
    padding: 12px 15px;
    font-size: 14px;
    box-sizing: border-box;
}

.form-btn {
    padding: 12px;
    font-family: "Lucida Sans", Geneva, Verdana, sans-serif;
    border-radius: 10px;
    background-color: teal;
    color: white;
    cursor: pointer;
    border: none;
    font-weight: bold;
    transition: background-color 0.3s;
}

.form-btn:hover {
    background-color: darkcyan;
}

.gender-container {
    display: flex;
    gap: 15px;
    align-items: center;
}

.login-para {
    text-align: center;
    font-size: 12px;
    color: #747474;
}

.login-link {
    color: teal;
    text-decoration: underline;
    font-weight: bold;
    cursor: pointer;
}
.alert-popup {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.5); /* semi-transparent background */
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
}

.alert-content {
    background-color: white;
    width: 300px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    text-align: center;
}

.alert-content p {
    font-family: "Lucida Sans", Geneva, Verdana, sans-serif;
    color: #333;
    font-size: 16px;
    margin-bottom: 20px;
}

.alert-btn {
    background-color: teal;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s;
}

.alert-btn:hover {
    background-color: darkcyan;
}
.error-message {
    color: red;
    font-size: 14px;
    text-align: center;
    margin-bottom: 15px;
}
</style>
</head>
<body>

<div class="form-container">
    <p class="title">Create Account</p>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <div class="error-message">
            <%= errorMessage %>
        </div>
    <% } %>
    <div id="customAlert" class="alert-popup" style="display: none;">
    <div class="alert-content">
        <p id="alertMessage">Passwords do not match.</p>
        <button onclick="closeAlert()" class="alert-btn">OK</button>
    </div>
</div>
    <form class="form" action="signup" method="post" onsubmit="return validateForm()">
        
        <input type="text" class="input" placeholder="First Name" name="firstName" required pattern="[A-Za-z]+" title="First name should contain only letters.">
        
        <input type="text" class="input" placeholder="Last Name" name="lastName" required pattern="[A-Za-z]+" title="Last name should contain only letters.">
        
        <input type="email" class="input" placeholder="Email" name="email" required title="Please enter a valid email.">
        
        <input type="text" class="input" placeholder="Phone Number" name="phoneNo" required pattern="\d{10}" title="Please enter a 10-digit phone number.">
        
        <div class="gender-container">
            <label><input type="radio" name="gender" value="male" required> Male</label>
            <label><input type="radio" name="gender" value="female" required> Female</label>
        </div>
        
        <input type="number" class="input" placeholder="Age" name="age" required min="18" max="100" title="Age should be between 18 and 100.">
        
        <textarea class="input" placeholder="Address" name="address" rows="3" required title="Please enter your address."></textarea>
        
        <input type="password" class="input" placeholder="Password" name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%!]).{8,}" title="Must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 8 characters long.">
        
        <input type="password" class="input" placeholder="Confirm Password" name="confirmPassword" required>
        
        <button class="form-btn" type="submit">Sign Up</button>
        <p class="login-para">Already have an account? <a href="Login.jsp" class="login-link">Log in</a></p>

    </form>
</div>

<script>
function validateForm() {
    var password = document.querySelector('input[name="password"]').value;
    var confirmPassword = document.querySelector('input[name="confirmPassword"]').value;
    
    if (password !== confirmPassword) {
        showAlert("Passwords do not match.");
        return false;
    }
    return true;
}

function showAlert(message) {
    document.getElementById("alertMessage").innerText = message;
    document.getElementById("customAlert").style.display = "flex";
}

function closeAlert() {
    document.getElementById("customAlert").style.display = "none";
}
</script>


</body>
</html>

