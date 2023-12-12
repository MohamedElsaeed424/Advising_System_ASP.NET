<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="All_StudentsWithAdvisors.aspx.cs" Inherits="Advising_System.All_StudentsWithAdvisors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="AllStudentdWithAdvisorsForm" runat="server">
        <div>
            <asp:RadioButtonList ID="AllAdvisorsRadioList" runat="server" OnSelectedIndexChanged="AllAdvisorsRadioList_SelectedIndexChanged" AutoPostBack="true">
                
            </asp:RadioButtonList>

        </div>
        <div>
            <h2>All Students</h2>
            <asp:GridView ID="AllStudentsWithAdvisorsTable" runat="server" AutoGenerateColumns="False">
                 <Columns>
                     <asp:BoundField DataField="Student_id" HeaderText="Student ID" />
                     <asp:BoundField DataField="Student_name" HeaderText="Student Name" />
                     <asp:BoundField DataField="major" HeaderText="Major" />
                     <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                 </Columns>
             </asp:GridView>
        </div>
    </form>
</body>
</html>
