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
    --font-typewriter: 'IBM Plex Serif', serif; /* Alpina Substitute */
    --font-display: 'Playfair Display', serif; /* Garamond Substitute */
    --font-badge: 'Work Sans', sans-serif; /* Apercu Substitute */
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
  .section-band-mustard { background-color: var(--color-mustard-sun); padding: 64px 30px; }
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

  .btn-primary {
    background-color: var(--color-evoo-yellow-green);
    color: var(--color-olive-ink);
    border-radius: 10px;
    padding: 20px 30px;
    font-family: var(--font-typewriter);
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    border: none;
    cursor: pointer;
  }

  .btn-ghost {
    background-color: transparent;
    border: 1px solid var(--color-olive-ink);
    border-radius: 10px;
    padding: 20px 30px;
    font-family: var(--font-typewriter);
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
  }

  .input-field {
    border-radius: 10px;
    border: 1px solid var(--color-olive-ink);
    background-color: transparent;
    padding: 16px;
    font-family: var(--font-typewriter);
    font-size: 16px;
    color: var(--color-olive-ink);
    width: 100%;
    margin-bottom: 20px;
  }

  /* Images */
  .img-card { border-radius: 20px; width: 100%; object-fit: cover; }
</style>
</head>
<body>
  <nav>
    <a href="home.jsp" class="text-nav">← Back to Kitchens</a>
    <button class="pill-nav">Cart (2)</button>
  </nav>

  <!-- Split Feature Block on Green -->
  <div class="section-band-green">
    <div class="container" style="display: flex; flex-wrap: wrap; align-items: center; gap: 40px;">
      <div style="flex: 1; min-width: 300px;">
        <h1 class="text-heading-lg">The Olive Branch.</h1>
        <p class="text-body" style="margin-top: 20px;">
          Hand-rolled pasta and sun-dried tomatoes. Imperfectly shaped, perfectly seasoned.
        </p>
      </div>
      <div style="flex: 1; min-width: 300px;">
        <div style="height: 300px; background-color: var(--color-linen-cream); border-radius: 20px; border: 1px solid var(--color-olive-ink);"></div>
      </div>
    </div>
  </div>

  <!-- Menu List -->
  <div class="section-canvas">
    <div class="container" style="max-width: 800px;">
      
      <!-- Item -->
      <div style="display: flex; justify-content: space-between; align-items: center; padding: 40px 0; border-bottom: 1px solid var(--color-olive-ink);">
        <div style="max-width: 60%;">
          <h3 class="text-heading-sm" style="font-size: 36px;">Cacio e Pepe</h3>
          <p class="text-body" style="margin-top: 8px;">Pecorino Romano, black pepper, hand-made tonnarelli.</p>
          <p class="text-body" style="font-weight: 700; margin-top: 8px;">$18.00</p>
        </div>
        <button class="btn-ghost">Add to cart</button>
      </div>

      <!-- Item -->
      <div style="display: flex; justify-content: space-between; align-items: center; padding: 40px 0; border-bottom: 1px solid var(--color-olive-ink);">
        <div style="max-width: 60%;">
          <h3 class="text-heading-sm" style="font-size: 36px;">House Focaccia</h3>
          <p class="text-body" style="margin-top: 8px;">Sourdough starter, sea salt, flooded with olive oil.</p>
          <p class="text-body" style="font-weight: 700; margin-top: 8px;">$9.00</p>
        </div>
        <button class="btn-ghost">Add to cart</button>
      </div>

    </div>
  </div>
</body>
</html>