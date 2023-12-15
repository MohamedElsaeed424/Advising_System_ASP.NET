<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewCoursesWithPrereq.aspx.cs" Inherits="Advising_System.Student_ViewCoursesWithPrereq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <div>
        <h2>View all courses along with their prerequisites</h2>
                                       
        <asp:GridView ID="AllCoursesWithPrerequisites" runat="server" AutoGenerateColumns="False">
        <Columns>
<asp:BoundField DataField="course_id" HeaderText="Course ID" />
<asp:BoundField DataField="name" HeaderText="Course Name" />
<asp:BoundField DataField="major" HeaderText="Major " />
<asp:BoundField DataField="is_offered" HeaderText="IS Offered" />
<asp:BoundField DataField="credit_hours" HeaderText="Credit Hours" />
<asp:BoundField DataField="semester" HeaderText="Course Semester" />
<asp:BoundField DataField="course_id" HeaderText="PreRequsite Course ID" />
<asp:BoundField DataField="name" HeaderText="PreRequsite Course Name" />
        </Columns>
        </asp:GridView>
    <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
        <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
    </div>
        </div>
    </form>
</body>
</html>
