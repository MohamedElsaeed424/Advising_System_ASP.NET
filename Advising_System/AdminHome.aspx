<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Advising_System.AdminHome" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #FFD700, #FF6347); /* Gradient background */
            display: flex;
        }

        #sidebar {
            background: #444; /* Navigation background color */
            padding: 1em;
            height: 100vh; /* Full height of the viewport */
            width: 200px; /* Adjust the width as needed */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Add a shadow for separation */
            position: fixed;
            left: -200px; /* Initially hide the sidebar */
            transition: left 0.3s ease;
        }

        #sidebar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        #sidebar li {
            margin-bottom: 10px; /* Adjust the spacing between links */
        }

        #sidebar a {
            display: block;
            color: white;
            text-decoration: none;
        }

        #sidebar a:hover {
            background: #555; /* Change the background color on hover */
        }

        #content {
            padding: 20px;
            background: #f0f0f0; /* Content background color */
            margin-left: 200px; /* Adjust margin to account for sidebar width */
            flex: 1; /* Take up the remaining space */
            transition: margin-left 0.3s ease;
        }

        #footer {
            background: #333; /* Footer background color */
            color: white;
            text-align: center;
            padding: 1em;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        #toggle-btn {
            cursor: pointer;
            position: fixed;
            left: 10px;
            top: 10px;
            z-index: 2;
        }

    </style>
</head>
<body>
    <div id="sidebar">
        <ul>
        <li><a href="/Admin_ListAllAdvisors.aspx">Show All Advisors</a></li>
        <li><a href="/Admin_ListAllStudentsAdvisors.aspx">Show All Advisors With Students</a></li>
        <li><a href="/Admin_ListAllPendingRequests.aspx">Show All Pending Requests</a></li>
        <li><a href="/Admin_AddNewSemester.aspx">Add New Semester</a></li>
        <li><a href="/Admin_AddNewCourse.aspx">Add New Course</a></li>
        <li><a href="/Admin_ListInstructorCourse.aspx">All Instructors with their courses</a></li>
        <li><a href="/Admin_ListAllSemestersCourses.aspx">All Offered Courses With their Semesters</a></li>
        <li><a href="/Admin_LinkInstructorCourseSlot.aspx">Link Instructor To Course</a></li>
        <li><a href="/Admin_LinkStudentAdvisor.aspx">Link Student To Advisor</a></li>
        <li><a href="/Admin_LinkStudentCourseInstructor.aspx">Link Student To Course and Instructor</a></li>
        <li><a href="/Admin_FetchSemWCourse.aspx">Fetch all semesters along with their offered courses</a></li>
        <li><a href="/Admin_viewStudentsTranscriptDetails.aspx">View all students transcript details</a></li>
        <li><a href="/Admin_viewPaymentDetailsForStudent.aspx">View details for all payments along with their corresponding students</a></li>
        <li><a href="/Admin_ViewGPWadvisor.aspx">View all graduation plans along with their initiated advisors</a></li>
        <li><a href="/Admin_fetchActiveStudents.aspx">Fetch all active students</a></li>
        <li><a href="/Admin_DeleteCourseWSlot.aspx">Choose a course to delete with its assigned slots</a></li>
        <li><a href="/Admin_issueInstallments.aspx">Issue installments as per the number of installments for a certain payment</a></li>
        <li><a href="/Admin_UpdateFinancialStatus.aspx">Update a student status based on his/her financial status</a></li>
        <li><a href="/Admin_deleteSlot.aspx">Delete a slot of a certain course</a></li>
        <li><a href="/Admin_AddMakeupExam.aspx">Add make up exam</a></li>
        </ul>
    </div>

    <div id="content">
                  <h2>Welcome, Admin!</h2>
                  <p>This is the administration portal for the student system.</p>
    </div>

    <div id="footer">
        &copy; 2023 Admin Portal
    </div>

    <div id="toggle-btn">&#9654;</div>

    <script>
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('content');
        const toggleBtn = document.getElementById('toggle-btn');

        toggleBtn.addEventListener('click', () => {
            const sidebarWidth = sidebar.offsetWidth;

            if (sidebar.style.left === '0px' || sidebar.style.left === '') {
                sidebar.style.left = `-${sidebarWidth}px`;
                content.style.marginLeft = '0';
                toggleBtn.innerHTML = '&#9654;';
            } else {
                sidebar.style.left = '0';
                content.style.marginLeft = `${sidebarWidth}px`;
                toggleBtn.innerHTML = '&#9664;';
            }
        });
    </script>
</body>
</html>
