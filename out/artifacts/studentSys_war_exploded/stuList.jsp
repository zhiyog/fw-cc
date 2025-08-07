<%--
  Created by IntelliJ IDEA.
  User: HGD
  Date: 2025/7/2
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息管理系统</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Microsoft YaHei', Arial, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 14px;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #f1f8fe;
        }

        input[type="checkbox"] {
            transform: scale(1.2);
            cursor: pointer;
        }

        .action-buttons {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: #3498db;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2980b9;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .btn-success {
            background-color: #2ecc71;
            color: white;
        }

        .btn-success:hover {
            background-color: #27ae60;
        }

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-box {
            display: flex;
            gap: 10px;
        }

        .search-box input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 250px;
        }

        .search-box button {
            padding: 8px 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>学生信息管理系统</h2>

    <div class="header-actions">
        <div class="action-buttons">
            <button class="btn btn-primary" onclick="add()">添加学生</button>
            <button class="btn btn-danger" onclick="del()">批量删除</button>
            <button class="btn btn-success" onclick="edit()">修改信息</button>
        </div>

        <div class="search-box">
            <input type="text" id="sname" placeholder="搜索学生姓名或学号...">
            <button class="btn btn-primary" onclick="queryStu()">搜索</button>
        </div>
    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th width="50px"><input type="checkbox"></th>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>出生日期</th>
                <th>地址</th>
            </tr>
            </thead>
            <tbody>
            <%-- 之后的数据要根据后台查询的学生信息进行展示 --%>
            <c:forEach items="${list}" var="stu">
                <tr>
                    <td><input type="checkbox" value="${stu.sno}" name="chk"></td>
                    <td>${stu.sno}</td>
                    <td>${stu.sname}</td>
                    <td>${stu.sex}</td>
                    <td>${stu.birthday}</td>
                    <td>${stu.address}</td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    function queryStu(){
        //获取用户输入的内容，根据内容去后台查询符合的数据
        var sname = document.getElementById("sname").value
        //请求后台，并将数据发送到后台
        window.location.href = "/getAll?sname=" + sname
    }

    function add(){
        //新增学生信息
        //打开新增学生的页面
        window.open("addStu.jsp")
    }

    function del(){
        //判断用户的选中项
        var chks = document.getElementsByName("chk") //获取所有的复选框
        var count = 0
        var snos = ''
        for (var i=0; i<chks.length; i++){
            if (chks[i].checked) {//如果某个复选框被选中
                count ++  //计数器+1

                //存储用户选中的学生学号
                snos += chks[i].value + ","
            }
        }

        if(count == 0) {
            alert("请选择要删除的数据")
            return //中断用户的操作
        }

        if (confirm("确定要删除选中记录么？")) {
            //执行删除动作
            window.location.href = "delStu?snos=" + snos
        }

    }

    function edit(){
        //选择项的判断
        //判断用户的选中项
        var chks = document.getElementsByName("chk") //获取所有的复选框
        var count = 0
        var sno = ''
        for (var i=0; i<chks.length; i++){
            if (chks[i].checked) {//如果某个复选框被选中
                count ++  //计数器+1

                //存储用户选中的学生学号
                sno = chks[i].value
            }
        }

        if (count == 0) {
            alert("请选择要修改的学生信息")
            return
        }

        if (count > 1) {
            alert("只能选择一条进行修改")
            return
        }

        //根据用户选中的学号信息，查询当前学生详细信息
        window.open("getOne?sno=" + sno)

    }


</script>


</body>
</html>