package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() throws Exception {

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Fetch Environment Variables (Render)
            String host = System.getenv("DB_HOST");
            String dbPort = System.getenv("DB_PORT");
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASS");
            String dbName = System.getenv("DB_NAME");

            // Safety check
            if (host == null || dbPort == null || user == null || pass == null || dbName == null) {
                throw new Exception("One or more environment variables are missing.");
            }

            // Cloud Connection URL (SSL Required for Aiven)
            String url = "jdbc:mysql://" + host + ":" + dbPort + "/" + dbName +
                    "?sslMode=REQUIRED&allowPublicKeyRetrieval=true";

            return DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            System.err.println("DATABASE CONNECTION ERROR");
            e.printStackTrace();
            throw new Exception("Connection Failed: " + e.getMessage());
        }
    }
}