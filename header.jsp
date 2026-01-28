<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    /* General Page Styling */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #fdf8f3; /* Light Cream */
            color: #502314; /* Coffee Brown */
        }
    /* Top Navigation Bar */
        .navbar {
            display: flex;
            justify-content: space-between; /* Pushes content to opposite ends */
            align-items: center;
            padding: 20px 50px;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            border-bottom: 3px solid #eaddcf;
        }

        .welcome-msg {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }

    /* Right Side Panels (Navigation) */
        .nav-panels {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 20px; /* Space between the links */
        }

        .nav-panels li a {
            text-decoration: none;
            color: white;
            background-color: #502314; /* Dark Coffee */
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .nav-panels li a:hover {
            background-color: #7a3e2a;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        /* Main Content Area */
        .content {
            padding: 50px;
            text-align: center;
        }
</style>

<nav class="navbar">
    <div ></div>
    <ul class="nav-panels">
        <li class="nav-home"><a href="dashboard.jsp">Home</a></li>
        <li><a href="viewMenu.jsp">Menu</a></li>
        <li class="nav-deals"><a href="deals.jsp">Deals</a></li>
        <li><a href="order.jsp">Orders</a></li>
        <li><a href="cart.jsp">Cart</a></li>
    </ul>
</nav>