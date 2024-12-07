<%@page import="com.klef.jfsd.springboot.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Citizen citiz = (Citizen) session.getAttribute("citi");
if(citiz == null) {
    response.sendRedirect("citisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Portal</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
            overflow-x: hidden;
        }

        /* Navbar (if included) */
        header {
            background-color: #2c3e50;
            color: #fff;
            padding: 1rem;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(to bottom right, #2980b9, #6dd5fa, #ffffff);
            color: white;
            padding: 100px 20px;
            text-align: center;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .hero button {
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 25px;
            background-color: #34495e;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .hero button:hover {
            background-color: #2c3e50;
        }

        /* Main Features Section */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 50px 20px;
            padding: 20px;
        }

        .feature-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .feature-card img {
            max-width: 60px;
            margin-bottom: 15px;
        }

        .feature-card h3 {
            font-size: 1.5rem;
            color: #2c3e50;
        }

        .feature-card p {
            font-size: 1rem;
            color: #555;
        }

        /* Call to Action Section */
        .cta {
            background-color: #2c3e50;
            color: white;
            padding: 50px 20px;
            text-align: center;
        }

        .cta h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .cta button {
            padding: 10px 20px;
            font-size: 1.2rem;
            border: none;
            border-radius: 25px;
            background-color: #6dd5fa;
            color: #2c3e50;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cta button:hover {
            background-color: #2980b9;
            color: white;
        }

        /* Footer */
        footer {
            background-color: #34495e;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            font-size: 0.9rem;
        }

        footer a {
            color: #6dd5fa;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="citinavbar.jsp" %>

    <div class="hero">
        <h1>Welcome to the Citizen Portal</h1>
        <p>Connect with your representatives, voice your concerns, and make a difference in your community.</p>
        <button>Explore Now</button>
    </div>

    <div class="features">
        <div class="feature-card">
            <img src="https://via.placeholder.com/60" alt="Transparency Icon">
            <h3>Transparency</h3>
            <p>Access real-time information about your elected representatives and their activities.</p>
        </div>
        <div class="feature-card">
            <img src="https://via.placeholder.com/60" alt="Communication Icon">
            <h3>Effective Communication</h3>
            <p>Engage with your representatives directly and share your concerns or feedback.</p>
        </div>
        <div class="feature-card">
            <img src="https://via.placeholder.com/60" alt="Impact Icon">
            <h3>Impactful Actions</h3>
            <p>See how your feedback influences decision-making and improves your community.</p>
        </div>
    </div>

    <div class="cta">
        <h2>Take Action Today</h2>
        <button>Get Started</button>
    </div>

    <footer>
        <p>&copy; 2024 Citizen Portal. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
    </footer>
</body>
</html>
