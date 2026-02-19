<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hot Deals | BrewWare</title>
    <link rel="stylesheet" type="text/css" href="css/dstyle.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="content">
        <h1 style="color: #d9534f;">🔥 Exclusive Hot Deals</h1>
        <p>Click on any banner to add the deal to your menu or cart.</p>
        
        <div class="vertical-scroll-container">
            
           <div class="image-box deal-card" onclick="addToCart('2 Cheesy Chicken burger')">
                <img src="image/burger1.jpg" alt="Burger Deal">
                <div class="label">
                    <span class="discount-tag">ONLY ₹439</span>
                    <br>2 Cheesy Chicken burger
                </div>
            </div>

             <div class="image-box deal-card" onclick="addToCart('Veggie Burger + Large Fries')">
                <img src="image/veg burger.jpg" alt="Burger Deal">
                <div class="label">
                    <span class="discount-tag">ONLY ₹189</span>
                    <br>Veggie Burger + Large Friesk
                </div>
            </div>

            <div class="image-box deal-card" onclick="addToCart('Peri-Peri Fries Bucket')">
                <img src="image/everyday.jpg" alt="Fries Deal">
                <div class="label">
                    <span class="discount-tag">ONLY ₹999</span>
                    <br>Monster Peri-Peri Fries
                </div>
            </div>

            <div class="image-box deal-card" onclick="addToCart('2 Cheesy Chicken burger')">
                <img src="image/burger1.jpg" alt="Burger Deal">
                <div class="label">
                    <span class="discount-tag">ONLY ₹439</span>
                    <br>2 Cheesy Chicken burger
                </div>
            </div>

            <div class="image-box deal-card" onclick="addToCart('Veggie Burger + Medium Fries')">
                <img src="image/veg burger.jpg" alt="Burger Deal">
                <div class="label">
                    <span class="discount-tag">ONLY ₹164</span>
                    <br>Veggie Burger + Medium Fries
                </div>
            </div>

             <div class="image-box deal-card" onclick="addToCart('Veggie Burger + Small Fries')">
                <img src="image/veg burger.jpg" alt="Burger Deal">
                <div class="label">
                    <span class="discount-tag">ONLY ₹148</span>
                    <br>Veggie Burger + Small Fries
                </div>
            </div>

             <div class="image-box deal-card" onclick="addToCart('Veggie Burger + Large Fries')">
                <img src="image/veg burger.jpg" alt="Burger Deal">
                <div class="label">
                    <span class="discount-tag">ONLY ₹189</span>
                    <br>Veggie Burger + Large Friesk
                </div>
            </div>

        </div>
    </div>

   <script>
function addToCart(itemName, price) {
    const params = new URLSearchParams();
    params.append('dealName', itemName);
    params.append('price', price);

    fetch('AddToCart', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: params
    })
    .then(response => response.text())
    .then(data => {
        alert(data); // This shows your "Success!" message
        // This is the key part to show the new item on cart.jsp
        window.location.href = "cart.jsp"; 
    })
    .catch(error => alert("Error: " + error));
}
</script>
</body>
</html>