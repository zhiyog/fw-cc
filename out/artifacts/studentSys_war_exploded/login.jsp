<%--
  Created by IntelliJ IDEA.
  User: HGD
  Date: 2025/7/2
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息管理系统 - 用户登录</title>
    <style>
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .login-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 380px;
            padding: 30px;
            text-align: center;
        }

        h3 {
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 22px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }

        .submit-btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #2980b9;
        }

        .error-message {
            color: #e74c3c;
            margin-top: 15px;
            font-size: 14px;
            text-align: center;
        }

        .logo {
            margin-bottom: 20px;
            color: #3498db;
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">学生信息管理系统</div>
    <h3>用户登录</h3>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="uname">用户名</label>
            <input type="text" id="uname" name="uname" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="pwd">密码</label>
            <input type="password" id="pwd" name="pwd" placeholder="请输入密码">
        </div>
        <button type="submit" class="submit-btn">登 录</button>
    </form>
    <div class="error-message">${msg}</div>
</div>
</body>
</html>
