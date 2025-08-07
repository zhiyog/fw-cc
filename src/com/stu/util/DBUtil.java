package com.stu.util;

import java.sql.*;

/**
 * @ClassName DBUtil
 * @Description TODO
 * @Author 李晓茹
 * @Date 2025/3/12 10:06
 * @Version 1.0
 */
public class DBUtil {
    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
    private static String username = "root";
    private static String password = "";


    public static Connection getConn(){
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void closeAll(Connection conn, PreparedStatement pst, ResultSet rs){
        try{
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
