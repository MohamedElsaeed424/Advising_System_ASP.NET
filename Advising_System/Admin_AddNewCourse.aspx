<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_AddNewCourse.aspx.cs" Inherits="Advising_System.Admin_AddNewCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div>
    <h2>Add New Course</h2>

    <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Green" Visible="true"></asp:Label>
    </div>

    <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
        <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
    </div>

<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 20px; resize: vertical;">

    <div style="margin-bottom: 20px;">
        <asp:Label ID="Course_Name" runat="server" Text="Course Name"></asp:Label>
        <asp:TextBox ID="Course_NameText" runat="server" CssClass="input-field"></asp:TextBox>
    </div>

    <div style="margin-bottom: 20px;">
        <asp:Label ID="major" runat="server" Text="Course Major"></asp:Label>
        <asp:TextBox ID="CoursemMjorText" runat="server" CssClass="input-field"></asp:TextBox>
    </div>

    <div style="margin-bottom: 20px; display: flex; align-items: center;">
        <asp:Label ID="isOffered" runat="server" Text="Is Offered"></asp:Label>
        <asp:RadioButton ID="Trueid" Text="True" runat="server" CssClass="radio-button" />
        <asp:RadioButton ID="Falseid" Text="False" runat="server" CssClass="radio-button" />
    </div>

    <div style="margin-bottom: 20px;">
        <asp:Label ID="Label1" runat="server" Text="Semester"></asp:Label>
        <asp:DropDownList ID="AllSemesters" runat="server" CssClass="dropdown-list">
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div style="margin-bottom: 20px;">
        <asp:Label ID="CreadtHours" runat="server" Text="Credit Hours"></asp:Label>
        <asp:DropDownList ID="AllCreditHours" runat="server" CssClass="dropdown-list">
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div>
        <asp:Button ID="AddCourse" runat="server" OnClick="post_Course" Text="Add" CssClass="submit-button" />
    </div>
</div>


    </form>
</body>
</html>
