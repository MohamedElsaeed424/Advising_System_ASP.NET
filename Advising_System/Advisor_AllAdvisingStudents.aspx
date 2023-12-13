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
                <asp:BoundField DataField="Student_id" HeaderText="Advisor ID" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="major" HeaderText="Email" />
                <asp:BoundField DataField="office" HeaderText="Office" />
                <asp:BoundField DataField="password" HeaderText="Password" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
