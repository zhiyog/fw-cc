package com.stu.model;

import com.stu.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO {
    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        Connection conn = DBUtil.getConn();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM news ORDER BY id";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getInt("id"));
                news.setType(rs.getString("type"));
                news.setTitle(rs.getString("title"));
                news.setAuthor(rs.getString("author"));
                news.setCreateDate(rs.getDate("createdate"));
                news.setModifyDate(rs.getDate("modifydate"));
                news.setContent(rs.getString("content"));
                newsList.add(news);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        finally { DBUtil.closeAll(conn, pst, rs); }
        return newsList;
    }

    public List<News> getNewsByType(String type) {
        List<News> newsList = new ArrayList<>();
        Connection conn = DBUtil.getConn();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM news WHERE type=? ORDER BY id";
            pst = conn.prepareStatement(sql);
            pst.setString(1, type);
            rs = pst.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getInt("id"));
                news.setType(rs.getString("type"));
                news.setTitle(rs.getString("title"));
                news.setAuthor(rs.getString("author"));
                news.setCreateDate(rs.getDate("createdate"));
                news.setModifyDate(rs.getDate("modifydate"));
                news.setContent(rs.getString("content"));
                newsList.add(news);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        finally { DBUtil.closeAll(conn, pst, rs); }
        return newsList;
    }

    public News getNewsById(int id) {
        News news = null;
        Connection conn = DBUtil.getConn();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM news WHERE id=?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                news = new News();
                news.setId(rs.getInt("id"));
                news.setType(rs.getString("type"));
                news.setTitle(rs.getString("title"));
                news.setAuthor(rs.getString("author"));
                news.setCreateDate(rs.getDate("createdate"));
                news.setModifyDate(rs.getDate("modifydate"));
                news.setContent(rs.getString("content"));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        finally { DBUtil.closeAll(conn, pst, rs); }
        return news;
    }

    public boolean addNews(News news) {
        Connection conn = DBUtil.getConn();
        PreparedStatement pst = null;
        try {
            // 获取最大ID
            int maxId = 1;
            PreparedStatement idPst = conn.prepareStatement("SELECT MAX(id) FROM news");
            ResultSet rs = idPst.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt(1) + 1;
            }
            rs.close();
            idPst.close();

            String sql = "INSERT INTO news (id, type, title, author, createdate, modifydate, content) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, maxId);
            pst.setString(2, news.getType());
            pst.setString(3, news.getTitle());
            pst.setString(4, news.getAuthor());
            pst.setDate(5, new java.sql.Date(news.getCreateDate().getTime()));
            pst.setDate(6, new java.sql.Date(news.getModifyDate().getTime()));
            pst.setString(7, news.getContent());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBUtil.closeAll(conn, pst, null);
        }
    }

    public boolean updateNews(News news) {
        Connection conn = DBUtil.getConn();
        PreparedStatement pst = null;
        try {
            String sql = "UPDATE news SET type=?, title=?, author=?, modifydate=?, content=? WHERE id=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, news.getType());
            pst.setString(2, news.getTitle());
            pst.setString(3, news.getAuthor());
            pst.setDate(4, new java.sql.Date(news.getModifyDate().getTime()));
            pst.setString(5, news.getContent());
            pst.setInt(6, news.getId());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBUtil.closeAll(conn, pst, null);
        }
    }

    public boolean deleteNews(int id) {
        Connection conn = DBUtil.getConn();
        PreparedStatement pst = null;
        try {
            String sql = "DELETE FROM news WHERE id=?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBUtil.closeAll(conn, pst, null);
        }
    }
}
