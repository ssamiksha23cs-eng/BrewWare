<%@ page import="java.sql.*, db.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>BrewWare | Your Cart</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container" style="padding: 20px;">
        <h2>🛒 Your Selected Deals</h2>
        <table border="1" style="width:100%; border-collapse: collapse; margin-top: 20px;">
            <tr style="background-color: #f2f2f2;">
                <th>ID</th>
                <th>Deal Name</th>
                <th>Price</th>
            </tr>
            <%
                String currentSessionId = session.getId(); 
                boolean itemFound = false;
                int totalBill = 0; 

                try {
                    Connection con = DBConnection.getConnection();
                    String sql = "SELECT * FROM cart WHERE session_id = ? ORDER BY added_at DESC";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, currentSessionId);
                    
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                        itemFound = true;
                        // Use lowercase 'price' to match the 'totalBill' line below
                        int price = rs.getInt("price"); 
                        totalBill += price; 
            %>
            <tr>
                <td style="padding: 10px; text-align: center;"><%= rs.getInt("id") %></td>
                <td style="padding: 10px;"><%= rs.getString("item_name") %></td>
                <td style="padding: 10px;">₹<%= price %></td>
            </tr>
            <% 
                    }
                    
                    if (itemFound) {
            %>
            <tr style="background-color: #eee; font-weight: bold;">
                <td colspan="2" style="text-align: right; padding: 10px;">Grand Total:</td>
                <td style="padding: 10px;">₹<%= totalBill %></td>
            </tr>
            <%
                    } else {
                        out.println("<tr><td colspan='3' style='text-align:center; padding:20px;'>Your cart is currently empty.</td></tr>");
                    }
                    con.close();
                } catch(Exception e) { 
                    out.print("<tr><td colspan='3' style='color:red;'>Error: " + e.getMessage() + "</td></tr>"); 
                }
            %>
        </table>

        <div style="text-align: right; margin-top: 20px;">
            <% if (itemFound) { %>
                <button onclick="confirmOrder()" style="background-color: #28a745; color: white; padding: 12px 24px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold;">
                    ✅ Confirm Order
                </button>
            <% } %>
        </div>

        <br>
        <a href="viewMenu.jsp" class="back-btn">Back to Menu</a> | 
        <a href="deals.jsp" class="back-btn">Back to Deals</a>
    </div>

    <script>
    function confirmOrder() {
        if(confirm("Confirm your order for ₹<%= totalBill %>?")) {
            // Using the full path to avoid 404 errors
            fetch('ConfirmOrder', { method: 'POST' })
            .then(response => {
                if (!response.ok) throw new Error("Order service not found (404)");
                return response.text();
            })
            .then(data => {
                alert(data);
                window.location.href = "viewMenu.jsp"; 
            })
            .catch(err => alert("Error: " + err.message));
        }
    }
    </script>
</body>
</html>