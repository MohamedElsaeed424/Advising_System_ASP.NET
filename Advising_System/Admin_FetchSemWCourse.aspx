<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_FetchSemWCourse.aspx.cs" Inherits="Advising_System.Admin_FetchSemWCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Sem with corresponding courses</h2>
        <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHomeButton" runat="server" OnClick="BackAdminHome" Text="Back" />
            <style>
                .container {
                   display: flex;
                align-items: flex-end; /* Aligns items to the bottom */
                height: 300px; /* Just an example height */
                }
            </style>
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
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
