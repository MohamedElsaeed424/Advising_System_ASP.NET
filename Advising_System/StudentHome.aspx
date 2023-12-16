<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="Advising_System.StudentHome" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal</title>
    <style>
 body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,121,105,1) 35%, rgba(0,212,255,1) 100%);
            display: flex;
        }

        #content {
            padding: 30px;
            background: #f8f9fa;
            margin-left: 240px;
            flex: 1;
            transition: margin-left 0.3s ease;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            color: #495057;
        }

        #content h2 {
            color: #3498db;
        }

        #content p {
            line-height: 1.6;
        }

        #footer {
            background: #2c3e50;
            color: #ecf0f1;
            text-align: center;
            padding: 1em;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        #sidebar {
            background: #2c3e50;
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
            background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.1) 0%, rgba(0, 0, 0, 0) 100%);
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
            color: #3498db;
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
            background: #34495e;
            color: #3498db;
            transform: scale(1.1);
        }

        #toggle-btn {
          cursor: pointer;
          position: fixed;
          top: 20px;
          left: 20px;
          z-index: 3;
          color: cornflowerblue;
          font-size: 20px; /* Reduced font size for smaller button */
          border: none;
          border-radius: 50%; /* Maintains round shape */
          padding: 1px; /* Reduced padding to match smaller size */
          box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); /* Adjusted shadow for smaller size */
          transition: background-color 0.3s ease; /* Removed transition for left position as it's fixed */
        }


        #toggle-btn:hover {
            background-color: #2980b9;
        }

        #toggle-btn::before {
            content: "\2261";
            font-size: 24px; /* Adjusted font size */
        }

        .sidebar-opened #toggle-btn {
            left: 240px;
        }

    </style>

</head>
<body>
    <div id="sidebar">
        <div id="sidebar-header">Contents</div>
            <ul>
                <li><a href="/StudentHome.aspx">Home</a></li>
                <li><a href="/Student_ViewGradPlan.aspx">View graduation plan along with assigned courses</a></li>
                <li><a href="/Student_ViewNotPaidInst.aspx">View upcoming not paid installment</a></li>
                <li><a href="/Student_ViewCoursesWithExams.aspx">View courses with their exams details</a></li>
                <li><a href="/Student_FirstMakeupRegister.aspx">Register for first makeup exam</a></li>
                <li><a href="/Student_SecondMakeupRegister.aspx">Register for second makeup exam</a></li>
                <li><a href="/Student_ViewCoursesWithSlotsAndInstructors.aspx">View courses with their corresponding slots and instructors</a></li>
                <li><a href="/Student_ViewSlotsForCourse.aspx">View slots of a certain course</a></li>
                <li><a href="/Student_ChooseInstructorForCourse.aspx">Choose instructor for a certain course</a></li>
                <li><a href="/Student_ViewCoursesWithPrereq.aspx">View details of courses with their prerequisites</a></li>
                <li><a href="/Student_AddPhoneNum.aspx">Add Phone Number</a></li>
                <li><a href="/Student_ViewMissingCourses.aspx">View Missing Courses</a></li>
                <li><a href="/Student_ViewAllCoursesCurrentSemester.aspx">View All Available Courses in Your Current semester</a></li>
                <li><a href="/Student_ViewAllOptionalCourses.aspx">View All Optional Courses</a></li>
                <li><a href="/Student_ViewAllRequiredCourses.aspx">View All Required Courses</a></li>
                <li><a href="/Student_Registration.aspx">Student Regiseration</a></li>
                <li><a href="/Student_SendRequest.aspx">Student Send Request</a></li>
            </ul>
    </div>

    <div id="content">
                  <h2 runat="server" id="welcome">Welcome, Student!</h2>
                  <p>This is the student portal for the student system.</p>
    </div>

    <div id="footer">
        &copy; 2023 Student Portal
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
