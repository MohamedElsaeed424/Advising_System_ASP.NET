<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Advising_System.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="AdminHomeForm" runat="server">
        <div >
            <h1>Admin Home Page</h1>
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllAdvisors" runat="server" OnClick="get_Advisors" Text="Show All Advisors" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllAdvisorsWithStudents" runat="server" OnClick="get_AdvisorsWithStudents" Text="Show All Advisors With Students " />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
             <asp:Button ID="AllPendingRequests" runat="server" OnClick="get_AllPendingRequests" Text="Show All Pending Requests " />
        </div>

    </form>
</body>
</html>
