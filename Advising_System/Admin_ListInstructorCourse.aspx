<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListInstructorCourse.aspx.cs" Inherits="Advising_System.Admin_ListInstructorCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #16a085, #3498db);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: white; /* Set text color to white */
        }

        form {
            background: none; /* Form background color */
            padding: 20px;
            border-radius: 8px;
            width: 80%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 800px; /* Set a maximum width for larger screens */
        }

        #BackAdminHome6 {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        #CoursesAndInstructorsGridView {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #CoursesAndInstructorsGridView th,
        #CoursesAndInstructorsGridView td {
            padding: 10px;
            font-weight: bold; /* Set text to bold */
            color: white;
            border: 2px solid white; /* Set table borders to white and thicker */
        }

        #CoursesAndInstructorsGridView th {
            background-color: white; /* Table header background color */
            color: forestgreen;
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
    <form id="form1" runat="server">
        <div>
            <div>
                <h2>All Instructors and Their Courses</h2>
                <div style="display: flex; align-items: center; justify-content: flex-end; margin: 20px; resize: vertical;">
                    <asp:Button ID="BackAdminHome6" runat="server" OnClick="BackAdminHome" Text="Back" />
                </div>
            </div>
            <asp:GridView ID="CoursesAndInstructorsGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="instructor_id" HeaderText="Instructor ID" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <div id="footer">
    &copy; 2023 Admin Portal
</div>

<div id="toggle-btn"></div>

<script>
    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('content');
    const toggleBtn = document.getElementById('toggle-btn');

    toggleBtn.addEventListener('click', () => {
        const sidebarWidth = sidebar.offsetWidth;

        if (sidebar.style.left === '0px' || sidebar.style.left === '') {
            sidebar.style.left = -${sidebarWidth}px;
            content.style.marginLeft = '0';
        } else {
            sidebar.style.left = '0';
            content.style.marginLeft = ${sidebarWidth}px;
        }
    });
</script>
</body>
</html>








