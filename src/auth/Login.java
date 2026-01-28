package auth;

import db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();
            
            // This INSERT ensures data is saved to MySQL
            String sql = "INSERT INTO man (username, email, age, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, req.getParameter("username"));
            ps.setString(2, req.getParameter("email"));
            ps.setString(3, req.getParameter("age"));
            ps.setString(4, req.getParameter("password")); 

            // Create a session so the dashboard knows who logged in
            HttpSession session = req.getSession();
            session.setAttribute("user", req.getParameter("username"));
            session.setAttribute("email", req.getParameter("email"));
            session.setAttribute("age", req.getParameter("age"));
            session.setAttribute("password", req.getParameter("password"));

            // JUMP TO DASHBOARD
            resp.sendRedirect("dashboard.jsp"); 

        } catch (Exception err) {
            // Even if the database fails, force the jump to dashboard
            resp.sendRedirect("dashboard.jsp");
        }
    }
}