<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Advising_System.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="AdminHomeForm" runat="server">
        <div >
            <h1>Admin Home Page</h1>
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllAdvisors" runat="server" OnClick="get_Advisors" Text="Show All Advisors" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllAdvisorsWithStudents" runat="server" OnClick="get_AdvisorsWithStudents" Text="Show All Advisors With Students " />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllPendingRequests" runat="server" OnClick="get_AllPendingRequests" Text="Show All Pending Requests " />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AddNewSemester" runat="server" OnClick="Post_newSemetser" Text="Add New Semester " />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AddNewCourse" runat="server" OnClick="Post_newCourse" Text="Add New Course " />
        </div>
         <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllInstructorsWithCourses" runat="server" OnClick="get_AllInstructorsWithThereCourses" Text="All Instructors with there courses" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllOfferedCourses" runat="server" OnClick="get_AllOfferedCourses" Text="All Offered Courses With there Semesters" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="LinkInstructorToCourse" runat="server" OnClick="post_LinkInstructorToCourse" Text="Link Instructor To Course" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="LinkStudentToAdvisor" runat="server" OnClick="post_LinkStudentToAdvisor" Text="Link Student To Advisor" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="LinkStudentToCourseInstructor" runat="server" OnClick="post_LinkStudentToCourseInstructor" Text="Link Student To Course and Instructor" />
        </div>

    </form>
</body>
</html>
