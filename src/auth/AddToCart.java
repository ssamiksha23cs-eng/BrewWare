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

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response encoding to handle currency symbols correctly
        response.setContentType("text/plain;charset=UTF-8");
        
        // 1. Get parameters from the request
        String dealName = request.getParameter("dealName");
        String priceStr = request.getParameter("itemPrice"); // Matches your JS params
        
        // 2. Get the session ID to link the item to the specific user
        HttpSession session = request.getSession(true);
        String sessionId = session.getId(); 

        // Console Debugging
        System.out.println("DEBUG: Adding [" + dealName + "] Price [" + priceStr + "] for Session: " + sessionId);

        if (dealName == null || dealName.isEmpty() || priceStr == null || priceStr.isEmpty()) {
            response.getWriter().write("Error: Missing item details.");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();
            
            // 3. SQL Query explicitly targeting the 'price' column
            String query = "INSERT INTO cart (item_name, price, session_id) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, dealName);
            
            // 4. Safely convert price string to integer
            int priceValue = Integer.parseInt(priceStr.trim());
            ps.setInt(2, priceValue); // This fills the column that was showing NULL
            
            ps.setString(3, sessionId);
            
            int rows = ps.executeUpdate();
            
            if(rows > 0) {
                // Success message returns to your JavaScript alert box
                response.getWriter().write("Success! " + dealName + " added at ₹" + priceValue);
            } else {
                response.getWriter().write("Failed to save item.");
            }
            
            con.close();
        } catch (NumberFormatException nfe) {
            response.getWriter().write("Error: Price must be a number.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Database Error: " + e.getMessage());
        }
    }
}