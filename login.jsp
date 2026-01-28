<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>BrewWare Login</title>
    <style>
        /* Forces the centering in the 'Purple Square' area */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #fdf8f3;
            font-family: 'Segoe UI', sans-serif;
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                              url('images/page1.jpg');
        }

        .login-card {
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border: 1px solid #eaddcf;
            width: 380px;
        }

        .form-group { margin-bottom: 15px; text-align: left; }
        .form-group label { display: block; font-weight: bold; color: #502314; margin-bottom: 5px; }
        .form-group input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }

        .login-btn {
            width: 100%; padding: 12px; background-color: #502314; color: white;
            border: none; border-radius: 8px; font-weight: bold; cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h2 style="text-align:center; color:#502314;">☕ BrewWare</h2>
        <form action="Login" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>
            <div class="form-group">
                <label>Age</label>
                <input type="number" name="age" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit" class="login-btn">Secure Login</button>
        </form>
    </div>
</body>
</html>