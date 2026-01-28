package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import db.DBConnection;

@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        
        try {
            Connection con = DBConnection.getConnection();
            
            // 1. Move items from cart to orders table
            String moveSql = "INSERT INTO orders (item_name, price, session_id) " +
                             "SELECT item_name, price, session_id FROM cart WHERE session_id = ?";
            PreparedStatement psMove = con.prepareStatement(moveSql);
            psMove.setString(1, sessionId);
            psMove.executeUpdate();
            
            // 2. Clear the cart for this user after confirming
            String clearSql = "DELETE FROM cart WHERE session_id = ?";
            PreparedStatement psClear = con.prepareStatement(clearSql);
            psClear.setString(1, sessionId);
            psClear.executeUpdate();
            
            con.close();
            response.getWriter().write("Success! Your order has been confirmed.");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}