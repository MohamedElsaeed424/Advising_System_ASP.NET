﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorHome.aspx.cs" Inherits="Advising_System.AdvisorHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advisor Home</title>
    <style>
       body {
            background: linear-gradient(to right, #c02425, #f0cb35); /* Updated gradient colors */
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow: hidden; /* Hide the horizontal scrollbar */
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: white;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Style the buttons */
        .button-style {
            color: white;
            padding: 20px 30px;
            margin: 10px;
            border: none;
            cursor: pointer;
            background-color: orangered;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .button-style:hover {
            background-color: darkred;
        }

        /* Style the dropdown */
        .dropdown-style {
            margin-top: 20px;
        }

        .dropdown-style select {
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
        }

        #footer {
            background: linear-gradient(to right, #4d0099, #330066); 
            color: #ecf0f1;
            text-align: center;
            padding: 1em;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

#sidebar {
     background: linear-gradient(to right, #4d0099, #330066); 

    /* Darker gradient colors */
    padding: 1em;
    height: 100vh;
    width: 240px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    position: fixed;
    left: -240px;
    transition: left 0.3s ease;
    overflow-y: auto;
    color: #ecf0f1;
    border-radius: 5px;
     background: linear-gradient(to right, #4d0099, #330066); 
}


        #sidebar::-webkit-scrollbar {
            width: 10px;
            background-color: #2c3e50;
        }

        #sidebar::-webkit-scrollbar-thumb {
            background-color: #34495e;
            border-radius: 5px;
        }

        #sidebar::-webkit-scrollbar-thumb:hover {
            background-color: #2980b9;
        }

        #sidebar-header {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            color: #e67e22; /* Set to your desired orange color */
        }

        #sidebar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        #sidebar li {
            margin-bottom: 12px;
        }

        #sidebar a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
            transform: scale(1);
            transition: transform 0.2s ease-in-out;
        }

        #sidebar a:hover {
            background: #d35400; /* Darker shade of orange for hover */
            color: #ecf0f1; /* Lighter complementary color for text */
            transform: scale(1.1);
        }

        #toggle-btn {
            cursor: pointer;
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 3;
            color: #f0cb35; /* Updated color */
            font-size: 20px;
            border: none;
            border-radius: 50%;
            padding: 1px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        #toggle-btn:hover {
            background-color: #d35400;
        }

        #toggle-btn::before {
            content: "\2261";
            font-size: 24px;
        }

        .sidebar-opened #toggle-btn {
            left: 240px;
        }

        /* Additional styling for content */
        #content {
            max-width: 400px; /* Set your preferred max width */
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            background: white;
            border-radius: 10px;
            overflow: hidden;
            transition: background-color 0.3s ease;
        }

        #content:hover {
            background-color: #f4f4f4; /* Light gray on hover */
        }

        #content h2 {
            color: #e67e22;
            font-size: 24px;
            margin-bottom: 10px;
        }

        #content p {
            color: #333;
            font-size: 14px;
            line-height: 1.6;
        }
        #LogOut {
           background: linear-gradient(to right, #4d0099, #330066); 
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div id="sidebar">
        <div id="sidebar-header">Contents</div>
        <ul>
            <li><a href="/AdvisorHome.aspx">Home</a></li>
            <li><a href="/Advisor_AllAdvisingStudents.aspx">View All Your Students</a></li>
            <li><a href="/Advisor_GraduationPlan.aspx">Graduation Plans</a></li>
            <li><a href="/Advisor_AllStudentsMajorCourse.aspx">View all students assigned to you from a certain major along with their taken courses</a></li>
            <li><a href="/Advisor_RequestStuff.aspx">View Requests</a></li>
        </ul>
    </div>
    <div id="content">
        <h2 runat="server" id="name">Welcome, Advisor!</h2>
        <p>This is the Advisor portal for the advising student system. Explore the menu on the left to access different features.</p>
     <form id="registrationForm" runat="server">
         <asp:Button ID="LogOut" runat="server" Text="Log Out" OnClick="LogOut_Click" />
     </form>
    </div>
    <div id="footer">
        &copy; 2023 Advisor Portal
    </div>

    <div id="toggle-btn"></div>
    <script>
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('content');
        const toggleBtn = document.getElementById('toggle-btn');

        toggleBtn.addEventListener('click', () => {
            const sidebarWidth = sidebar.offsetWidth;

            if (sidebar.style.left === '0px' || sidebar.style.left === '') {
                sidebar.style.left = `-${sidebarWidth}px`;
                content.style.marginLeft = '0';
            } else {
                sidebar.style.left = '0';
                content.style.marginLeft = `${sidebarWidth}px`;
            }
        });
        window.addEventListener('load', function () {
            sidebar.style.left = '0';
            content.style.marginLeft = `${sidebarWidth}px`;
        });
    </script>
</body>
</html>
