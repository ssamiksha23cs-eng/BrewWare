package db;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Fetch variables exactly as they appear in your Render dashboard
            String host = System.getenv("DB_HOST");
            String dbPort = System.getenv("DB_PORT"); // Use DB_PORT, not PORT
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASS");
            String dbName = System.getenv("DB_NAME");

            String url;

            // Check if we are in the Render environment
            if (host != null && !host.isEmpty()) {
                // Cloud Connection String (Aiven)
                // Added SSL parameters because Aiven requires them
                url = "jdbc:mysql://" + host + ":" + dbPort + "/" + dbName + 
                      "?useSSL=true&requireSSL=true&verifyServerCertificate=false&allowPublicKeyRetrieval=true";
            } else {
                // Local Connection Fallback (Matches your local brew_ware db)
                url = "jdbc:mysql://localhost:3306/brew_ware?useSSL=false";
                user = "root";
                pass = ""; 
            }

            return DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            // This will print the exact reason for failure in your Render Logs
            System.err.println("--- DATABASE CONNECTION ERROR ---");
            e.printStackTrace(); 
            throw new Exception("Connection Failed: " + e.getMessage());
        }
    }
}