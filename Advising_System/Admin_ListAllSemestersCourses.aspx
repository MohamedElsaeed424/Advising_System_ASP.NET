<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListAllSemestersCourses.aspx.cs" Inherits="Advising_System.Admin_ListAllSemestersCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>
    <div>
        <h2>All Courses With There Offered Semesters</h2>
        <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
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
</body>
</html>
