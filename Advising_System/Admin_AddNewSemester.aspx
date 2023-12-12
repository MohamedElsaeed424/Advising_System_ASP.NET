<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_AddNewSemester.aspx.cs" Inherits="Advising_System.Admin_AddNewSemester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add New Semester
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Green" Visible="true"></asp:Label>
            </div>
             <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                 <asp:Button ID="BackAdminHome3" runat="server" OnClick="BackAdminHome" Text="Back" />
             </div>
    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 20px 20px 20px 140px; resize: vertical;">

        <div style="margin-bottom: 20px;">
            <asp:Label ID="Start_Date" runat="server" Text="Start Date"></asp:Label>
            <asp:Calendar ID="Start_Calender" runat="server" OnSelectionChanged="DateSelectionChanged1"></asp:Calendar>
            <asp:Label ID="SelectedStartDateLabel1" runat="server" Text="Selected Start Date:"></asp:Label>
        </div>

        <div style="margin-bottom: 20px;">
            <asp:Label ID="End_Date" runat="server" Text="End Date"></asp:Label>
            <asp:Calendar ID="End_Calender" runat="server" OnSelectionChanged="DateSelectionChanged2"></asp:Calendar>
            <asp:Label ID="SelectedEndDateLabel2" runat="server" Text="Selected End Date:"></asp:Label>
        </div>

        <div style="margin-bottom: 20px;">
            <asp:Label ID="Semester_Code" runat="server" Text="Semester Code"></asp:Label>
            <asp:TextBox ID="Semester_CodeText" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Button ID="AddSemester" runat="server" OnClick="post_semester" Text="Add" />
        </div>

    </div>


</div>

    </form>
</body>
</html>
