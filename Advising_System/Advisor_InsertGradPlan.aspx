<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_InsertGradPlan.aspx.cs" Inherits="Advising_System.Advisor_InsertGradPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Insert Graduation Plan</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <asp:Label ID="Label1" runat="server" Text="Semester Code"></asp:Label>
        <asp:TextBox ID="semesterCode" runat="server" style="direction: ltr"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Expected Graduation Date"></asp:Label>
        <asp:TextBox ID="ExGradDate" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Semester credit hours"></asp:Label>
        <asp:TextBox ID="semCH" runat="server" TextMode="Number"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Student ID"></asp:Label>
        <asp:DropDownList ID="StudentID" runat="server"></asp:DropDownList>
        <br />
        <asp:Button ID="CreateGrad" runat="server" Text="Create" OnClick="CreateGrad_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Error" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
        <br />
    </form>
</body>
</html>
