<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Advising_System.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="AdminHomeForm" runat="server">
        <div>
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
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="FetchSemWC" OnClick="Get_FetchSemWCourse" runat="server" Text="Fetch all semesters along with their offered courses" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="ViewStudentsTranscriptButton" OnClick="ViewStudentsTranscript" runat="server" Text="View all students transcript details." />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="viewPaymentButton" OnClick="viewPayment" runat="server" Text="View details for all payments along with their corresponding students" />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="viewGPbutton" OnClick="ViewGPWadvisor" runat="server" Text="View all graduationplans along with their initiated advisors" />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="ViewAllActiveStudentsbutton" OnClick="ViewAllActiveStudents" runat="server" Text="Fetch all active students" />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button1" OnClick="DeleteCourseWSlots" runat="server" Text="Choose a course to detele with its assigned slots" />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button2" OnClick="IssueInstallment" runat="server" Text="Issue installments as per the number of installments for a certain payment." />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button3" OnClick="UpdateFinancial" runat="server" Text="Update a student status based on his/her financial status." />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button4" OnClick="DelteSlot" runat="server" Text="Delete a slot of a certain course" />
        </div>

        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button5" OnClick="AddMakeup" runat="server" Text="Add make up exam" />
        </div>


    </form>
</body>
</html>
