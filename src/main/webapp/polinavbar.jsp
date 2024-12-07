<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot MVC SDP Project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #E3F2FD;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        h2 {
            color: #333;
            margin-top: 20px;
            font-size: 1.5em;
            text-align: center;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #000;
            padding: 15px 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-center  {
            
            margin-left:550px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            text-transform: uppercase;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .navbar a:hover {
            background-color: #5679A6;
            border-radius: 4px;
        }

        /* Profile dropdown styling */
        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #000;
            min-width: 160px;
            z-index: 1;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #5679A6;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .profile-icon {
            color: white;
            font-size: 18px;
            cursor: pointer;
            padding: 12px;
            text-transform: uppercase;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        /* Responsive behavior */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
            }

            .navbar-center {
                flex-direction: column;
                align-items: center;
            }

            .navbar a, .profile-icon {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    
    <div class="navbar">
        <div class="navbar-center">
            <a href="polihome">Home</a>
            <a href="viewcitizenissuebycons">Issues</a>
            
        </div>
        <div class="dropdown">
            <div class="profile-icon">
                <i class="fas fa-user"></i> <!-- Profile icon -->
            </div>
            <div class="dropdown-content">
                <a href="poliprofile">Profile</a>
                <a href="updatepoli">Update Profile</a>
                <a href="polilogout">Logout</a>
            </div>
        </div>
    </div>
</body>
</html>
