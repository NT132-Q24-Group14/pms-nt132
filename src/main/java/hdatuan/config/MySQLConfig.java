package hdatuan.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConfig {
    public static Connection getConnection() {
        Connection connection = null;

        try {
            String host = System.getenv("pms_db_host");
            String db = System.getenv("pms_db_name");
            String user = System.getenv("pms_db_username");
            String pass = System.getenv("pms_db_password");

            if (host == null || db == null || user == null || pass == null) {
                throw new RuntimeException("Missing database environment variables");
            }

            String url = "jdbc:mysql://" + host + "/" + db;

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
        }

        return connection;
    }
}
