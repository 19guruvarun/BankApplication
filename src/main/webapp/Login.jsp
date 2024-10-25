<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn</title>
<style>
body {
    width: 100vw;
    height: 100%;
    display: flex;    
    justify-content: center;
    align-content: center;
} 
.form-container {
    width: 350px;
    height: 400px;
    background-color: #fff;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    border-radius: 10px;
    box-sizing: border-box;
    padding: 20px 30px;
    transform: translateY(20%);
}

.title {
    text-align: center;
    font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
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
    outline: 0 !important;
    box-sizing: border-box;
    padding: 12px 15px;
}

.page-link {
    text-decoration: underline;
    margin: 0;
    text-align: end;
    color: #747474;
}

.page-link-label {
    cursor: pointer;
    font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
    font-size: 9px;
    font-weight: 700;
}

.page-link-label:hover {
    color: #000;
}

.form-btn {
    padding: 10px 15px;
    font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
    border-radius: 20px;
    border: 0 !important;
    outline: 0 !important;
    background: teal;
    color: white;
    cursor: pointer;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}

.form-btn:active {
    box-shadow: none;
}

.sign-up-label {
    margin: 0;
    font-size: 10px;
    color: #747474;
    font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
}

.sign-up-link {
    margin-left: 1px;
    font-size: 11px;
    text-decoration: underline;
    text-decoration-color: teal;
    color: teal;
    cursor: pointer;
    font-weight: 800;
    font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
}

.buttons-container {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    margin-top: 20px;
    gap: 15px;
}
</style>
</head>
<body>
<% 
    String msg1 = (String) request.getAttribute("email_invalid");
    String msg2 = (String) request.getAttribute("pass_invalid");
%>
<div class="form-container">
    <p class="title">Welcome back</p>
    <form class="form" action="login" method="post">
        <input type="email" class="input" placeholder="Enter Email" name="email" required="required">
        <%
            if (msg1 != null) {
                out.print("<span style='color:red'><sup>*</sup>" + msg1 + "</span>");
            }
        %>
        <input type="password" class="input" placeholder="Enter Password" name="password" required="required">
        <%
            if (msg2 != null) {
                out.print("<span style='color:red'><sup>*</sup>" + msg2 + "</span>");
            }
        %>
        <p class="page-link">
            <a href="ForgotPassword.jsp" class="page-link-label">Forgot Password?</a>
        </p>
        <button class="form-btn" type="submit">Log in</button>
    </form>
    <p class="sign-up-label">
        Don't have an account?<span><a href="Register.jsp" class="sign-up-link">Sign up</a></span>
    </p>
</div>
</body>
</html>
