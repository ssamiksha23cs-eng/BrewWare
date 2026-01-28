package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import db.DBConnection;

@WebServlet("/OrderHistory")
public class OrderHistory extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        
        try {
            Connection con = DBConnection.getConnection();
            // Fetch finalized orders for the current session
            String sql = "SELECT * FROM orders WHERE session_id = ? ORDER BY order_date DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sessionId);
            
            ResultSet rs = ps.executeQuery();
            request.setAttribute("orderResultSet", rs); // Pass result to JSP
            
            // Forward to the history page
            request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error loading history: " + e.getMessage());
        }
    }
}