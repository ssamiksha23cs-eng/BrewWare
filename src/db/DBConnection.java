package db;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Grab Railway environment variables
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String db   = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String pass = System.getenv("MYSQLPASSWORD");

            String url;
            if (host == null) {
                // Local Laptop Settings
                url = "jdbc:mysql://localhost:3306/brew_ware?useSSL=false&serverTimezone=UTC";
                user = "root";
                pass = ""; 
            } else {
                // Railway Server Settings - Dynamic URL
                url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&serverTimezone=UTC";
            }

            return DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            throw new Exception("Connection Failed: " + e.getMessage());
        }
    }
}