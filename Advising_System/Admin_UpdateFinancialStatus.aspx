<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_UpdateFinancialStatus.aspx.cs" Inherits="Advising_System.Admin_UpdateFinancialStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>All Students</h2>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>
            </div>
            <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHomeButton" runat="server" OnClick="BackAdminHome" Text="Back" />
                <style>
        .container {
            display: flex;
            align-items: flex-end;
            height: 300px;
        }
    </style>
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label1" runat="server" Text="Select Student"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="AllStudents" runat="server" CssClass="dropdown-list">
                </asp:DropDownList>
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Button ID="UpdateFinance" OnClick="UpdateFinancialStatus" runat="server" Text="Delete slot for this course" />
            </div>
        </div>
    </form>
</body>
</html>
