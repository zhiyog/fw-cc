<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.stu.model.News" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>新闻列表</title>
    <style>
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .welcome {
            background-color: #f8f9fa;
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            color: #555;
        }
        .filter-form {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
        }
        .filter-form select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 10px;
        }
        .btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .btn-add {
            background-color: #2ecc71;
        }
        .btn-add:hover {
            background-color: #27ae60;
        }
        .btn-delete {
            background-color: #e74c3c;
        }
        .btn-delete:hover {
            background-color: #c0392b;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
            color: #333;
        }
        tr:hover {
            background-color: #f8f9fa;
        }
        a {
            color: #3498db;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .checkbox-cell {
            width: 50px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>新闻管理系统</h2>
        <%if(session.getAttribute("username") != null){%>
            <div class="welcome">
                欢迎：<%=session.getAttribute("username")%> | 登录时间：<%=session.getAttribute("loginTime")%>
            </div>
        <%}%>

        <form action="newsList" method="get" class="filter-form">
            <select name="type">
                <option value="">全部类型</option>
                <option value="时政">时政</option>
                <option value="体育">体育</option>
                <option value="科技">科技</option>
                <option value="娱乐">娱乐</option>
            </select>
            <button type="submit" class="btn">查询</button>
            <button type="button" class="btn btn-add" onclick="location.href='addNews.jsp'">新增</button>
            <button type="button" class="btn btn-delete" onclick="deleteSelected()">删除</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th class="checkbox-cell">选择</th>
                    <th>新闻类型</th>
                    <th>新闻标题</th>
                    <th>新闻作者</th>
                    <th>创建时间</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<News> newsList = (List<News>)request.getAttribute("newsList");
                    if(newsList != null) {
                        for(News news : newsList) {
                %>
                <tr>
                    <td class="checkbox-cell"><input type="checkbox" name="ids" value="<%=news.getId()%>"></td>
                    <td><%=news.getType()%></td>
                    <td><a href="newsDetail?id=<%=news.getId()%>"><%=news.getTitle()%></a></td>
                    <td><%=news.getAuthor()%></td>
                    <td><%=news.getCreateDate()%></td>
                </tr>
                <%} } %>
            </tbody>
        </table>
    </div>
    <script>
        function deleteSelected() {
            var ids = [];
            var checkboxes = document.getElementsByName('ids');
            for(var i=0; i<checkboxes.length; i++) {
                if(checkboxes[i].checked) ids.push(checkboxes[i].value);
            }
            if(ids.length > 0) {
                if(confirm('确定删除选中的新闻吗？')) {
                    location.href = 'deleteNews?ids=' + ids.join(',');
                }
            } else {
                alert('请选择要删除的新闻！');
            }
        }
    </script>
</body>
</html>
