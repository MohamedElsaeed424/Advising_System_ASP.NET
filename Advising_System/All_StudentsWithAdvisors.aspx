<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="All_StudentsWithAdvisors.aspx.cs" Inherits="Advising_System.All_StudentsWithAdvisors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="AllStudentdWithAdvisorsForm" runat="server">
        <div>
            <h2>Select an Advisor</h2>
            <asp:RadioButtonList ID="AllAdvisorsRadioList" runat="server" OnSelectedIndexChanged="AllAdvisorsRadioList_SelectedIndexChanged" AutoPostBack="true">
                
            </asp:RadioButtonList>
            <h2>Select The Major of The Students</h2>
            <asp:RadioButtonList ID="AllMajorsRadioList" runat="server" OnSelectedIndexChanged="AllMajorsRadioList_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="MET" Value="MET" />
                <asp:ListItem Text="IET" Value="IET" />
                <asp:ListItem Text="BI" Value="BI" />
                <asp:ListItem Text="Engineering" Value="Engineering" />
                <asp:ListItem Text="Pharmacy and Biotechnology" Value="Pharmacy and Biotechnology" />
                <asp:ListItem Text="Engineering and Materials Science" Value="Engineering and Materials Science" />
                <asp:ListItem Text="Management Technology" Value="Management Technology" />
                <asp:ListItem Text="Applied Sciences and Arts" Value="Applied Sciences and Arts" />
                <asp:ListItem Text="Postgraduate Studies & Scientific Research" Value="Postgraduate Studies & Scientific Research" />
                <asp:ListItem Text="Faculty of Law and Legal Studies" Value="Faculty of Law and Legal Studies" />
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
