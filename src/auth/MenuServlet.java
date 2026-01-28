package auth; // Ensure this matches your package structure

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DBConnection; // Import your DB class

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("itemName");
        double price = Double.parseDouble(req.getParameter("price"));
        String category = req.getParameter("category");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO menu_items (name, price, category) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, category);
            
            ps.executeUpdate();
            resp.sendRedirect("addMenu.jsp?status=success");
        } catch (Exception e) {
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}