package db;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws Exception { // Note: throws Exception
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Verify your database name 'brew_ware' exists in phpMyAdmin
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/brew_ware", "root", "");
        } catch (Exception e) {
            // Re-throw the error so Register.java can see it
            throw new Exception("Connection Failed: " + e.getMessage());
        }
    }
}