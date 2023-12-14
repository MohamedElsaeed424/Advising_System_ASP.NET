<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewNotPaidInst.aspx.cs" Inherits="Advising_System.Student_ViewNotPaidInst" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <h2>View Upcoming Installment</h2>
          <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
    </div>

        <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
        </div>
       </div>
    </form>
</body>
</html>
