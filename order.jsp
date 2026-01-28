<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>BrewWare | Order History</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container" style="padding: 20px;">
        <h2>📜 Your Order History</h2>
        <table border="1" style="width:100%; border-collapse: collapse; margin-top: 20px;">
            <tr style="background-color: #f2f2f2;">
                <th>Order ID</th>
                <th>Item Name</th>
                <th>Price</th>
                <th>Date & Time</th>
            </tr>
            <%
                ResultSet rs = (ResultSet) request.getAttribute("orderResultSet");
                boolean hasHistory = false;
                if (rs != null) {
                    while(rs.next()) {
                        hasHistory = true;
            %>
            <tr>
                <td style="padding: 10px; text-align: center;"><%= rs.getInt("order_id") %></td>
                <td style="padding: 10px;"><%= rs.getString("item_name") %></td>
                <td style="padding: 10px;">₹<%= rs.getInt("price") %></td>
                <td style="padding: 10px;"><%= rs.getTimestamp("order_date") %></td>
            </tr>
            <% 
                    }
                }
                if (!hasHistory) {
                    out.println("<tr><td colspan='4' style='text-align:center; padding:20px;'>No previous orders found.</td></tr>");
                }
            %>
        </table>
        <br>
        <a href="viewMenu.jsp" class="back-btn">Back to Menu</a>
    </div>
</body>
</html>