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

@WebServlet("/updateNews")
public class UpdateNewsServlet extends HttpServlet {
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
        String idStr = request.getParameter("id");
        String type = request.getParameter("type");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String content = request.getParameter("content");

        try {
            int id = Integer.parseInt(idStr);

            // 获取原新闻对象
            NewsDAO dao = new NewsDAO();
            News news = dao.getNewsById(id);

            if (news != null) {
                // 更新新闻对象
                news.setType(type);
                news.setTitle(title);
                news.setAuthor(author);
                news.setModifyDate(new Date());
                news.setContent(content);

                // 保存到数据库
                boolean success = dao.updateNews(news);

                if (success) {
                    // 更新成功，重定向到新闻详情页面
                    response.sendRedirect("newsDetail?id=" + id);
                } else {
                    // 更新失败，返回编辑页面并显示错误信息
                    request.setAttribute("error", "更新新闻失败，请重试！");
                    request.getRequestDispatcher("editNews.jsp?id=" + id).forward(request, response);
                }
            } else {
                // 新闻不存在，重定向到新闻列表
                response.sendRedirect("newsList");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("newsList");
        }
    }
}
