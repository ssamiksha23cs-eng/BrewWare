package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() throws Exception {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String host = System.getenv("DB_HOST");
        String dbPort = System.getenv("DB_PORT");
        String user = System.getenv("DB_USER");
        String pass = System.getenv("DB_PASS");
        String dbName = System.getenv("DB_NAME");

        String url;

        // If host is null, we are likely running on your local computer
        if (host == null) {
            url = "jdbc:mysql://localhost:3306/brew_ware?useSSL=false";
            user = "root";
            pass = ""; // Your local password
        } else {
            // Render/Aiven Connection with mandatory SSL parameters
            url = "jdbc:mysql://" + host + ":" + dbPort + "/" + dbName + 
                  "?useSSL=true&requireSSL=true&verifyServerCertificate=false&allowPublicKeyRetrieval=true";
        }

        return DriverManager.getConnection(url, user, pass);

    } catch (Exception e) {
        e.printStackTrace(); // This prints the EXACT error in Render Logs
        throw new Exception("Database Connection Failed: " + e.getMessage());
    }
}
}