<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Dashboard</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9; /* Light background for contrast */
        }

        /* Navbar Container */
        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #333; /* Dark background */
            padding: 10px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Adds subtle depth */
        }

        /* Navbar Links */
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            margin: 0 10px;
            transition: all 0.3s ease; /* Smooth transitions */
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
        }

        /* Hover Effect for Links */
        .navbar a:hover {
            background-color: #4CAF50; /* Green hover background */
            color: white; /* Ensure text remains visible */
        }

        /* Active/Focused Link Styling (Optional, Add Manually as Class) */
        .navbar a.active {
            background-color: #4CAF50; /* Highlighted background */
            color: white;
        }

        /* Responsive Design for Smaller Screens */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 10px 0;
            }

            .navbar a {
                margin: 5px 0;
                width: 90%; /* Take up most of the width */
                text-align: center; /* Center align text */
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="citihome">Dashboard</a>
        <a href="citiissue">Report Issue</a>
        <a href="viewallissues">View All Issues</a>
        <a href="citilogout">Logout</a>
    </div>
</body>
</html>
