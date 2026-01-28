<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BrewWare | Digital Order Kiosk</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
<div class="header">
    <h1>BREWWARE DIGITAL CAFE</h1>
    <p>Modern Snacks • Premium Coffee • Instant Order</p>
</div>

<% 
    // Get current category from URL to highlight it
    String currentCat = request.getParameter("cat"); 
    if(currentCat == null) currentCat = "";
%>

<div class="main-layout">
    
    <div class="category-sidebar">
        <h2 class="sidebar-title">Explore Menu</h2>

        <div class="category-card <%= currentCat.equals("Mains") ? "active" : "" %>" onclick="location.href='?cat=Mains'">
            <div class="cat-image-box">
                <img src="category-images/gourmet.jpg" alt="Mains">
            </div>
            <div class="cat-info">
                <h3>Gourmet Mains</h3>
                <p>Pizzas & Burgers</p>
            </div>
        </div>

        <div class="category-card <%= currentCat.equals("Snacks") ? "active" : "" %>" onclick="location.href='?cat=Snacks'">
            <div class="cat-image-box">
                <img src="category-images/snacks.jpg" alt="Snacks">
            </div>
            <div class="cat-info">
                <h3>Snacks & Sides</h3>
                <p>Fries & Finger Foods</p>
            </div>
        </div>

        <div class="category-card <%= currentCat.equals("Bakes") ? "active" : "" %>" onclick="location.href='?cat=Bakes'">
            <div class="cat-image-box">
                <img src="category-images/toast.jpg" alt="Bakes">
            </div>
            <div class="cat-info">
                <h3>Toasts & Bakes</h3>
                <p>Artisan Toasts</p>
            </div>
        </div>

        <div class="category-card <%= currentCat.equals("Desserts") ? "active" : "" %>" onclick="location.href='?cat=Desserts'">
            <div class="cat-image-box">
                <img src="category-images/dessert.jpg" alt="Desserts">
            </div>
            <div class="cat-info">
                <h3>Desserts</h3>
                <p>Sweet Treats</p>
            </div>
        </div>

        <div class="category-card <%= currentCat.equals("Cookies") ? "active" : "" %>" onclick="location.href='?cat=Cookies'">
            <div class="cat-image-box">
                <img src="category-images/Brownie-cookie.jpg" alt="Cookies">
            </div>
            <div class="cat-info">
                <h3>Brownies & Cookies</h3>
                <p>Fudgy Treats</p>
            </div>
        </div>

        <div class="category-card <%= currentCat.equals("Coffee") ? "active" : "" %>" onclick="location.href='?cat=Coffee'">
            <div class="cat-image-box">
                <img src="category-images/coffee.jpg" alt="Coffee">
            </div>
            <div class="cat-info">
                <h3>Coffee</h3>
                <p>Premium Brews</p>
            </div>
        </div>

        <div class="category-card <%= currentCat.equals("Beverages") ? "active" : "" %>" onclick="location.href='?cat=Beverages'">
            <div class="cat-image-box">
                <img src="category-images/beverages.jpg" alt="Beverages">
            </div>
            <div class="cat-info">
                <h3>Beverages</h3>
                <p>Chilled Shakes</p>
            </div>
        </div>
    </div>

    <div class="content-display">
    <% 
        String cat = request.getParameter("cat");
        if(cat != null && !cat.isEmpty()) { 
    %>
        <h2 class="sidebar-title">Showing: <%= cat %></h2>
        <div class="items-grid">
            <%
                try {
                    // Use the import we added in Step 1
                    Connection con = DBConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM menu_items WHERE category = ?");
                    ps.setString(1, cat);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()) {
                        String name = rs.getString("name");
                        int price = rs.getInt("price");
                        // Logic to add icons based on name
                        String dietIcon = (name.contains("Chicken") || name.contains("BBQ")) ? "🍗" : "🌱";
            %>
                <div class="food-card">
                    <div class="food-circle">
                        <img src="<%= rs.getString("image_path") %>" onerror="this.src='category-images/gourmet.jpg'">
                    </div>
                    <div class="food-details">
                        <h4><%= dietIcon %> <%= name %></h4>
                        <p class="item-price">₹<%= price %></p>
                        <button class="add-btn" onclick="addToCart('<%= name %>', '<%= price %>')">ADD +</button>
                    </div>
                </div>
            <%
                    }
                    con.close();
                } catch(Exception e) { 
                    out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>"); 
                }
            %>
        </div>
    <% } else { %>
        <div class="welcome-box">
            <h2>Welcome to BrewWare</h2>
            <p>Select a category to view items</p>
        </div>
    <% } %>
</div>
</div>
<script>
function addToCart(itemName, price) {
    const params = new URLSearchParams();
    params.append('dealName', itemName);
    params.append('itemPrice', price);

    // This ensures it hits /BrewWare/AddToCart instead of just /AddToCart
    fetch('AddToCart', { 
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: params
    })
    .then(response => {
        if(response.status === 404) {
            alert("Error 404: Servlet not found. Check your URL mapping!");
        }
        return response.text();
    })
    .then(data => {
        alert(data); // This should now say "Success! ... added at ₹XXX"
        window.location.href = "cart.jsp";
    });
}
</script>

</div>

</body>
</html>