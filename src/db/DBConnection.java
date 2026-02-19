package db;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        try {
            // Load the driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 1. Grab environment variables from Render
            String host = System.getenv("DB_HOST");
            String port = System.getenv("PORT");
            String userEnv = System.getenv("DB_USER");
            String passEnv = System.getenv("DB_PASS");
            String dbNameEnv = System.getenv("DB_NAME");
            
           

            String url;
            String finalUser;
            String finalPass;

            if (host == null || host.isEmpty()) {
            
                String localDbName = (dbNameEnv != null) ? dbNameEnv : "brew_ware"; 
                url = "jdbc:mysql://mysql-2b1deb52...aivencloud.com:23456/defaultdb?useSSL=true&trustServerCertificate=true";
                finalUser = "root"; 
                finalPass = "";    
            } else {
               
                String cloudDbName = (dbNameEnv != null) ? dbNameEnv : "defaultdb"; 
               url = "jdbc:mysql://" + host + ":" + port + "/" + cloudDbName + 
          "?useSSL=true&requireSSL=true&verifyServerCertificate=false&allowPublicKeyRetrieval=true";
                finalUser = userEnv;
                finalPass = passEnv;
            }

            return DriverManager.getConnection(url, finalUser, finalPass);

        } catch (Exception e) {
            
            System.err.println("--- DATABASE CONNECTION ERROR ---");
            e.printStackTrace(); 
            throw new Exception("Connection Failed: " + e.getMessage());
        }
    }
}