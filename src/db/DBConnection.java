package db;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws Exception { // Note: throws Exception
        try {
            // 1. Load the Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Get the Cloud credentials from Railway Variables
            // These will be empty on your laptop but filled on the server
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String db   = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String pass = System.getenv("MYSQLPASSWORD");

            // 3. Build the URL dynamically
            // If host is null (on your laptop), it falls back to localhost
            String url;
            if (host == null) {
                url = "jdbc:mysql://localhost:3306/brew_ware";
                user = "root";
                pass = ""; 
            } else {
                url = "jdbc:mysql://" + host + ":" + port + "/" + db;
            }

            return DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            // Re-throw the error so Register.java can see it
            throw new Exception("Connection Failed: " + e.getMessage());
        }
    }
}