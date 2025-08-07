package com.stu.servlet;

import com.stu.model.News;
import com.stu.model.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/newsList")
public class NewsListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NewsDAO dao = new NewsDAO();
        String type = request.getParameter("type");
        List<News> newsList;

        if (type != null && !type.trim().isEmpty()) {
            newsList = dao.getNewsByType(type);
        } else {
            newsList = dao.getAllNews();
        }

        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("newsList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
