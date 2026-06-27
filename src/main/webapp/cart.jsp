<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart, com.tap.model.CartItem, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Order - Instant Foods</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:ital,wght@0,400;0,500;0,700;1,400&family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Work+Sans:wght@400&display=swap');

    :root {
      /* Graza Colors */
      --color-olive-ink: #3c422e;
      --color-linen-cream: #fff4ec;
      --color-buttery-peach: #f6e6d9;
      --color-squeeze-bottle-green: #9eef80;
      --color-evoo-yellow-green: #d1e030;
      --color-mustard-sun: #fbd535;

      /* Graza Fonts */
      --font-typewriter: 'IBM Plex Serif', serif;
      --font-display: 'Playfair Display', serif;
      --font-badge: 'Work Sans', sans-serif;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      background-color: var(--color-linen-cream);
      color: var(--color-olive-ink);
      font-family: var(--font-typewriter);
      -webkit-font-smoothing: antialiased;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Typography */
    .text-display { font-family: var(--font-display); font-size: 80px; line-height: 0.9; letter-spacing: -2px; }
    .text-heading-sm { font-family: var(--font-display); font-size: 36px; line-height: 1; }
    .text-body { font-size: 18px; line-height: 1.5; font-weight: 400; }
    .text-nav { font-size: 16px; font-weight: 500; text-decoration: none; color: var(--color-olive-ink); }
    .text-badge { font-family: var(--font-badge); font-size: 13px; text-transform: uppercase; letter-spacing: normal; }

    /* Layout */
    .container { max-width: 1200px; margin: 0 auto; width: 100%; padding: 40px 30px; }
    nav { display: flex; justify-content: space-between; align-items: center; padding-bottom: 40px; border-bottom: 1px solid var(--color-olive-ink); margin-bottom: 40px; }

    /* UI Components */
    .btn-primary {
      background-color: var(--color-evoo-yellow-green);
      color: var(--color-olive-ink);
      border-radius: 10px;
      padding: 16px 24px;
      font-family: var(--font-typewriter);
      font-size: 16px;
      font-weight: 700;
      text-transform: uppercase;
      border: 1px solid var(--color-olive-ink);
      cursor: pointer;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      transition: transform 0.2s;
    }
    .btn-primary:hover { transform: translateY(-2px); }

    .qty-btn {
      background: transparent;
      border: none;
      font-size: 24px;
      cursor: pointer;
      padding: 0 16px;
      color: var(--color-olive-ink);
      font-family: var(--font-typewriter);
    }
  </style>
</head>
<body>

  <div class="container">
    
    <nav>
      <a href="restaurant" class="text-nav">← Back to Kitchens</a>
      <a href="restaurant" class="text-display" style="font-size: 32px; letter-spacing: normal; text-decoration: none; color: inherit;">GRAZA EATS</a>
      <span class="text-nav">Cart</span>
    </nav>

    <h1 class="text-display" style="margin-bottom: 60px; text-align: center;">YOUR ORDER</h1>

    <%
        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId=(Integer)(session.getAttribute("restaurantId"));
        Map<Integer, CartItem> items = (cart != null) ? cart.getItems() : null;
        double grandTotal = 0.0;

        if (items != null && !items.isEmpty()) {
    %>
    
    <div style="display: flex; gap: 60px; align-items: flex-start; flex-wrap: wrap;">
      
      <div style="flex: 2; min-width: 500px;">
        <%
            for(CartItem item : items.values()) {
                int currentQty = item.getQuantity();
                double itemTotal = item.getPrice() * currentQty;
                grandTotal += itemTotal;
        %>
        
        <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--color-olive-ink); padding: 32px 0;">
          
          <div style="flex: 1;">
            <h3 class="text-heading-sm" style="margin-bottom: 8px;"><%= item.getName() %></h3>
            <span class="text-nav" style="opacity: 0.7;">$<%= String.format("%.2f", (double)item.getPrice()) %> each</span>
          </div>

          <div style="display: flex; align-items: center; border: 1px solid var(--color-olive-ink); padding: 4px; border-radius: 9999px; margin: 0 32px;">
            <form action="CartServlet" method="POST" style="margin: 0;">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
              <input type="hidden" name="quantity" value="<%= currentQty - 1 %>">
              <input type="hidden" name="restaurantId" value="<%= restaurantId  %>">
              <button type="submit" class="qty-btn">−</button>
            </form>

            <div class="text-body" style="width: 30px; text-align: center; font-weight: 700;"><%= currentQty %></div>

            <form action="CartServlet" method="POST" style="margin: 0;">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
              <input type="hidden" name="quantity" value="<%= currentQty + 1 %>">
              <input type="hidden" name="restaurantId" value="<%= restaurantId  %>">
              <button type="submit" class="qty-btn">+</button>
            </form>
          </div>

          <div style="text-align: right; width: 120px;">
            <div class="text-body" style="font-size: 24px; font-weight: 700; margin-bottom: 8px;">$<%= String.format("%.2f", itemTotal) %></div>
            <form action="CartServlet" method="POST" style="margin: 0;">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
              <input type="hidden" name="restaurantId" value="<%= restaurantId  %>">
              <button type="submit" style="background: transparent; border: none; font-size: 12px; color: var(--color-olive-ink); text-transform: uppercase; cursor: pointer; text-decoration: underline; font-family: var(--font-typewriter);">Remove</button>
            </form>
          </div>
          
        </div>
        <% } %>
      </div>

      <div style="flex: 1; min-width: 350px; background-color: var(--color-buttery-peach); border: 1px solid var(--color-olive-ink); border-radius: 20px; padding: 40px;">
        <div class="text-badge" style="margin-bottom: 24px;">* Order Summary *</div>
        
        <div style="display: flex; justify-content: space-between; margin-bottom: 16px;">
          <span class="text-body">Subtotal</span>
          <span class="text-body" style="font-weight: 700;">$<%= String.format("%.2f", grandTotal) %></span>
        </div>
        <div style="display: flex; justify-content: space-between; margin-bottom: 32px; border-bottom: 1px solid var(--color-olive-ink); padding-bottom: 32px;">
          <span class="text-body">Delivery</span>
          <span class="text-body" style="font-style: italic;">Calculated next</span>
        </div>
        
        <div style="display: flex; justify-content: space-between; margin-bottom: 40px;">
          <span class="text-heading-sm" style="font-size: 32px;">Total</span>
          <span class="text-heading-sm" style="font-size: 32px;">$<%= String.format("%.2f", grandTotal) %></span>
        </div>

        <a href="checkout.jsp" class="btn-primary" style="width: 100%;">Proceed to Checkout →</a>
      </div>

    </div>

    <% } else { %>
    
    <div style="text-align: center; padding: 80px 0;">
      <h3 class="text-heading-sm" style="margin-bottom: 24px;">Your cart is hungry.</h3>
      <a href="restaurant" class="btn-primary" style="display: inline-block;">Explore Local Kitchens</a>
    </div>

    <% } %>

  </div>

</body>
</html>