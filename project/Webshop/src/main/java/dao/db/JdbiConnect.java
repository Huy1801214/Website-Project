package dao.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public class JdbiConnect {
    static String url = "jdbc:mysql://"+DBProperties.host()+":"
            + DBProperties.port()+"/"+DBProperties.dbname()+"?"+DBProperties.option();
    static Jdbi jdbi;

    public static Jdbi get() {
        if (jdbi == null) makeConnect();
        return jdbi;
    }
    private static void makeConnect() {
        MysqlDataSource src = new MysqlDataSource();
        src.setUrl(url);
        src.setUser(DBProperties.username());
        src.setPassword(DBProperties.password());

        try {
            src.setUseCompression(true);
            src.setAutoReconnect(true);
        } catch (SQLException e) {
        }
        jdbi = Jdbi.create(src);
    }

    public static void main(String[] args) {
        get();
    }
}
