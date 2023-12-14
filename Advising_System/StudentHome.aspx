<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="Advising_System.StudentHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Student Home Page</h1>
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button1" runat="server" Onclick="ViewGradPlan" Text ="View graduation plan along with assigned courses" Width="380px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button2" runat="server" Onclick="ViewNotPaidInst" Text=" View upcoming not paid installment" Width="282px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button3" runat="server" Onclick="ViewCoursesWithExams" Text="View courses with their exams details" Width="293px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button4" runat="server" Onclick="FirstMakeupRegister" Text="Register for first makeup exam" Width="248px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button5" runat="server" Onclick="SecondMakeupRegister" Text="Register for second makeup exam" Width="247px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button6" runat="server" Onclick="ViewCoursesWithSlotsAndInstructors" Text="View courses with their corresponding slots and instructors" Width="448px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button7" runat="server" Onclick="ViewSlotsForCourse" Text="View slots of a certain course" Width="259px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button8" runat="server" Onclick="ChooseInstructorForCourse" Text=" Choose instructor for a certain course" Width="296px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button9" runat="server" Onclick="ViewCoursesWithPrereq" Text="View details of courses with their prerequisites" Width="357px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button10" runat="server" Onclick="Student_AddPhoneNum" Text="Add Phone Number" Width="357px" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Button ID="Button11" runat="server" Onclick="ViewMissingCourses" Text="View Missing Courses" Width="357px" />
        </div>
    </form>
</body>
</html>
