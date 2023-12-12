<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListInstructorCourse.aspx.cs" Inherits="Advising_System.Admin_ListInstructorCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <div>
           <h2>All Instructors and There Courses</h2>
           <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
              <asp:Button ID="BackAdminHome6" runat="server" OnClick="BackAdminHome" Text="Back" />
           </div>
            </div>
            <asp:GridView ID="CoursesAndInstructorsGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="instructor_id" HeaderText="Instructor ID" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor"  />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID"  />
                    <asp:BoundField DataField="Course" HeaderText="Course"  />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
