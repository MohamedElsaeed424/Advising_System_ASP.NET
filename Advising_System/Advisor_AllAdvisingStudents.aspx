<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_AllAdvisingStudents.aspx.cs" Inherits="Advising_System.Advisor_All_AdvisingStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="ViewAllAdvisingStudents" runat="server" Text="View your Advising Students" />
        </div>
        <h2>Advising Students</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
         </div>
        <asp:GridView ID="AllAdvisingStudents" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                <asp:BoundField DataField="f_name" HeaderText="First Name" />
                <asp:BoundField DataField="l_name" HeaderText="Last Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="faculty" HeaderText="Faulty" />
                <asp:BoundField DataField="major" HeaderText="Major" />
                <asp:BoundField DataField="semester" HeaderText="Senester" />
                <asp:BoundField DataField="gpa" HeaderText="GPA" />
                <asp:BoundField DataField="financial_status" HeaderText="Financial Status" />
                <asp:BoundField DataField="acquired_hours" HeaderText="Acquired Hours" />
                <asp:BoundField DataField="assigned_hours" HeaderText="Assigned Hours" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
