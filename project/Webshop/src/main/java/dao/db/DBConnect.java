package dao.db;

import java.sql.*;

public class DBConnect {
    static String url = "jdbc:mysql://" + DBProperties.host() + ":"
            + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();

    static Connection conn;

    // gọi ra các câu statement
    public static Statement get() {
        try {
            if (conn == null || conn.isClosed()) makeConnect();
            return conn.createStatement();
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    // gọi các câu prepare statement
    public static PreparedStatement getPreparedStatement(String sql) {
        try {
            if (conn == null || conn.isClosed()) makeConnect();
            return conn.prepareStatement(sql);
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    // đóng csdl khi thực hiện xong
    public static void close(ResultSet rs, PreparedStatement preparedStatement, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (preparedStatement != null) preparedStatement.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(PreparedStatement preparedStatement, Connection conn) {
            close(null, preparedStatement, conn);
    }

    // kết nối tới csdl
    public static Connection getConnection() {
        return conn;
    }

    private static void makeConnect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, DBProperties.username(), DBProperties.password());
    }
}
