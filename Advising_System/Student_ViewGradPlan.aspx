<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewGradPlan.aspx.cs" Inherits="Advising_System.Student_ViewGradPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>View Graduation Plan</h2>

          <%--  <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label1" runat="server" Text="USER ID"></asp:Label>
         
                &nbsp;
            
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>--%>
            <%--<div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Button ID="Button1" runat="server" OnClick="viewGradPlan" Text="OKAY" />
            </div>--%>
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True">
            </asp:GridView> 
        
         <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
         </div>
        </div>
    </form>
</body>
</html>
