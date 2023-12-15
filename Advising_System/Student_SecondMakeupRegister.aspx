<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_SecondMakeupRegister.aspx.cs" Inherits="Advising_System.Student_SecondMakeupRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>
    <h2>Register For Second Makeup Exam</h2>
                                   <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
    <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="true"></asp:Label>
</div>
       <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Label ID="Label2" runat="server" Text="Course ID"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>
    <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Label ID="Label3" runat="server" Text="Current Semester"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </div>
<div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
    <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
</div>
     <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Button ID="Button1" runat="server" OnClick="RegisterForSecondMakeupExam" Text="Register" />
    </div>
    </div>
    </form>
</body>
</html>
