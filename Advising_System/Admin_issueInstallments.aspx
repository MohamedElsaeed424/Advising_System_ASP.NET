<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_issueInstallments.aspx.cs" Inherits="Advising_System.Admin_issueInstallments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #16a085, #3498db);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #form1 {
        padding: 30px;
        background: #f8f9fa;
        margin: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        color: forestgreen;
        text-align: center;
    }

    h2, #SuccessLabel, #Label1 {
        color: forestgreen;
    }

    #BackAdminHomeButton {
        background-color: #555;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 10px;
    }

    #AllPayment {
        width: 100%;
        padding: 10px;
        box-sizing: border-box;
        margin-bottom: 20px;
    }

    #IssueIns {
        background-color: #555;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
</style>
    <form id="form1" runat="server">
        <div>
            <h2>All payments</h2>
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
                <asp:Label ID="Label1" runat="server" Text="Select payment"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="AllPayment" runat="server" CssClass="dropdown-list">
                </asp:DropDownList>
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Button ID="IssueIns" OnClick="IssueInstallment" runat="server" Text="Issue installment for this payment" />
            </div>
        </div>
    </form>
</body>
</html>
