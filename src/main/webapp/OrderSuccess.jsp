<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order Confirmed - Instant Foods</title>
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
      background-color: var(--color-squeeze-bottle-green); /* Celebratory green background */
      color: var(--color-olive-ink);
      font-family: var(--font-typewriter);
      -webkit-font-smoothing: antialiased;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Typography */
    .text-display { font-family: var(--font-display); font-size: 80px; line-height: 0.9; letter-spacing: -2px; }
    .text-heading-sm { font-family: var(--font-display); font-size: 32px; line-height: 1; margin-bottom: 16px; }
    .text-body { font-size: 20px; line-height: 1.5; font-weight: 400; }
    .text-nav { font-size: 16px; font-weight: 500; text-decoration: none; color: var(--color-olive-ink); }
    .text-badge { font-family: var(--font-badge); font-size: 14px; text-transform: uppercase; letter-spacing: 0.05em; font-weight: 600; }

    /* Layout */
    .container { max-width: 1200px; margin: 0 auto; width: 100%; padding: 40px 30px; flex: 1; display: flex; flex-direction: column; }
    nav { display: flex; justify-content: space-between; align-items: center; padding-bottom: 40px; border-bottom: 1px solid var(--color-olive-ink); }

    .success-wrapper {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      max-width: 600px;
      margin: 0 auto;
    }

    /* UI Components */
    .btn-primary {
      background-color: var(--color-linen-cream);
      color: var(--color-olive-ink);
      border-radius: 10px;
      padding: 20px 40px;
      font-family: var(--font-typewriter);
      font-size: 18px;
      font-weight: 700;
      text-transform: uppercase;
      border: 1px solid var(--color-olive-ink);
      cursor: pointer;
      text-decoration: none;
      display: inline-block;
      transition: transform 0.2s, background-color 0.2s;
      margin-top: 48px;
    }
    .btn-primary:hover { 
      transform: translateY(-2px); 
      background-color: var(--color-buttery-peach);
    }
    
    .receipt-box {
      background-color: var(--color-linen-cream);
      border: 1px solid var(--color-olive-ink);
      border-radius: 20px;
      padding: 32px;
      width: 100%;
      margin-top: 48px;
      text-align: left;
    }
  </style>
</head>
<body>

  <div class="container">
    
    <nav>
      <span class="text-nav"></span> <!-- Empty span to maintain flex spacing -->
      <a href="restaurant" class="text-display" style="font-size: 32px; letter-spacing: normal; text-decoration: none; color: inherit;">GRAZA EATS</a>
      <span class="text-nav"></span>
    </nav>

    <div class="success-wrapper">
      <div class="text-badge" style="margin-bottom: 24px;">* Success *</div>
      
      <h1 class="text-display" style="margin-bottom: 24px;">ORDER SECURED</h1>
      
      <p class="text-body">
        The kitchen has received your order and is firing up the stoves. Hang tight, good food is on the way.
      </p>

      <div class="receipt-box">
        <div style="display: flex; justify-content: space-between; border-bottom: 1px solid var(--color-olive-ink); padding-bottom: 16px; margin-bottom: 16px;">
          <span class="text-badge">Order Status</span>
          <span class="text-badge" style="color: #637345;">Preparing</span>
        </div>
        
        <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
          <span class="text-body" style="font-family: var(--font-badge); font-size: 14px; text-transform: uppercase;">Estimated Delivery</span>
          <span class="text-body" style="font-weight: 700;">30 - 45 Mins</span>
        </div>
      </div>

      <a href="restaurant" class="btn-primary">Order More Food →</a>
    </div>

  </div>

</body>
</html>