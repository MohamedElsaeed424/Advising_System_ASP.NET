<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_UpdateExGradDate.aspx.cs" Inherits="Advising_System.Advisor_UpdateExGradDate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Update Expected Graduation Date for Graduation Plane</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" style="height: 29px" />
         </div>
        <div>
            Expected Graduation Date
            <asp:TextBox ID="ExGradDate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <asp:Button ID="UpdateGrad" runat="server" Text="Update" OnClick="UpdateGrad_Click" />
            <asp:Label ID="Message" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
        </div>
        <div>
            <asp:GridView ID="GradPlan" runat="server"></asp:GridView>
        </div>

    </form>
</body>
</html>
