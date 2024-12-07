<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Civic Connect</title>
    <style>
        /* Title Styling */
        h2 {
            font-family: 'Arial', sans-serif;
            font-size: 2em;
            font-weight: bold;
            color: #4CAF50; /* Reflects a theme of growth and trust */
            text-align: center;
            margin-top: 20px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }

        /* Optional: Add background highlight */
        h2::before,
        h2::after {
            content: "";
            display: inline-block;
            width: 50px;
            height: 4px;
            background-color: #4CAF50;
            margin: 0 10px;
            vertical-align: middle;
        }

        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Hero Section Styling */
        .hero-section {
            text-align: center;
            margin: 20px auto;
        }

        /* Hero Text Styling */
        .hero-text {
            font-size: 1.8em;
            font-weight: bold;
            color: #4CAF50; /* Reflects a theme of growth and trust */
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px; /* Add some space between text and image */
        }

        /* Hero Image Styling */
        .hero-image {
            display: block;
            margin: 0 auto;
            max-width: 80%; /* Ensures the image scales well on smaller screens */
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }

        /* Section Styling */
        .section {
            padding: 20px;
            margin: 20px 0;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Section Title Styling */
        .section h3 {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 10px;
            text-align: center;
        }

        /* Section Paragraph Styling */
        .section p {
            font-size: 1em;
            line-height: 1.6;
            color: #666;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Navbar Section -->
    <%@include file="mainnavbar.jsp" %>

    <!-- Hero Section -->
    <div class="hero-section">
        <!-- Text at the top -->
        <div class="hero-text">Civic Connect: Enhancing Communication Between Citizens and Politicians</div>
        
        <!-- Image below the text -->
        <img src="https://bpac.in/wp-content/uploads/2020/07/BPAC_Main.png" 
             alt="BPAC Civic Engagement" 
             class="hero-image">
    </div>

    <!-- About Section -->
    <div class="section" id="about">
        <h3>About Civic Connect</h3>
        <p>Civic Connect is a platform designed to bridge the gap between citizens and their elected representatives. It enables citizens to report issues, provide feedback, and stay informed about the actions of their politicians. By improving transparency and fostering communication, Civic Connect aims to strengthen democracy and ensure that governance is responsive to the needs of the people.</p>
    </div>

    <!-- Services Section -->
    <div class="section" id="services">
        <h3>Our Services</h3>
        <p>
            <strong>1. Issue Reporting:</strong> Citizens can report local issues and concerns to their elected representatives. <br>
            <strong>2. Feedback System:</strong> A platform to share feedback on policies, governance, and public services. <br>
            <strong>3. Updates from Politicians:</strong> Receive regular updates from elected officials on actions taken and upcoming policies.
        </p>
    </div>

    <!-- Contact Section -->
    <div class="section" id="contact">
        <h3>Contact Us</h3>
        <p>If you have any questions or suggestions, feel free to reach out to us:</p>
        <p>
            Email: support@civicconnect.com <br>
            Phone: +1 234 567 890 <br>
            Address: Civic Connect Headquarters, 123 Main Street, City, Country
        </p>
    </div>
</body>
</html>
