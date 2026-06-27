<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.User, com.tap.model.Order, com.tap.model.Restaurant, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Profile - Graza Eats</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:ital,wght@0,400;0,500;0,700;1,400&family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Work+Sans:wght@400;600&display=swap');

    :root {
      --color-olive-ink: #3c422e;
      --color-linen-cream: #fff4ec;
      --color-buttery-peach: #f6e6d9;
      --color-evoo-yellow-green: #d1e030;
      --font-typewriter: 'IBM Plex Serif', serif;
      --font-display: 'Playfair Display', serif;
      --font-badge: 'Work Sans', sans-serif;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { background-color: var(--color-linen-cream); color: var(--color-olive-ink); font-family: var(--font-typewriter); min-height: 100vh; display: flex; flex-direction: column; }
    
    .text-display { font-family: var(--font-display); font-size: 64px; line-height: 0.9; letter-spacing: -1.5px; }
    .text-heading-sm { font-family: var(--font-display); font-size: 32px; line-height: 1; margin-bottom: 16px; }
    .text-body { font-size: 16px; line-height: 1.5; font-weight: 400; }
    .text-nav { font-size: 16px; font-weight: 500; text-decoration: none; color: var(--color-olive-ink); }
    .text-badge { font-family: var(--font-badge); font-size: 13px; text-transform: uppercase; font-weight: 600; }

    .container { max-width: 1200px; margin: 0 auto; width: 100%; padding: 40px 30px; }
    nav { display: flex; justify-content: space-between; align-items: center; padding-bottom: 40px; border-bottom: 1px solid var(--color-olive-ink); margin-bottom: 60px; }

    .btn-primary { background-color: var(--color-evoo-yellow-green); color: var(--color-olive-ink); border-radius: 10px; padding: 10px 20px; font-family: var(--font-typewriter); font-size: 14px; font-weight: 700; text-transform: uppercase; border: 1px solid var(--color-olive-ink); cursor: pointer; text-decoration: none; display: inline-block; }
    .btn-ghost-danger { background-color: transparent; border: 1px solid #d32f2f; color: #d32f2f; border-radius: 10px; padding: 12px 24px; font-family: var(--font-typewriter); font-size: 14px; font-weight: 600; cursor: pointer; text-decoration: none; display: inline-block; }
    
    .order-card { background-color: var(--color-linen-cream); border: 1px solid var(--color-olive-ink); border-radius: 20px; padding: 24px; margin-bottom: 24px; display: flex; justify-content: space-between; align-items: center; }
  </style>
</head>
<body>

  <%
      User user = (User) session.getAttribute("User");
      if (user == null) { response.sendRedirect("login.jsp"); return; }
  %>

  <div class="container">
    <nav>
      <a href="restaurant" class="text-nav">← Back to Kitchens</a>
      <a href="restaurant" class="text-display" style="font-size: 32px; text-decoration: none; color: inherit;">GRAZA EATS</a>
      <span class="text-nav">Profile</span>
    </nav>

    <div style="display: flex; gap: 80px; align-items: flex-start; flex-wrap: wrap;">
      
      <div style="flex: 1; min-width: 300px; background-color: var(--color-buttery-peach); border-radius: 20px; padding: 40px; border: 1px solid var(--color-olive-ink);">
        <div class="text-badge" style="margin-bottom: 24px;">* Account Details *</div>
        <h2 class="text-display" style="font-size: 48px; margin-bottom: 24px;"><%= user.getUserName() %></h2>
        <div style="margin-bottom: 40px;">
          <p class="text-body" style="margin-bottom: 8px;"><strong>Email:</strong> <%= user.getEmail() %></p>
          <p class="text-body"><strong>Address:</strong> <%= user.getAddress() %></p>
        </div>
        <a href="LogoutServlet" class="btn-ghost-danger">Log Out</a>
      </div>

      <div style="flex: 2; min-width: 500px;">
        
        <h1 class="text-heading-sm">Order History</h1>
        <%
            List<Order> orderHistory = (List<Order>) request.getAttribute("orderHistory");
            if (orderHistory != null && !orderHistory.isEmpty()) {
                for (Order pastOrder : orderHistory) {
        %>
        <div class="order-card">
          <div>
            <div class="text-badge">Order #<%= pastOrder.getOrderID() %></div>
            <div class="text-body"><strong>Total:</strong> $<%= String.format("%.2f", pastOrder.getTotalAmount()) %> | <strong>Status:</strong> <%= pastOrder.getStatus() %></div>
          </div>
          <a href="ReorderServlet?orderId=<%= pastOrder.getOrderID() %>" class="btn-primary">Reorder</a>
        </div>
        <% } } else { %>
        <div style="padding: 24px; border: 1px dashed var(--color-olive-ink); border-radius: 20px; text-align: center; margin-bottom: 60px;">
          <p class="text-body">No orders yet. Let's get something delicious!</p>
        </div>
        <% } %>

        <h1 class="text-heading-sm">Saved Kitchens</h1>
        <%
            List<Restaurant> favorites = (List<Restaurant>) request.getAttribute("favorites");
            if (favorites != null && !favorites.isEmpty()) {
                for (Restaurant fav : favorites) {
        %>
        <div class="order-card" style="padding: 20px;">
          <div style="display: flex; align-items: center; gap: 20px;">
            <img src="<%= fav.getImageURL() %>" style="width: 70px; height: 70px; object-fit: cover; border-radius: 10px;">
            <div>
              <h3 class="text-heading-sm" style="font-size: 18px; margin-bottom: 4px;"><%= fav.getName() %></h3>
              <p class="text-body" style="font-size: 14px;"><%= fav.getCuisineType() %></p>
            </div>
          </div>
          <a href="MenuServlet?id=<%= fav.getRestaurantID() %>" class="btn-primary" style="padding: 8px 16px;">View Menu</a>
        </div>
        <% } } else { %>
        <div style="padding: 24px; border: 1px dashed var(--color-olive-ink); border-radius: 20px; text-align: center;">
          <p class="text-body">No favorites yet. Tap the heart to save your top picks!</p>
        </div>
        <% } %>

      </div>
    </div>
  </div>
</body>
</html>