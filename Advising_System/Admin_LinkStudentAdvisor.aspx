<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_LinkStudentAdvisor.aspx.cs" Inherits="Advising_System.Admin_LinkStudentAdvisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Link Student With Advisor
             <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>
             </div>
             <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                 <asp:Button ID="BackAdminHome3" runat="server" OnClick="BackAdminHome" Text="Back" />
             </div>
             <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                   <div style="margin-bottom: 20px;">
                        <asp:Label ID="Label1" runat="server" Text="Student"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="AllStuendents" runat="server" CssClass="dropdown-list">
                        </asp:DropDownList>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <asp:Label ID="Label2" runat="server" Text="Advisor"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="AllAdvisors" runat="server" CssClass="dropdown-list">
                        </asp:DropDownList>
                    </div>
                    <div>
                          <asp:Button ID="LinkStudentToAdvisor" runat="server" OnClick="post_LinkStudentToAdvisor" Text="Link" CssClass="submit-button" />
                    </div>
             </div>
        </div>
    </form>
</body>
</html>
