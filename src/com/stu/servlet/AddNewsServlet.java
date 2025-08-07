package com.stu.servlet;

import com.stu.model.News;
import com.stu.model.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/addNews")
public class AddNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置请求和响应的字符编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 检查用户是否登录
        if (request.getSession().getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 获取表单数据
        String type = request.getParameter("type");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String content = request.getParameter("content");

        // 创建News对象
        News news = new News();
        news.setType(type);
        news.setTitle(title);
        news.setAuthor(author);
        Date now = new Date();
        news.setCreateDate(now);
        news.setModifyDate(now);
        news.setContent(content);

        // 保存到数据库
        NewsDAO dao = new NewsDAO();
        boolean success = dao.addNews(news);

        if (success) {
            // 添加成功，重定向到新闻列表页面
            response.sendRedirect("newsList");
        } else {
            // 添加失败，返回添加页面并显示错误信息
            request.setAttribute("error", "添加新闻失败，请重试！");
            request.getRequestDispatcher("addNews.jsp").forward(request, response);
        }
    }
}
