﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_viewPaymentDetailsForStudent.aspx.cs" Inherits="Advising_System.Admin_viewPaymentDetailsForStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #16a085, #3498db);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #form1 {
        padding: 30px;
          background: #f0f0f0; /* Gradient background */
        margin: 20px;
        border-radius: 10px;
        color: white;
        text-align: center;
    }

    #form1 h2 {
        color: blue;
    }

    #BackAdminHomeButton {
        background-color: darkgrey;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 10px;
    }

    #ViewPaymentGV {
        margin-top: 20px;
        border: 2px solid grey;
        border-collapse: collapse;
    }

    #ViewPaymentGV th, #ViewPaymentGV td {
        padding: 10px;
        text-align: left;
        color: blue;
        border: 2px solid grey;
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
        <h2>View Payment details for students</h2>
        <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHomeButton" runat="server" OnClick="BackAdminHome" Text="Back" />
            <style>
        .container {
            display: flex;
            align-items: flex-end; /* Aligns items to the bottom */
            height: 300px; /* Just an example height */
        }
    </style>
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:GridView ID="ViewPaymentGV" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="amount" HeaderText="Amound" />
                    <asp:BoundField DataField="deadline" HeaderText="Deadline" />
                    <asp:BoundField DataField="fund_percentage" HeaderText="fund percentage" />
                    <asp:BoundField DataField="n_installments" HeaderText="n of installments" />
                    <asp:BoundField DataField="payment_id" HeaderText="payment id" />
                    <asp:BoundField DataField="semester_code" HeaderText="semester code" />
                    <asp:BoundField DataField="start_date" HeaderText="start date" />
                    <asp:BoundField DataField="status" HeaderText="status" />
                    <asp:BoundField DataField="f_name" HeaderText="first name" />
                    <asp:BoundField DataField="l_name" HeaderText="last name " />
                    <asp:BoundField DataField="student_id" HeaderText="student id" />
                    <asp:BoundField DataField="email" HeaderText="email" />
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
