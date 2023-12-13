<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_FetchSemWCourse.aspx.cs" Inherits="Advising_System.Admin_FetchSemWCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" OnClick="FetchSemWCourse" runat="server" Text="Fetch all semesters along with their offered courses" />
            <div style="margin-bottom: 20px;"></div>
            <asp:GridView ID="AllsemWCoursesGV" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="course id" />
                    <asp:BoundField DataField=" Course name" HeaderText="Course name" />
                    <asp:BoundField DataField="semester_code" HeaderText="semester code" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
