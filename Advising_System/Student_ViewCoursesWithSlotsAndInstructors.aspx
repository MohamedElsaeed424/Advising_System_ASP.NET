<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewCoursesWithSlotsAndInstructors.aspx.cs" Inherits="Advising_System.Student_ViewCoursesWithSlotsAndInstructors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>View Courses With Corresponding Slots And Insrucrors</h2>
            <asp:GridView ID="CoursesWithCorrespondingSlotsAndInsrucrors" runat="server" AutoGenerateColumns="False">
 <Columns>
     <asp:BoundField DataField="CourseID" HeaderText="CourseID" />
     <asp:BoundField DataField="Course" HeaderText="Course" />
     <asp:BoundField DataField="slot_id" HeaderText="SlotID" />
     <asp:BoundField DataField="day" HeaderText="Day" />
     <asp:BoundField DataField="time" HeaderText="Time" />
     <asp:BoundField DataField="location" HeaderText="Location" />
     <asp:BoundField DataField="course_id" HeaderText="Course ID" />
     <asp:BoundField DataField="instructor_id" HeaderText="InstructorID" />
     <asp:BoundField DataField="Instructor" HeaderText="Instructor" />
 </Columns>
 </asp:GridView>
       <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
       </div>
        </div>
    </form>
</body>
</html>
