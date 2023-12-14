<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_AddMakeupExam.aspx.cs" Inherits="Advising_System.Admin_AddMakeupExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <h2>Add make up exam </h2>
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
            <div style="margin-bottom: 20px;">
                <asp:Label ID="Label2" runat="server" Text="Cousre"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
            </div>
            <asp:DropDownList ID="AllCourses" runat="server" CssClass="dropdown-list"></asp:DropDownList>
                <asp:Label ID="MakeupDate" runat="server" Text="Exam date"></asp:Label>
                <asp:Calendar ID="Start_Calender" runat="server" OnSelectionChanged="DateSelectionChanged1"></asp:Calendar>
                <asp:Label ID="SelectedStartDateLabel1" runat="server" Text="Selected Start Date:"></asp:Label>
            
        </div>
        <div>
            <asp:Button ID="AddSemester" runat="server" OnClick="post_Exam" Text="Add Exam" />
        </div>


    </form>
</body>
</html>
