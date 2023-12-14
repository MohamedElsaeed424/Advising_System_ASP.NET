<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_fetchActiveStudents.aspx.cs" Inherits="Advising_System.Admin_fetchActiveStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>All Active Students</h2>
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
            <asp:GridView ID="AllActiveStudents" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="student_id" HeaderText="student id" />
                    <asp:BoundField DataField="f_name" HeaderText="first Name" />
                    <asp:BoundField DataField="l_name" HeaderText="Last  name " />
                    <asp:BoundField DataField="gpa" HeaderText="gpa" />
                    <asp:BoundField DataField="faculty" HeaderText="faculty" />
                    <asp:BoundField DataField="email" HeaderText="email" />
                    <asp:BoundField DataField="major" HeaderText="major" />
                    <asp:BoundField DataField="password" HeaderText="password" />
                    <asp:BoundField DataField="financial_status" HeaderText="financial status" />
                    <asp:BoundField DataField="semester" HeaderText="semester" />
                    <asp:BoundField DataField="acquired_hours" HeaderText="acquired hours" />
                    <asp:BoundField DataField="assigned_hours" HeaderText="assigned hours" />
                    <asp:BoundField DataField="advisor_id" HeaderText="advisor id" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
