package com.stu.servlet;

import com.stu.model.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteNews")
public class DeleteNewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 检查用户是否登录
        if (request.getSession().getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 获取要删除的新闻ID
        String idsParam = request.getParameter("ids");
        if (idsParam != null && !idsParam.trim().isEmpty()) {
            String[] idArray = idsParam.split(",");
            NewsDAO dao = new NewsDAO();

            // 逐个删除选中的新闻
            for (String idStr : idArray) {
                try {
                    int id = Integer.parseInt(idStr);
                    dao.deleteNews(id);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }

        // 重定向回新闻列表页面
        response.sendRedirect("newsList");
    }
}
