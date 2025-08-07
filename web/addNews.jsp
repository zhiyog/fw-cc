<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>新增新闻</title>
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
            background-color: #2ecc71;
        }
        .btn-submit:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>新增新闻</h2>
        <%if(request.getAttribute("error") != null){%>
            <div class="error"><%=request.getAttribute("error")%></div>
        <%}%>
        <form action="addNews" method="post">
            <div class="form-group">
                <label for="type">新闻类型</label>
                <select id="type" name="type" required>
                    <option value="">请选择</option>
                    <option value="时政">时政</option>
                    <option value="体育">体育</option>
                    <option value="科技">科技</option>
                    <option value="娱乐">娱乐</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">新闻标题</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="author">新闻作者</label>
                <input type="text" id="author" name="author" required>
            </div>
            <div class="form-group">
                <label for="content">新闻内容</label>
                <textarea id="content" name="content" rows="10" required></textarea>
            </div>
            <div class="btn-container">
                <button type="submit" class="btn btn-submit">提交</button>
                <button type="button" class="btn" onclick="location.href='newsList'">返回</button>
            </div>
        </form>
    </div>
</body>
</html>
