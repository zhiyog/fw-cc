<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.stu.model.News" %>
<%@ page import="com.stu.model.NewsDAO" %>
<html>
<head>
    <title>修改新闻</title>
    <style>
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
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
        .error {
            color: #e74c3c;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #fceaea;
            border-radius: 4px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }
        select, input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: inherit;
        }
        textarea {
            resize: vertical;
            min-height: 150px;
        }
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
        .btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 5px;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .btn-submit {
            background-color: #f39c12;
        }
        .btn-submit:hover {
            background-color: #d35400;
        }
    </style>
</head>
<body>
    <%
        // 检查用户是否登录
        if(session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 获取新闻ID
        String idStr = request.getParameter("id");
        News news = null;
        if(idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                NewsDAO dao = new NewsDAO();
                news = dao.getNewsById(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        if(news == null) {
            response.sendRedirect("newsList");
            return;
        }
    %>

    <div class="container">
        <h2>修改新闻</h2>
        <%if(request.getAttribute("error") != null){%>
            <div class="error"><%=request.getAttribute("error")%></div>
        <%}%>

        <form action="updateNews" method="post">
            <input type="hidden" name="id" value="<%=news.getId()%>">
            <div class="form-group">
                <label for="type">新闻类型</label>
                <select id="type" name="type" required>
                    <option value="">请选择</option>
                    <option value="时政" <%="时政".equals(news.getType())?"selected":""%>>时政</option>
                    <option value="体育" <%="体育".equals(news.getType())?"selected":""%>>体育</option>
                    <option value="科技" <%="科技".equals(news.getType())?"selected":""%>>科技</option>
                    <option value="娱乐" <%="娱乐".equals(news.getType())?"selected":""%>>娱乐</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">新闻标题</label>
                <input type="text" id="title" name="title" value="<%=news.getTitle()%>" required>
            </div>
            <div class="form-group">
                <label for="author">新闻作者</label>
                <input type="text" id="author" name="author" value="<%=news.getAuthor()%>" required>
            </div>
            <div class="form-group">
                <label for="content">新闻内容</label>
                <textarea id="content" name="content" rows="10" required><%=news.getContent()%></textarea>
            </div>
            <div class="btn-container">
                <button type="submit" class="btn btn-submit">提交</button>
                <button type="button" class="btn" onclick="location.href='newsDetail?id=<%=news.getId()%>'">返回</button>
            </div>
        </form>
    </div>
</body>
</html>
