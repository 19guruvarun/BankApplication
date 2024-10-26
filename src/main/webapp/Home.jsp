<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Home</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Lucida Sans', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        background-color: #e6f7f7;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        overflow: hidden;
    }

    header {
        position: absolute;
        top: 0;
        width: 100%;
        background-color: #005555;
        padding: 10px;
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #fff;
        padding: 0 20px; /* Added padding for better spacing */
    }

    .user-name {
        font-size: 18px;
        font-weight: bold;
        color: #fff;
    }

    .nav-btn {
        background-color: teal;
        border: none;
        color: white;
        padding: 10px 20px;
        font-size: 18px;
        cursor: pointer;
        border-radius: 25px;
        transition: background 0.3s;
    }

    .nav-btn:hover {
        background-color: #007777;
    }

    .nav-links {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #444;
        position: absolute;
        top: 50px;
        right: 20px; /* Aligns dropdown menu to the right */
        width: 150px;
        padding: 10px;
        border-radius: 10px;
        display: none;
    }

    .nav-links button {
        background-color: teal;
        border: none;
        color: white;
        padding: 10px;
        margin: 5px 0;
        width: 100%;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .nav-links button:hover {
        background-color: #007777;
    }

    .main {
        text-align: center;
        margin-top: 80px;
        color: #005555;
    }

    h1 {
        font-size: 48px;
        margin-bottom: 40px;
        font-weight: 800;
    }

    .search-bar {
        display: flex;
        justify-content: center;
        margin-bottom: 30px;
    }

    .search-bar input {
        padding: 12px;
        width: 300px;
        border-radius: 20px 0 0 20px;
        border: 1px solid #c0c0c0;
        outline: none;
    }

    .search-bar button {
        padding: 10px 20px;
        border: none;
        background-color: teal;
        color: white;
        border-radius: 0 20px 20px 0;
        cursor: pointer;
        transition: background 0.3s;
    }

    .search-bar button:hover {
        background-color: #007777;
    }

    .create-account button {
        padding: 15px 40px;
        background-color: teal;
        color: white;
        border: none;
        border-radius: 20px;
        font-size: 18px;
        cursor: pointer;
        transition: background 0.3s;
        margin-top: 20px;
    }

    .create-account button:hover {
        background-color: #007777;
    }
</style>
<body>
    <header>
        <div class="navbar">
            <div class="user-name">Welcome, <%
            	    String res = (String) session.getAttribute("HomeUser");
				out.print(res);
						
            %></div>
            <button class="nav-btn" onclick="toggleMenu()">☰ Menu</button>
            <div id="nav-links" class="nav-links">
                <button>Profile</button>
                <button>Update</button>
                <button>Delete</button>
                <button>Logout</button>
            </div>
        </div>
    </header>

    <div class="main">
        <h1>Save And Simple Banking</h1>
        <div class="search-bar">
            <input type="text" placeholder="Search...">
            <button>Search</button>
        </div>

        <div class="create-account">
            <a href="BankAccount.jsp"><button>Create Account</button></a>
        </div>
    </div>

    <script>
        function toggleMenu() {
            var menu = document.getElementById("nav-links");
            if (menu.style.display === "flex") {
                menu.style.display = "none";
            } else {
                menu.style.display = "flex";
            }
        }
    </script>
</body>
</html>
