<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Instant Foods</title>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:ital,wght@0,400;0,500;0,700;1,400&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap');

        :root {
            --color-olive-ink: #3c422e;
            --color-linen-cream: #fff4ec;
            --color-evoo-yellow-green: #d1e030;
            --font-typewriter: 'IBM Plex Serif', serif;
            --font-display: 'Playfair Display', serif;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: var(--color-linen-cream);
            color: var(--color-olive-ink);
            font-family: var(--font-typewriter);
            -webkit-font-smoothing: antialiased;
        }

        nav {
            padding: 30px;
            width: 100%;
        }

        .text-display { 
            font-family: var(--font-display); 
            font-size: 32px; 
            text-decoration: none; 
            color: inherit; 
        }

        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
            padding: 40px 20px;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
        }

        .login-container h1 {
            font-family: var(--font-display);
            font-size: 72px;
            line-height: 0.9;
            letter-spacing: -2.16px;
            text-align: center;
            margin-bottom: 40px;
            font-weight: 400;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            font-size: 16px;
        }

        .form-group input {
            width: 100%;
            padding: 16px;
            background-color: transparent;
            border: 1px solid var(--color-olive-ink);
            border-radius: 10px;
            font-family: var(--font-typewriter);
            font-size: 16px;
            color: var(--color-olive-ink);
            transition: outline 0.2s ease;
        }

        .form-group input:focus {
            outline: 2px solid var(--color-olive-ink);
            outline-offset: -1px;
        }

        .submit-btn {
            width: 100%;
            padding: 20px 30px;
            background-color: var(--color-evoo-yellow-green);
            color: var(--color-olive-ink);
            border: none;
            border-radius: 10px;
            font-family: var(--font-typewriter);
            font-size: 16px;
            font-weight: 700;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 16px;
        }

        .form-footer {
            text-align: center;
            margin-top: 30px;
        }

        .form-footer a {
            color: var(--color-olive-ink);
            text-decoration: none;
            font-weight: 500;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <nav>
        <a href="home.jsp" class="text-display">GRAZA EATS</a>
    </nav>

    <div class="main-content">
        <div class="login-container">
            <h1>Come on in.</h1>
             <% if (session.getAttribute("loginError") != null) { %>
   			<p style="color: red;"><%= session.getAttribute("loginError") %></p>
    		<% session.removeAttribute("loginError"); // Clear it after showing %>
			<% } %>
            
            <form action="LoginServlet" method="POST">
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <button type="submit" class="submit-btn">Login</button>
                
            </form>
           

            <div class="form-footer">
                <a href="register.jsp">Need an account? Register here →</a>
            </div>
        </div>
    </div>

</body>
</html>