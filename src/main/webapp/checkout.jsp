<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart, com.tap.model.CartItem, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Checkout - Instant Foods</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:ital,wght@0,400;0,500;0,700;1,400&family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Work+Sans:wght@400;600&display=swap');

    :root {
      /* Graza Colors */
      --color-olive-ink: #3c422e;
      --color-linen-cream: #fff4ec;
      --color-buttery-peach: #f6e6d9;
      --color-squeeze-bottle-green: #9eef80;
      --color-evoo-yellow-green: #d1e030;
      
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
    .text-display { font-family: var(--font-display); font-size: 64px; line-height: 0.9; letter-spacing: -1.5px; }
    .text-heading-sm { font-family: var(--font-display); font-size: 32px; line-height: 1; }
    .text-body { font-size: 16px; line-height: 1.5; font-weight: 400; }
    .text-nav { font-size: 16px; font-weight: 500; text-decoration: none; color: var(--color-olive-ink); }
    .text-badge { font-family: var(--font-badge); font-size: 13px; text-transform: uppercase; letter-spacing: 0.05em; font-weight: 600; }

    /* Layout */
    .container { max-width: 1200px; margin: 0 auto; width: 100%; padding: 40px 30px; }
    nav { display: flex; justify-content: space-between; align-items: center; padding-bottom: 40px; border-bottom: 1px solid var(--color-olive-ink); margin-bottom: 60px; }

    /* Forms */
    .form-group { margin-bottom: 24px; }
    label { display: block; font-family: var(--font-badge); font-size: 12px; margin-bottom: 8px; color: var(--color-olive-ink); }
    
    input[type="text"], input[type="email"], input[type="tel"], textarea {
      width: 100%;
      background: transparent;
      border: 1px solid var(--color-olive-ink);
      border-radius: 8px;
      padding: 16px;
      font-family: var(--font-typewriter);
      font-size: 16px;
      color: var(--color-olive-ink);
      transition: background-color 0.2s;
    }
    input:focus, textarea:focus { outline: none; background-color: var(--color-buttery-peach); }
    
    .row { display: flex; gap: 24px; }
    .col { flex: 1; }

    /* UI Components */
    .btn-primary {
      background-color: var(--color-evoo-yellow-green);
      color: var(--color-olive-ink);
      border-radius: 10px;
      padding: 20px 32px;
      font-family: var(--font-typewriter);
      font-size: 18px;
      font-weight: 700;
      text-transform: uppercase;
      border: 1px solid var(--color-olive-ink);
      cursor: pointer;
      text-align: center;
      width: 100%;
      display: inline-block;
      transition: transform 0.2s;
    }
    .btn-primary:hover { transform: translateY(-2px); }

    .summary-box {
      background-color: var(--color-squeeze-bottle-green);
      border: 1px solid var(--color-olive-ink);
      border-radius: 20px;
      padding: 40px;
      position: sticky;
      top: 40px;
    }
  </style>
</head>
<body>

  <div class="container">
    
    <nav>
      <a href="cart.jsp" class="text-nav">← Back to Cart</a>
      <a href="restaurant" class="text-display" style="font-size: 32px; letter-spacing: normal; text-decoration: none; color: inherit;">GRAZA EATS</a>
      <span class="text-nav">Checkout</span>
    </nav>

    <%
        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId=(Integer)session.getAttribute("restaurantId");
        Map<Integer, CartItem> items = (cart != null) ? cart.getItems() : null;
        
        // If they somehow got to checkout with an empty cart, boot them back to the restaurants
        if (items == null || items.isEmpty()) {
            response.sendRedirect("restaurant");
            return;
        }

        double subtotal = 0.0;
        double deliveryFee = 5.00; // Standard flat delivery rate
        double platformFee=5.0;
    %>

    <div style="display: flex; gap: 80px; align-items: flex-start; flex-wrap: wrap;">
      
      <div style="flex: 2; min-width: 500px;">
        <h1 class="text-display" style="margin-bottom: 40px;">DELIVERY DETAILS</h1>
        
        <form action="OrderServlet" method="POST">
          
          <div class="text-badge" style="margin-bottom: 24px; border-bottom: 1px solid var(--color-olive-ink); padding-bottom: 8px;">Contact Info</div>
          
          <div class="form-group">
            <label>FULL NAME</label>
            <input type="text" name="customerName" required placeholder="Jane Doe">
          </div>
          
          <div class="row">
            <div class="col form-group">
              <label>EMAIL</label>
              <input type="email" name="customerEmail" required placeholder="jane@example.com">
            </div>
            <div class="col form-group">
              <label>PHONE NUMBER</label>
              <input type="tel" name="customerPhone" required placeholder="(555) 123-4567">
            </div>
          </div>

          <div class="text-badge" style="margin-top: 40px; margin-bottom: 24px; border-bottom: 1px solid var(--color-olive-ink); padding-bottom: 8px;">Delivery Address</div>

          <div class="form-group">
            <label>STREET ADDRESS</label>
            <input type="text" name="address" required placeholder="123 Olive Oil Lane, Apt 4B">
          </div>

          <div class="row">
            <div class="col form-group">
              <label>CITY</label>
              <input type="text" name="city" required placeholder="Sizzle Town">
            </div>
            <div class="col form-group">
              <label>ZIP CODE</label>
              <input type="text" name="zipCode" required placeholder="12345">
            </div>
          </div>

          <div class="form-group" style="margin-top: 24px;">
            <label>DELIVERY INSTRUCTIONS (OPTIONAL)</label>
            <textarea name="instructions" rows="3" placeholder="Leave at the front desk, ring doorbell, etc..."></textarea>
          </div>

          <div class="text-badge" style="margin-top: 40px; margin-bottom: 24px; border-bottom: 1px solid var(--color-olive-ink); padding-bottom: 8px;">Payment Method</div>
          
          <div class="form-group" style="display: flex; gap: 24px;">
            <label style="display: flex; align-items: center; gap: 8px; font-size: 16px; font-family: var(--font-typewriter); text-transform: none; cursor: pointer;">
              <input type="radio" name="paymentMode" value="Card" required style="width: 20px; height: 20px; accent-color: var(--color-olive-ink);">
              Credit Card (Pay Online)
            </label>
            <label style="display: flex; align-items: center; gap: 8px; font-size: 16px; font-family: var(--font-typewriter); text-transform: none; cursor: pointer;">
              <input type="radio" name="paymentMode" value="COD" required style="width: 20px; height: 20px; accent-color: var(--color-olive-ink);">
              Cash on Delivery
            </label>
          </div>

          <button type="submit" class="btn-primary" style="margin-top: 40px;">Place Order →</button>
        </form>
      </div>

      <div style="flex: 1; min-width: 350px;">
        <div class="summary-box">
          <div class="text-badge" style="margin-bottom: 32px; font-size: 16px;">* The Bill *</div>
          
          <div style="margin-bottom: 32px;">
            <%
                for(CartItem item : items.values()) {
                    double itemTotal = item.getPrice() * item.getQuantity();
                    subtotal += itemTotal;
            %>
            <div style="display: flex; justify-content: space-between; margin-bottom: 16px; font-family: var(--font-typewriter);">
              <span><%= item.getQuantity() %>x <%= item.getName() %></span>
              <span>$<%= String.format("%.2f", itemTotal) %></span>
            </div>
            <% } %>
          </div>
          
          <div style="border-top: 1px solid var(--color-olive-ink); padding-top: 24px; margin-bottom: 16px;">
            <div style="display: flex; justify-content: space-between; margin-bottom: 12px;">
              <span class="text-body">Subtotal</span>
              <span class="text-body">$<%= String.format("%.2f", subtotal) %></span>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 24px;">
              <span class="text-body">Delivery Fee</span>
              <span class="text-body">$<%= String.format("%.2f", deliveryFee) %></span>
            </div>
          </div>
          
          <div style="display: flex; justify-content: space-between; border-top: 1px solid var(--color-olive-ink); padding-top: 24px;">
            <span class="text-heading-sm" style="font-size: 28px;">Total</span>
            <span class="text-heading-sm" style="font-size: 28px;">$<%= String.format("%.2f", subtotal + deliveryFee) %></span>
            <%double itemTotal=subtotal+deliveryFee; %>
            <%session.setAttribute("itemTotal", itemTotal); %>
          </div>

        </div>
      </div>

    </div>
  </div>

</body>
</html>