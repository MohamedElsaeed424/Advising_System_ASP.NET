<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_FirstMakeupRegister.aspx.cs" Inherits="Advising_System.Student_FirstMakeupRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Register For First Makeup Exam</h2>
            <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label2" runat="server" Text="Course ID"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label3" runat="server" Text="Current Semester"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>
            <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </div>
        <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
        </div>
             <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Button ID="Button1" runat="server" OnClick="RegisterForFirstMakeupExam" Text="Register" />
            </div>
            </div>
    </form>
</body>
</html>
