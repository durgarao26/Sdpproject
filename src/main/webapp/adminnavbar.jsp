<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<%
Admin admin  = (Admin) session.getAttribute("admin");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SDP Project</title>
    <style>
        body {
            background-color: #E3F2FD;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        h3{
        	color:#fff;
        	font-size:19px;
          }

        .navbar1 {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #335C81;
            padding: 6px 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Centering the navbar links */
        .navbar-center {
            display: flex;
            justify-content: center;
            flex: 1;
        }

        .navbar1 .title {
            display: flex;
            align-items: center;
        }

        .navbar1 .title img {
            height: 40px;
            margin-right: 10px;
        }

        .navbar1 a {
            color: #ffffff;
            text-decoration: none;
            padding: 12px 20px;
            text-transform: uppercase;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-right: 10px;
        }

        .navbar1 a:hover {
            background-color: #5679A6;
            border-radius: 4px;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropbtn {
            background-color: #335C81;
            color: #ffffff;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 17px;
            display: flex;
            align-items: center;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #5679A6;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            top: 100%; /* Position below the button */
            left: 0;
        }

        .dropdown-content a {
            color: #ffffff;
            padding: 12px 16px;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-weight: normal;
        }

        .dropdown-content a img {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }

        .dropdown-content a:hover {
            background-color: #A0C1D1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .navbar-right {
            display: flex;
            align-items: center;
        }

        .admin-info {
            display: flex;
            align-items: center;
            color: #ffffff;
            font-weight: bold;
            font-size: 18px;
            margin-right: 10px;
            cursor: pointer;
        }

        .admin-icon {
            height: 25px;
            width: 25px;
            margin-left: 5px;
        }

        .admin-dropdown {
            display: inline-block;
            position: relative;
        }

        .admin-dropdown:hover .dropdown-content {
            display: block;
        }

        @media (max-width: 768px) {
            .navbar1 {
                flex-direction: column;
                align-items: center;
            }

            .navbar1 a, .dropdown .dropbtn {
                padding: 10px;
                margin: 5px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar1">
       <!--  <div class="title">
            <img src="https://files.oaiusercontent.com/file-O6RWTCejG8etSdOhvAwsyQFS?se=2024-11-04T14%3A49%3A15Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D08049deb-1190-4f66-a7b6-17f9f24e1fb4.webp&sig=6DyHNpTuHnEVv64hN6BsMB/H1S%2BgcCgC3CiOjW0xyfo%3D" alt="Logo" />
            <h3>Connect4Change</h3>
        </div> -->
        
        <!-- Centered Links -->
        <div class="navbar-center">
            <a href="adminhome">Dashboard</a>
            <a href="polireg">Add Politician</a>
            <div class="dropdown">
                <button class="dropbtn">View</button>
                <div class="dropdown-content">
                    <a href="viewallpoli">View Politician</a>
                    <a href="viewallciti">View Citizen</a>
                </div>
            </div>
        </div>

        <div class="navbar-right">
            <div class="admin-info admin-dropdown">
               
                <img src="https://t4.ftcdn.net/jpg/04/75/00/99/360_F_475009987_zwsk4c77x3cTpcI3W1C1LU4pOSyPKaqi.jpg" alt="Admin Icon" class="admin-icon" />
                <%=admin.getUsername() %>
                <div class="dropdown-content">
                    <a href="adminlogin">
                        <img src="https://cdn-icons-png.freepik.com/512/6188/6188017.png" alt="Logout Icon" />
                        Logout
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
