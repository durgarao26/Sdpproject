<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar Example</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Navbar container */
        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #333;
            padding: 10px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Navbar links */
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            margin: 0 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
        }

        /* Hover effect for links */
        .navbar a:hover {
            background-color: #575757;
            color: #f4f4f9;
        }

        /* Active/selected link styling */
        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 15px 0;
            }

            .navbar a {
                margin: 5px 0;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="/" >Home</a>
        <a href="adminlogin">Admin Login</a>
        <a href="citireg">Citizen Registration</a>
        <a href="citilogin">Citizen Login</a>
        <a href="polilogin">Politician Login</a>
    </div>
</body>
</html>
