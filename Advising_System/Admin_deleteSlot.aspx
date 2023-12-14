<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_deleteSlot.aspx.cs" Inherits="Advising_System.Admin_deleteSlot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h2>All Courses and it is assigned slots</h2>
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
                <asp:Label ID="Label1" runat="server" Text="Select Course"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="AllCourses" runat="server" CssClass="dropdown-list">
                    </asp:DropDownList>
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label2" runat="server" Text="Select slot"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="AllSlots" runat="server" CssClass="dropdown-list">
                </asp:DropDownList>
            </div>
            <div style="margin-bottom: 20px;">
                <asp:Label ID="Label4" runat="server" Text="Semester"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="AllSemesters" runat="server" CssClass="dropdown-list">
                </asp:DropDownList>
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Button ID="IssueIns" OnClick="post_DeleteSlotFromCourse" runat="server" Text="Delete slot for this course" />
            </div>
        </div>

    </form>
</body>
</html>
