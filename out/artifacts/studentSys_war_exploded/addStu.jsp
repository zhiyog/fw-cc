<%--
  Created by IntelliJ IDEA.
  User: JXD
  Date: 2025/7/3
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加学生信息</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Microsoft YaHei', Arial, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            padding: 30px;
        }

        h3 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            position: relative;
            padding-bottom: 10px;
        }

        h3::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #3498db;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        tr:not(:last-child) {
            margin-bottom: 20px;
        }

        td {
            padding: 12px 0;
        }

        td:first-child {
            width: 30%;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }

        .radio-group {
            display: flex;
            gap: 20px;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .radio-group input[type="radio"] {
            margin-right: 8px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        input[type="submit"],
        input[type="button"] {
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        input[type="button"] {
            background-color: #e74c3c;
            color: white;
        }

        input[type="button"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>添加学生信息</h3>
    <form action="/addStu" method="post">
        <table>
            <tr>
                <td>学生姓名：</td>
                <td><input type="text" name="sname" placeholder="请输入学生姓名" required></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>
                    <div class="radio-group">
                        <label><input type="radio" value="男" name="sex" checked> 男</label>
                        <label><input type="radio" value="女" name="sex"> 女</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>出生日期：</td>
                <td><input type="date" name="birthday" required></td>
            </tr>
            <tr>
                <td>家庭住址：</td>
                <td><input type="text" name="address" placeholder="请输入详细地址" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="button-group">
                        <input type="submit" value="确定">
                        <input type="button" value="取消" onclick="cancel()">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    function cancel() {
        // 关闭当前页面
        window.close();
    }

    // 设置默认日期为18年前
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date();
        const defaultDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());
        document.querySelector('input[type="date"]').valueAsDate = defaultDate;
    });
</script>
</body>
</html>
