<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <style>
        body {
            width: 100vw;
            height: 100%;
            display: flex;
            justify-content: center;
            align-content: center;
            background-color: #f7f7f7;
        }
        .form-container {
            width: 400px;
            height: auto;
            background-color: #fff;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            border-radius: 10px;
            padding: 20px 30px;
            transform: translateY(10%);
        }
        .title {
            text-align: center;
            font-family: "Lucida Sans", Geneva, Verdana, sans-serif;
            margin: 10px 0 30px 0;
            font-size: 28px;
            font-weight: 800;
        }
        .form {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 18px;
            margin-bottom: 15px;
        }
        .input {
            border-radius: 20px;
            border: 1px solid #c0c0c0;
            padding: 12px 15px;
        }
        .form-btn {
            padding: 10px 15px;
            font-family: "Lucida Sans", Geneva, Verdana, sans-serif;
            border-radius: 20px;
            border: 0;
            background: teal;
            color: white;
            cursor: pointer;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        }
        .form-btn:active {
            box-shadow: none;
        }
        .login-para {
            text-align: center;
            font-family: "Lucida Sans", Geneva, Verdana, sans-serif;
            font-size: 12px;
            color: #747474;
        }
        .login-link {
            text-decoration: underline;
            color: teal;
            font-weight: bold;
            cursor: pointer;
        }
        .error-message, .success-message {
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
        }
        .error-message { color: red; }
        .success-message { color: green; }
        .alert-popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.5);
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
    </style>
</head>
<body>

<div class="form-container">
    <p class="title">Reset Password</p>

    <% 
    String message = (String) request.getAttribute("message"); 
    if (message != null) { 
    %>
        <div class="<%= request.getAttribute("messageType") %>">
            <p><%= message %></p>
        </div>
    <% } %>

    <form class="form" id="resetForm" action="resetPassword" method="post" onsubmit="return validateForm()">
        <input type="email" class="input" placeholder="Email" name="email" required title="Please enter a valid email." autocomplete="off">
        <input type="text" class="input" placeholder="Phone Number" name="phoneNo" required pattern="\d{10}" title="Please enter a 10-digit phone number." autocomplete="off">
        <input type="password" class="input" placeholder="New Password" name="newPassword" required minlength="8" title="Password must be at least 8 characters." autocomplete="off">
        <input type="password" class="input" placeholder="Confirm Password" name="confirmPassword" required minlength="8" title="Password must be at least 8 characters." autocomplete="off">
        
        <button class="form-btn" type="submit">Reset Password</button>
        <p class="login-para">Remembered your password? <a href="Login.jsp" class="login-link">Log in</a></p>
    </form>
</div>

<!-- Alert Popup -->
<div id="customAlert" class="alert-popup" style="display:none;">
    <div class="alert-content">
        <p id="alertMessage">Alert Message Here</p>
        <button class="alert-btn" onclick="closeAlert()">Close</button>
    </div>
</div>

<script>
function validateForm() {
    var password = document.querySelector('input[name="newPassword"]').value;
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
