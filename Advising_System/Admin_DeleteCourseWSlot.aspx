<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_DeleteCourseWSlot.aspx.cs" Inherits="Advising_System.Admin_DeleteCourseWSlot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Insert course ID"></asp:Label><br/>
            <div style="margin-bottom: 20px;"></div>
            <asp:TextBox ID="CourseID" runat="server"></asp:TextBox> <br/>
            <div style="margin-bottom: 20px;"></div>
            <input id="Button1" type="button" onclick = "DeleteCourse" value="Delete" /> <br/>
        </div>
    </form>
</body>
</html>
