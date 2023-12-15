<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_SendRequest.aspx.cs" Inherits="Advising_System.Student_SendRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Send A Course/Credit Hours Request</h2>
        <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
           <asp:Button ID="BackHome" runat="server" OnClick="BackStudentHome" Text="Back" style="height: 29px" />
        </div>
        <p>
            <asp:Label ID="SuccessLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        <div>

            <asp:Label ID="Type" runat="server" Text="Type: "></asp:Label>

            <asp:RadioButton ID="CH" runat="server" GroupName="type" Text="Credit hours" AutoPostBack="True"/>
            <asp:RadioButton ID="CourseRadio" runat="server" GroupName="type" Text="Course" AutoPostBack="True" />

            <br />
            <asp:Label ID="Which" runat="server" Text="Label" Visible="false"></asp:Label>
            <asp:TextBox ID="Credit" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
            <asp:DropDownList ID="Courses" runat="server" Visible="False">
            </asp:DropDownList>
            <br />
            <asp:Label ID="CommentLabel" runat="server" Text="Comment: "></asp:Label>
            <br />
            <asp:TextBox ID="Comment" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
            <br />

        </div>
    </form>
</body>
</html>

