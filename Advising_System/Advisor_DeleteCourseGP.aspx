<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_DeleteCourseGP.aspx.cs" Inherits="Advising_System.Advisor_DeleteCourseGP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Insert Graduation Plan</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Student ID"></asp:Label>
            <asp:DropDownList ID="StudentID" runat="server"></asp:DropDownList>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Semester Code"></asp:Label>
            <asp:TextBox ID="semesterCode" runat="server" style="direction: ltr"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Course ID"></asp:Label>
            <asp:DropDownList ID="CourseIDs" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="DeleteCourse" runat="server" Text="Delete" OnClick="DeleteCourse_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Message" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
