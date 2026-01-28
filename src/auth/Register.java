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
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        try {
            // Get data from your JSP form
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String ageStr = req.getParameter("age");
            String pass = req.getParameter("password");

            // Connect to DB
           Connection con = DBConnection.getConnection();
            
            if (con == null) {
                out.println("<h2 style='color:red;'>Error: Connection is NULL. Check DBConnection.java details.</h2>");
                return;
            }
            
            // Insert into your 'users' table
            String sql = "INSERT INTO users (username, email, age, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setInt(3, Integer.parseInt(ageStr));
            ps.setString(4, pass);

            int result = ps.executeUpdate(); 

            if (result > 0) {
                out.println("<script>alert('Successfully Registered!'); window.location.href='dashboard.jsp';</script>");
            } else {
                out.println("<h3>Registration failed.</h3>");
            }
            con.close();

        } catch (Exception e) {
    out.println("<h2 style='color:red;'>Database Error Details:</h2>");
    out.println("<p>" + e.getMessage() + "</p>");
    e.printStackTrace();
}
    }
}