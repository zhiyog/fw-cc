<%--
  Created by IntelliJ IDEA.
  User: JXD
  Date: 2025/7/3
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改学生信息</title>
    <style>
        :root {
            --primary-color: #3498db;
            --danger-color: #e74c3c;
            --text-color: #333;
            --border-color: #ddd;
            --bg-color: #f5f7fa;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Microsoft YaHei', sans-serif;
        }

        body {
            background-color: var(--bg-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            color: var(--text-color);
        }

        .edit-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 650px;
            padding: 40px;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h3 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 26px;
            font-weight: 600;
            position: relative;
        }

        h3::after {
            content: "";
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(to right, var(--primary-color), #9b59b6);
            border-radius: 2px;
        }

        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .form-table tr:not(:last-child) td {
            padding-bottom: 5px;
        }

        .form-table td {
            padding: 12px 0;
            vertical-align: middle;
        }

        .form-table td:first-child {
            width: 25%;
            font-weight: 500;
            color: #555;
            padding-right: 15px;
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
            background-color: #f9f9f9;
        }

        .form-input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            background-color: white;
        }

        .form-input[readonly] {
            background-color: #f0f0f0;
            color: #666;
        }

        .radio-group {
            display: flex;
            gap: 25px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .radio-option input[type="radio"] {
            width: 18px;
            height: 18px;
            margin-right: 8px;
            accent-color: var(--primary-color);
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            min-width: 120px;
        }

        .btn-submit {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-submit:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.3);
        }

        .btn-cancel {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-cancel:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
        }
    </style>
</head>
<body>
<div class="edit-container">
    <h3>修改学生信息</h3>
    <form action="/editStu" method="post">
        <table class="form-table">
            <tr>
                <td>学号：</td>
                <td><input type="text" name="sno" class="form-input" readonly value="${student.sno}"></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="sname" class="form-input" value="${student.sname}" required></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>
                    <div class="radio-group">
                        <label class="radio-option">
                            <input type="radio" value="男" name="sex"  ${student.sex == '男' ? 'checked' : ''}> 男
                        </label>
                        <label class="radio-option">
                            <input type="radio" value="女" name="sex"  ${student.sex == '女' ? 'checked' : ''}> 女
                        </label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>出生日期：</td>
                <td><input type="date" name="birthday" class="form-input" value="${student.birthday}" required></td>
            </tr>
            <tr>
                <td>家庭住址：</td>
                <td><input type="text" name="address" class="form-input" value="${student.address}" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="button-group">
                        <input type="submit" value="确定" class="btn btn-submit">
                        <input type="button" value="取消" class="btn btn-cancel" onclick="history.back()">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    // 为只读字段添加特殊样式
    document.querySelectorAll('input[readonly]').forEach(input => {
        input.addEventListener('focus', (e) => {
            e.target.blur();
        });
    });

    // 日期输入框优化
    document.addEventListener('DOMContentLoaded', function() {
        const dateInput = document.querySelector('input[type="date"]');
        if(dateInput.value === '') {
            const today = new Date();
            const defaultDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());
            dateInput.valueAsDate = defaultDate;
        }
    });
</script>
</body>
</html>
