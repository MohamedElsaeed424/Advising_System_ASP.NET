<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListAllStudentsAdvisors.aspx.cs" Inherits="Advising_System.Admin_ListAllStudentsAdvisors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Students With Advisors</h2>
             <div style="display: flex; align-items: center; justify-content: left; margin: 20px; resize: vertical;">
                 <asp:Button ID="BackAdminHome" runat="server" OnClick="BackAdminHome" Text="Back" />
             </div>
           <asp:GridView ID="AllAdvisorsWithStudentsTable" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                    <asp:BoundField DataField="f_name" HeaderText="First Name" />
                    <asp:BoundField DataField="l_name" HeaderText="Last Name" />
                    <asp:BoundField DataField="advisor_id" HeaderText="Advisor ID" />
                    <asp:BoundField DataField="name" HeaderText="Advisor Name" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
