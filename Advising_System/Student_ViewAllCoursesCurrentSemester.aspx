<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewAllCoursesCurrentSemester.aspx.cs" Inherits="Advising_System.Student_ViewAllCoursesCurrentSemester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <h2>Available Courses</h2>
              <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                 <asp:Button ID="BackStudentHome2" runat="server" OnClick="BackStudentHome" Text="Back" />
             </div>
            <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 20px; resize: vertical;">

              <div style="margin-bottom: 20px;">
                    <asp:Label ID="Semester_Code" runat="server" Text="Semester Code"></asp:Label>
                    <asp:TextBox ID="Semester_CodeText" runat="server"></asp:TextBox>
              </div>
             <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                 <asp:Button ID="Button2" runat="server" OnClick="Get_AllAvailableCourses" Text="Show Courses" />
             </div>
                <div>
               <asp:GridView ID="AllAvailableCourses" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Course Name" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                </Columns>
                </asp:GridView>
                </div>
                                        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
    <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="true"></asp:Label>
</div>
             </div>
        </div>
    </form>
</body>
</html>
