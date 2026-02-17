package auth;

import db.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Register")
public class Register extends HttpServlet {

    // STEP 1: Create a separate method for the Database work. 
    // This allows JUnit to test the registration without needing a Browser/Server.
    public boolean registerUser(String username, String email, String ageStr, String password) {
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return false;

            String sql = "INSERT INTO users (username, email, age, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setInt(3, Integer.parseInt(ageStr)); // Converts String to Int
            ps.setString(4, password);

            int result = ps.executeUpdate();
            return result > 0; // Returns true if insertion succeeded
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        // STEP 2: Collect data from the request
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String ageStr = req.getParameter("age");
        String pass = req.getParameter("password");

        // STEP 3: Call the method we created above
        boolean isSuccess = registerUser(username, email, ageStr, pass);

        // STEP 4: Handle the Web Response
        if (isSuccess) {
            out.println("<script>alert('Successfully Registered!'); window.location.href='dashboard.jsp';</script>");
        } else {
            out.println("<h2 style='color:red;'>Registration failed. Check Server Console or Database Connection.</h2>");
        }
    }
}