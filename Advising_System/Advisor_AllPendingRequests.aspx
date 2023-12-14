<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_AllPendingRequests.aspx.cs" Inherits="Advising_System.Advisor_AllPendingRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>All Pending Requests</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome2" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <div>
            <asp:GridView ID="PendingRequests" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
