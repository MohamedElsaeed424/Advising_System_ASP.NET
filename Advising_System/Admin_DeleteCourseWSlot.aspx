<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_DeleteCourseWSlot.aspx.cs" Inherits="Advising_System.Admin_DeleteCourseWSlot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <h2>Choose a course to delete with its assigned slots</h2>
                <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                    <asp:Label ID="Label2" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>
                </div>
                <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                    <asp:Button ID="BackAdminHome2" runat="server" OnClick="BackAdminHome" Text="Back" />
                    <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                        <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>
                    </div>
                </div>
                <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                    <asp:Label ID="Label1" runat="server" Text="Select course"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="Allcourses" runat="server" CssClass="dropdown-list">
                    </asp:DropDownList>
                </div>
                <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                    <asp:Button ID="DeleteCourse" OnClick="DeleteSelectedCourse" runat="server" Text="Delete" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
