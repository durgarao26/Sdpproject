<%@page import="com.klef.jfsd.springboot.model.Politician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Politician poli  = (Politician) session.getAttribute("politician");
if(poli == null)
{
    response.sendRedirect("polisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Politician Home</title>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        color: #333;
    }

    /* Navigation Bar */
    nav {
        background-color: #4CAF50;
        padding: 1rem;
        text-align: center;
    }

    nav a {
        color: white;
        text-decoration: none;
        margin: 0 15px;
        font-size: 1.1rem;
        font-weight: bold;
    }

    nav a:hover {
        text-decoration: underline;
    }

    /* Hero Section */
    .hero {
        text-align: center;
        padding: 50px 20px;
        background: linear-gradient(to right, #4CAF50, #66BB6A);
        color: white;
    }

    .hero img {
        max-width: 150px;
        border-radius: 50%;
        margin-bottom: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .hero h1 {
        font-size: 2.5rem;
        margin-bottom: 10px;
    }

    .hero p {
        font-size: 1.2rem;
        margin-bottom: 30px;
    }

    .hero button {
        background-color: white;
        color: #4CAF50;
        border: none;
        padding: 10px 20px;
        font-size: 1rem;
        font-weight: bold;
        border-radius: 25px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .hero button:hover {
        background-color: #66BB6A;
        color: white;
    }

    /* Main Content Section */
    .main-content {
        padding: 20px;
        text-align: center;
    }

    .welcome-message {
        font-size: 1.8rem;
        font-weight: bold;
        color: #4CAF50;
        margin-bottom: 20px;
        text-transform: uppercase;
    }

    /* Footer */
    footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
    }

    footer a {
        color: #4CAF50;
        text-decoration: none;
    }

    footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <%@include file="polinavbar.jsp" %>
    <div class="hero">
        <img src="data:image/png;base64,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" alt="Politician Icon">
        <h1>Welcome, <%= poli.getName() %>!</h1>
        <p>Your gateway to effective communication with your constituents.</p>
        <button>Explore Features</button>
    </div>
    <div class="main-content">
        <p class="welcome-message">Take charge and lead with impact!</p>
    </div>
    <footer>
        <p>&copy; 2024 Citizen Portal. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>
</body>
</html>
