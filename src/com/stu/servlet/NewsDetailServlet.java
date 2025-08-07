package com.stu.servlet;

import com.stu.model.News;
import com.stu.model.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/newsDetail")
public class NewsDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 检查用户是否登录
        if (request.getSession().getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 获取新闻ID
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                NewsDAO dao = new NewsDAO();
                News news = dao.getNewsById(id);

                if (news != null) {
                    // 将新闻对象放入请求属性
                    request.setAttribute("news", news);
                    // 转发到详情页面
                    request.getRequestDispatcher("newsDetail.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // 如果ID无效或新闻不存在，重定向回新闻列表
        response.sendRedirect("newsList");
    }
}
