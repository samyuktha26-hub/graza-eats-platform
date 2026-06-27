Graza Eats - Full-Stack Food Delivery Platform

A dynamic, database-driven web application that simulates a modern food delivery experience. Built with a robust Java backend and a responsive front-end, this project demonstrates end-to-end web development, from session management to complex SQL queries.
Live Features

    User Authentication: Secure login and registration with persistent session management.

    Dynamic Menu & Search: Browse local kitchens and filter results dynamically by cuisine type.

    Order Processing: Full cart functionality, checkout process, and order history tracking.

    Favorites System: Users can save their top kitchens utilizing a many-to-many database junction table.

    Interactive UI: Features a custom CSS design system, responsive grid layouts, and a client-side AI Chatbot widget for instant support.

    Graceful Error Handling: Custom branded error.jsp pages for 404 and 500 server errors.

Tech Stack

    Frontend: HTML5, CSS3, JSP (JavaServer Pages), Vanilla JavaScript

    Backend: Java Servlets, JDBC

    Database: MySQL

    Server: Apache Tomcat

Local Setup Instructions

    Clone this repository: git clone https://github.com/YOUR_USERNAME/graza-eats-platform.git

    Run the provided SQL script (database_setup.sql) in MySQL Workbench to create the tables.

    Update the DBConnection.java file with your local MySQL username and password.

    Deploy the project on an Apache Tomcat Server via your preferred IDE (Eclipse/IntelliJ).

    Navigate to http://localhost:8080/GrazaEats/restaurant to start!

Database Schema Highlights

This project utilizes a relational database structure, specifically showcasing junction tables for the Favorites feature:

    user (Handles auth and profile data)

    restaurant (Stores kitchen details and active status)

    order & order_items (Manages cart checkout and historical data)

    user_favorites (Junction table mapping users to their saved kitchens)
