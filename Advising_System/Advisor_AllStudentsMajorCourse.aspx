<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_AllStudentsMajorCourse.aspx.cs" Inherits="Advising_System.Advisor_AllStudentsMajorCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Approve / Reject Course Requests</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
         </div>
        <div>
            <asp:DropDownList ID="majors" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="majors_SelectedIndexChanged" >
            </asp:DropDownList>
        </div>
        <asp:GridView ID="StudentsWithMajor" runat="server" ShowHeaderWhenEmpty="True">
        </asp:GridView>
    </form>
</body>
</html>
