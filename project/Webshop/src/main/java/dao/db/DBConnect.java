package dao.db;

import java.sql.*;

public class DBConnect {
    static String url = "jdbc:mysql://"+DBProperties.host()+":"
            + DBProperties.port()+"/"+DBProperties.dbname()+"?"+DBProperties.option();

    static Connection conn;
    public static Statement get(){
        try {
            if(conn == null || conn.isClosed()) makeConnect();
            return conn.createStatement();
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    private static void makeConnect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn= DriverManager.getConnection(url,DBProperties.username(),DBProperties.password());
    }

    public static void main(String[] args) throws SQLException {
        Statement statement = get();
        ResultSet rs = statement.executeQuery("select * from products");
        while(rs.next()){
            System.out.println(rs.getInt(1) +
                    "," + rs.getString(2) +
                    "," + rs.getDouble(3) +
                    "," + rs.getString(4) );
        }
    }
}
