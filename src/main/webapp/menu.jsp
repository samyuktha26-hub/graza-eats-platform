<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Menu, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Menu - Instant Foods</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:ital,wght@0,400;0,500;0,700;1,400&family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Work+Sans:wght@400&display=swap');

    :root {
      /* Colors */
      --color-olive-ink: #3c422e;
      --color-linen-cream: #fff4ec;
      --color-buttery-peach: #f6e6d9;
      --color-squeeze-bottle-green: #9eef80;
      --color-evoo-yellow-green: #d1e030;
      --color-mustard-sun: #fbd535;

      /* Fonts */
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
    }

    /* Typography */
    .text-display { font-family: var(--font-display); font-size: 120px; line-height: 0.9; letter-spacing: -3.72px; }
    .text-heading-lg { font-family: var(--font-display); font-size: 102px; line-height: 0.9; letter-spacing: -3.06px; }
    .text-heading-sm { font-family: var(--font-display); font-size: 46px; line-height: 1; letter-spacing: -0.97px; }
    .text-body { font-size: 16px; line-height: 1.5; font-weight: 400; }
    .text-nav { font-size: 16px; font-weight: 500; text-decoration: none; color: var(--color-olive-ink); }
    .text-badge { font-family: var(--font-badge); font-size: 13px; text-transform: uppercase; letter-spacing: normal; }

    /* Layout */
    .section-band-green { background-color: var(--color-squeeze-bottle-green); padding: 64px 30px; }
    .section-canvas { background-color: var(--color-linen-cream); padding: 64px 30px; }
    
    .container { max-width: 1200px; margin: 0 auto; }

    /* Navigation */
    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 30px;
      background-color: var(--color-linen-cream);
    }

    /* Buttons & Inputs */
    .pill-nav {
      border-radius: 9999px;
      border: 1px solid var(--color-olive-ink);
      background-color: var(--color-linen-cream);
      padding: 8px 16px;
      cursor: pointer;
      font-family: var(--font-typewriter);
    }

    .btn-ghost {
      background-color: transparent;
      border: 1px solid var(--color-olive-ink);
      border-radius: 10px;
      padding: 12px 24px;
      font-family: var(--font-typewriter);
      font-size: 14px;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.2s ease;
    }
    
    .btn-ghost:hover {
      background-color: var(--color-buttery-peach);
    }
  </style>
</head>
<body>
  
  <nav>
    <a href="restaurant" class="text-nav">← Back to Kitchens</a>
    <a href="restaurant" class="text-display" style="font-size: 32px; letter-spacing: normal; text-decoration: none; color: inherit;">GRAZA EATS</a>
    <button class="pill-nav">Cart (0)</button>
  </nav>

  <div class="section-band-green" style="text-align: center;">
    <span class="text-badge">* MADE TO ORDER *</span>
    <h1 class="text-display" style="margin: 20px 0;">THE MENU</h1>
    <p class="text-body" style="max-width: 600px; margin: 0 auto;">
      Simple ingredients, handled with care. 
    </p>
  </div>

  <div class="section-canvas">
    <div class="container" style="max-width: 900px;">
      
      <%
          // Fetch the menu list from the request
          List<Menu> menuList = (List<Menu>)request.getAttribute("allMenu");
          
          if (menuList != null && !menuList.isEmpty()) {
              for(Menu item : menuList) {
      %>
      
      <div style="display: flex; gap: 40px; align-items: center; padding: 40px 0; border-bottom: 1px solid var(--color-olive-ink);">
        
        <div style="flex: 0 0 250px;">
          <img src="<%= item.getImageURL()%>" alt="<%= item.getItemName() %>" 
               style="width: 100%; height: 250px; object-fit: cover; border-radius: 20px; border: 1px solid var(--color-olive-ink);">
        </div>
        
        <div style="flex: 1;">
          <div style="margin-bottom: 12px;">
            <span class="text-badge" style="color: var(--color-olive-ink);">* <%= item.getCategory() %> *</span>
          </div>
          
          <div style="display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 16px;">
            <h3 class="text-heading-sm" style="font-size: 40px;"><%= item.getItemName() %></h3>
            <span class="text-body" style="font-weight: 700; font-size: 20px;">$<%= String.format("%.2f", item.getPrice()) %></span>
          </div>
          
          <p class="text-body" style="margin-bottom: 24px; color: var(--color-olive-ink);">
            <%= item.getDescription() %>
          </p>
          
          <% if (item.getIsAvailable() == 1) { %>
              <form action="CartServlet" >
                  <input type="hidden" name="menuId" value="<%= item.getMenuID() %>">
                  <input type="hidden" name="quantity" value="1">
                  <input type="hidden" name="restaurantId" value="<%= item.getRestaurantID() %>">
                  <input type="hidden" name="action" value="add">
                  <button type="submit" class="btn-ghost">Add to Cart →</button>
              </form>
          <% } else { %>
              <span class="text-badge" style="color: #808080;">* CURRENTLY SOLD OUT *</span>
          <% } %>
          
        </div>
      </div>
      
      <%
              } // End of loop
          } else {
      %>
      
      <div style="text-align: center; padding: 60px;">
          <h3 class="text-heading-sm">This menu is currently empty.</h3>
          <p class="text-body" style="margin-top: 16px;">Please check back later.</p>
      </div>
      
      <%
          }
      %>

    </div>
  </div>
  
</body>
</html>