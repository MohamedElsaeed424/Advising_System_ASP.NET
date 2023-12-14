<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewCoursesWithExams.aspx.cs" Inherits="Advising_System.Student_ViewCoursesWithExams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>View all courses along with their exams details</h2>
                                    <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
    <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="true"></asp:Label>
</div>
            <asp:GridView ID="AllCoursesWithExam" runat="server" AutoGenerateColumns="False">
            <Columns>
    <asp:BoundField DataField="exam_id" HeaderText=" Exam ID" />
    <asp:BoundField DataField="date" HeaderText="Date" />
    <asp:BoundField DataField="type" HeaderText="Tyoe " />
    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
    <asp:BoundField DataField="name" HeaderText="Course Name" />
    <asp:BoundField DataField="semester" HeaderText="Course Semester" />
            </Columns>
            </asp:GridView>
        <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
        </div>
            </div>
    </form>
</body>
</html>
