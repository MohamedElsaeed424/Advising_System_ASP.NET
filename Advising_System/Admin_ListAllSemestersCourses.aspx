﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListAllSemestersCourses.aspx.cs" Inherits="Advising_System.Admin_ListAllSemestersCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #16a085, #3498db);
            display: flex;
            align-content:center;
        }

        #form1 {
            padding: 30px;
            max-width:fit-content;
            
            margin-left:520px;
            flex: 1;
            transition: margin-left 0.3s ease;
            border-radius: 10px;
            color: #fff;
              background: #f0f0f0; /* Gradient background */
       
            }

        #form1 h2 {
            color: blue;
        }

        #form1 p {
            line-height: 1.6;
        }

        #form1 #BackAdminHome6 {
            display: flex;
            align-items: center;
            justify-content: right;
            margin: 20px;
            resize: vertical;
            align-content:center;
        }

        #form1 #CoursesAndSemestersGridView {
            margin-top: 20px;
            border: 2px solid grey; /* White border for the table */
            align-content:center;
        }

        #form1 #CoursesAndSemestersGridView th{
            background-color: lightgray; /* Table header background color */
            color:blue ;
        }
        #form1 #CoursesAndSemestersGridView td {
       
            padding: 10px;
            text-align: center;
            color: blue;
            font-weight: bold; /* Adjust font weight as needed */
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
                <li><a href="/AdminHome.aspx">Home</a></li>
                <li><a href="/Admin_ListAllAdvisors.aspx">Advisors</a></li>
                <li><a href="/Admin_ListAllStudentsAdvisors.aspx">Advisors With Students</a></li>
                <li><a href="/Admin_ListAllPendingRequests.aspx">Pending Requests</a></li>

                <li><a href="/Admin_ListInstructorCourse.aspx">Instructors With Courses</a></li>
                <li><a href="/Admin_ListAllSemestersCourses.aspx">Offered Coursester</a></li>

                <li><a href="/Admin_FetchSemWCourse.aspx">All Semesters And Offered Courses</a></li>
                <li><a href="/Admin_viewStudentsTranscriptDetails.aspx">Students Transcript details</a></li>
                <li><a href="/Admin_viewPaymentDetailsForStudent.aspx">Students Payments</a></li>
                <li><a href="/Admin_ViewGPWadvisor.aspx">Advisors With there GraduationPlane</a></li>
                <li><a href="/Admin_fetchActiveStudents.aspx">Active Students</a></li>
              
                <li><a href="/Admin_DeleteCourseWSlot.aspx">Delete Course</a></li>
                <li><a href="/Admin_deleteSlot.aspx">Delete Slots</a></li>
                <li><a href="/Admin_issueInstallments.aspx">Issue Installment</a></li>
                <li><a href="/Admin_LinkInstructorCourseSlot.aspx">Link Instructor To Course</a></li>
                <li><a href="/Admin_LinkStudentAdvisor.aspx">Link Student to Advisor</a></li>
                <li><a href="/Admin_LinkStudentCourseInstructor.aspx">Link Student To course</a></li>

                <li><a href="/Admin_UpdateFinancialStatus.aspx">Update Student Status</a></li>
                <li><a href="/Admin_AddNewCourse.aspx">Add New Course</a></li>
                <li><a href="/Admin_AddNewSemester.aspx">Add New Semester</a></li>
                <li><a href="/Admin_AddMakeupExam.aspx">Add Makeup Exam</a></li>
            </ul>
    </div>
    <form id="form1" runat="server">
        <div>
            <div>
                <h2>All Courses With Their Offered Semesters</h2>
                <div id="BackAdminHome6">
                    <asp:Button ID="BackAdminHome6" runat="server" OnClick="BackAdminHome" Text="Back" />
                </div>
            </div>
            <asp:GridView ID="CoursesAndSemestersGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="name" HeaderText="Course" />
                    <asp:BoundField DataField="semester_code" HeaderText="Semester Code" />
                </Columns>
            </asp:GridView> 
        </div>
    </form>
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
</script>
</body>
</html>
