<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* Reset basic styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body background with vibrant gradient */
body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(135deg, #12c2e9, #c471ed, #f64f59);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Container for form */
.container {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
    width: 350px;
    text-align: center;
}

/* Heading style */
h1 {
    color: #f64f59;
    margin-bottom: 20px;
    font-size: 28px;
}

/* Input fields with a colorful focus state */
.input-field {
    margin-bottom: 20px;
    text-align: left;
}

label {
    font-size: 14px;
    color: #333;
    margin-bottom: 8px;
    display: block;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 16px;
    margin-top: 5px;
    transition: border-color 0.3s ease;
}

input[type="email"]:focus,
input[type="password"]:focus {
    border-color: #12c2e9;
    outline: none;
}

/* Submit button with hover effect */
input[type="submit"] {
    background-color: #12c2e9;
    color: white;
    border: none;
    padding: 12px;
    width: 100%;
    border-radius: 8px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #f64f59;
}
</style>
<body>
<div class="container">
        <h1>Enter Your Details</h1>
        <form action="home" method="post">
            <div class="input-field">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            
            <div class="input-field">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>