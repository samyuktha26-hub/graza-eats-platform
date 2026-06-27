<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Restaurant, java.util.List, com.tap.model.User, com.tap.model.Cart, com.tap.model.CartItem, com.tap.DAOImpl.FavoriteDAOImpl" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home - Instant Foods</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:ital,wght@0,400;0,500;0,700;1,400&family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Work+Sans:wght@400&display=swap');

    :root {
      --color-olive-ink: #3c422e;
      --color-linen-cream: #fff4ec;
      --color-buttery-peach: #f6e6d9;
      --color-squeeze-bottle-green: #9eef80;
      --color-evoo-yellow-green: #d1e030;
      --color-mustard-sun: #fbd535;
      --font-typewriter: 'IBM Plex Serif', serif;
      --font-display: 'Playfair Display', serif;
      --font-badge: 'Work Sans', sans-serif;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { background-color: var(--color-linen-cream); color: var(--color-olive-ink); font-family: var(--font-typewriter); }

    .text-display { font-family: var(--font-display); font-size: 120px; line-height: 0.9; letter-spacing: -3.72px; }
    .text-heading-sm { font-family: var(--font-display); font-size: 38px; line-height: 1; letter-spacing: -0.97px; }
    .text-body { font-size: 16px; line-height: 1.5; font-weight: 400; }
    .text-nav { font-size: 16px; font-weight: 500; text-decoration: none; color: var(--color-olive-ink); }
    .text-badge { font-family: var(--font-badge); font-size: 13px; text-transform: uppercase; }

    .section-band-mustard { background-color: var(--color-mustard-sun); padding: 64px 30px; }
    .section-canvas { background-color: var(--color-linen-cream); padding: 64px 30px; }
    .container { max-width: 1200px; margin: 0 auto; }
    nav { display: flex; justify-content: space-between; align-items: center; padding: 30px; }
    
    .pill-nav { border-radius: 9999px; border: 1px solid var(--color-olive-ink); background-color: var(--color-linen-cream); padding: 8px 16px; text-decoration: none; color: var(--color-olive-ink); }
    .btn-ghost { background-color: transparent; border: 1px solid var(--color-olive-ink); border-radius: 10px; padding: 12px 24px; text-decoration: none; color: var(--color-olive-ink); display: inline-block; }
  </style>
</head>
<body>

  <%
      Cart cart = (Cart) session.getAttribute("cart");
      User user = (User) session.getAttribute("User");
      int totalItemsInCart = (cart != null && cart.getItems() != null) ? cart.getItems().size() : 0;
  %>

  <nav>
    <a href="restaurant" class="text-display" style="font-size: 32px; letter-spacing: normal; text-decoration: none; color: inherit;">GRAZA EATS</a>
    <div style="display: flex; gap: 24px; align-items: center;">
      <a href="ProfileServlet" class="text-nav">Profile</a>
      <a href="login.jsp" class="text-nav">Login</a>
      <a href="cart.jsp" class="pill-nav">Cart (<%= totalItemsInCart %>)</a>
    </div>
  </nav>
  <!-- The Yellow Header Section -->
  <div class="section-band-mustard" style="text-align: center;">
    <span class="text-badge">* FRESH TODAY *</span>
    <h1 class="text-display" style="margin: 20px 0;">LOCAL KITCHENS</h1>
    
    <!-- ADD THIS SEARCH BAR HERE -->
    <form action="restaurant" method="GET" style="margin-top: 30px; text-align: center;">
      <input type="text" name="search" placeholder="Search by cuisine (e.g., Italian, Burger)..." 
             style="padding: 14px 24px; border-radius: 9999px; border: 1px solid var(--color-olive-ink); width: 400px; font-family: var(--font-typewriter); font-size: 16px; outline: none;">
      <button type="submit" class="btn-primary" style="border-radius: 9999px; margin-left: 8px; padding: 14px 28px;">Search</button>
      
      <!-- Optional: A clear button if they want to reset the search -->
      <% if(request.getParameter("search") != null && !request.getParameter("search").isEmpty()) { %>
          <a href="restaurant" class="btn-ghost" style="border-radius: 9999px; margin-left: 8px; padding: 12px 24px;">Clear</a>
      <% } %>
    </form>
    <!-- END SEARCH BAR -->
  

  <div class="section-canvas">
    <div class="container" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 60px 40px;">
      
      <%
          List<Restaurant> allRestaurant = (List<Restaurant>) request.getAttribute("allRestaurant");
          FavoriteDAOImpl favDAO = new FavoriteDAOImpl();
          if (allRestaurant != null) {
              for (Restaurant restaurant : allRestaurant) {
                  boolean isFav = (user != null) && favDAO.isFavorite(user.getUserID(), restaurant.getRestaurantID());
      %>
      
      <div style="display: flex; flex-direction: column; position: relative;">
        
        <a href="FavoriteServlet?restaurantId=<%= restaurant.getRestaurantID() %>" 
           style="position: absolute; top: 16px; right: 16px; z-index: 10; background: rgba(255,255,255,0.8); padding: 8px; border-radius: 50%; border: 1px solid var(--color-olive-ink);">
            <svg width="24" height="24" viewBox="0 0 24 24" 
                 fill="<%= isFav ? "#d32f2f" : "none" %>" 
                 stroke="#3c422e" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
            </svg>
        </a>

        <img src="<%= restaurant.getImageURL() %>" alt="<%= restaurant.getName() %>" 
             style="height: 250px; width: 100%; object-fit: cover; border-radius: 20px; margin-bottom: 16px; border: 1px solid var(--color-olive-ink);">
        
        <div style="margin-bottom: 8px;">
            <span class="text-badge" style="color: <%= restaurant.getIsActive() == 1 ? "var(--color-olive-ink)" : "#808080" %>;">
                <%= restaurant.getIsActive() == 1 ? "* ACCEPTING ORDERS *" : "* CURRENTLY CLOSED *" %>
            </span>
        </div>
        
        <div style="display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 8px;">
          <h3 class="text-heading-sm"><%= restaurant.getName() %></h3>
          <span class="text-body" style="font-weight: 700;">★ <%= String.format("%.1f", restaurant.getRating()) %></span>
        </div>
        
        <p class="text-body" style="margin-bottom: 24px; line-height: 1.6; flex-grow: 1;">
          <%= restaurant.getCuisineType() %> <br>
          Delivery: <%= restaurant.getDeliveryTime() %> mins <br>
          Address: <%= restaurant.getAddress() %>
        </p>
        
        <a href="MenuServlet?id=<%= restaurant.getRestaurantID() %>" class="btn-ghost">View Menu →</a>
      </div>
      
      <%
              }
          }
      %>
    </div>
  </div>
  <!-- Chatbot UI -->
<div id="chat-widget" style="position:fixed; bottom:20px; right:20px; z-index:999;">
    <button onclick="toggleChat()" style="background:#3c422e; color:#fff; border-radius:50%; width:60px; height:60px; border:none; cursor:pointer;">Chat</button>
    <div id="chat-box" style="display:none; width:300px; height:400px; background:#fff4ec; border:1px solid #3c422e; border-radius:15px; padding:20px; overflow-y:auto; margin-bottom:10px;">
        <p><strong>Bot:</strong> How can I help?</p>
        <input type="text" id="chat-input" placeholder="Ask about delivery..." onkeydown="if(event.key==='Enter') sendMessage()" style="width:100%;">
    </div>
</div>

<script>
    function toggleChat() { document.getElementById('chat-box').style.display = document.getElementById('chat-box').style.display === 'none' ? 'block' : 'none'; }
    function sendMessage() {
        let input = document.getElementById('chat-input');
        let box = document.getElementById('chat-box');
        box.innerHTML += '<p><strong>You:</strong> ' + input.value + '</p>';
        
        let reply = "I'm not sure, but our team is ready to help!";
        if(input.value.toLowerCase().includes("delivery")) reply = "Orders arrive in 30-45 mins.";
        if(input.value.toLowerCase().includes("hours")) reply = "We are open 10 AM - 11 PM.";
        
        box.innerHTML += '<p><strong>Bot:</strong> ' + reply + '</p>';
        input.value = '';
    }
</script>
</body>
</html>