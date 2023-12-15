<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_InsertCourseInGradPlan.aspx.cs" Inherits="Advising_System.Advisor_AddCourseToGradPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add Courses to Graduation Plan</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" style="height: 29px" />
         </div>
        <div>
            Course Name
            <asp:DropDownList ID="CourseName" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button ID="AddCourse" runat="server" Text="Add" OnClick="AddCourse_Click" />
            <asp:Label ID="Message" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:GridView ID="GradCourse" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="Delete" runat="server" Text="Delete" CssClass="action-button" OnClick="Delete_Click"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
