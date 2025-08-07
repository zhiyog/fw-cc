<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.stu.model.News" %>
<html>
<head>
    <title>新闻详情</title>
    <style>
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            text-align: center;
        }
        .welcome {
            background-color: #f8f9fa;
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            color: #555;
        }
        .news-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .news-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            color: #777;
            font-size: 14px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .news-content {
            line-height: 1.8;
            color: #333;
            margin-bottom: 30px;
            padding: 0 10px;
        }
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
        .btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 5px;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .btn-edit {
            background-color: #f39c12;
        }
        .btn-edit:hover {
            background-color: #d35400;
        }
        .not-found {
            text-align: center;
            color: #e74c3c;
            margin: 30px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>新闻详情</h2>
        <%if(session.getAttribute("username") != null){%>
            <div class="welcome">
                欢迎：<%=session.getAttribute("username")%> | 登录时间：<%=session.getAttribute("loginTime")%>
            </div>
        <%}%>

        <%
            News news = (News)request.getAttribute("news");
            if(news != null) {
        %>
        <div class="news-title"><%=news.getTitle()%></div>
        <div class="news-meta">
            <span>类型：<%=news.getType()%></span>
            <span>作者：<%=news.getAuthor()%></span>
            <span>发布时间：<%=news.getCreateDate()%></span>
        </div>
        <div class="news-content"><%=news.getContent()%></div>
        <%} else {%>
            <p class="not-found">新闻不存在或已被删除！</p>
        <%}%>

        <div class="btn-container">
            <% if(news != null) { %>
                <button class="btn btn-edit" onclick="location.href='editNews.jsp?id=<%=news.getId()%>'">修改</button>
            <% } %>
            <button class="btn" onclick="location.href='newsList'">返回列表</button>
        </div>
    </div>
</body>
</html>
