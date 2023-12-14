<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ChooseInstructorForCourse.aspx.cs" Inherits="Advising_System.Student_ChooseInstructorForCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Choose Insrtructor</h2>

    <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Label ID="Label2" runat="server" Text="Instructor ID"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</div>
    <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Label ID="Label3" runat="server" Text="Course ID"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
</div>
                <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Label ID="Label4" runat="server" Text="Current Semester"></asp:Label>
        &nbsp;<asp:TextBox ID="sem" runat="server"></asp:TextBox>
</div>
            <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;"> 
                <asp:Button ID="Button1" runat="server" OnClick="ChooseInstructor" Text="Choose" />
            </div>
       
         <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
             </div>
         </div>
    </form>
</body>
</html>
