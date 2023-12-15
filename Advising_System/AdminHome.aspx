<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Advising_System.AdminHome" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal</title>
    <style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background: linear-gradient(to right, #16a085, #3498db);
	display: flex;
}
#content {
	padding: 30px;
	/* Increased padding for more space */
	background: #f8f9fa;
	/* Lighter background color */
	margin-left: 240px;
	flex: 1;
	transition: margin-left 0.3s ease;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
	/* Increased box shadow for depth */
	border-radius: 10px;
	/* Rounded corners for a modern look */
	color: #495057;
	/* Darker text color */
}

#content h2 {
	color: #3498db;
	/* Header text color */
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

/* Side Par */
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
	/* New rounded corners for a modern look */
	/* Add subtle gradient overlay for depth */
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.1) 0%, rgba(0, 0, 0, 0) 100%);
}

/* Scrollbar (custom styles optional) */
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

/* Sidebar Header */
#sidebar-header {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #3498db;
}

/* Sidebar Menu */
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
	padding: 12px;
	border-radius: 5px;
	/* Updated to match sidebar */
	transition: background 0.3s ease, color 0.3s ease;
	/* Add hover animation for subtle feedback */
	transform: scale(1);
	transition: transform 0.2s ease-in-out;
}

#sidebar a:hover {
	background: #34495e;
	color: #3498db;
	transform: scale(1.1);
	/* Slight zoom on hover */
}
#toggle-btn {
	cursor: pointer;
	position: fixed;
	top: 20px;
	left: 0;
	z-index: 3;
	color: #ffffff;
	font-size: 24px;
	padding: 12px;
	background-color: #3498db;
	border: none;
	border-radius: 50%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	transition: background-color 0.3s ease, left 0.3s ease;
}

#toggle-btn:hover {
	background-color: #2980b9;
}

#toggle-btn::before {
	content: "\2630";
	/* Unicode for hamburger menu icon */
	font-size: 24px;
}

.sidebar-opened #toggle-btn {
	left: 240px;
	/* Move toggle-btn when sidebar opens */
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

    <div id="content">
                  <h2>Welcome, Admin!</h2>
                  <p>This is the administration portal for the student system.</p>
    </div>

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
