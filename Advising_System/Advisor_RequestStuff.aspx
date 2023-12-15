<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_RequestStuff.aspx.cs" Inherits="Advising_System.Advisor_extraCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>View Requests</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
             <br />
         </div>
        <div>
             <asp:Label ID="SuccessLabel" runat="server" Text="Label" Visible="false"></asp:Label>
             <br />
             Type:
             <asp:CheckBox ID="Pending" runat="server" Text="Pending only" AutoPostBack="True"/>
             &nbsp;&nbsp;
             <asp:RadioButton ID="All" runat="server" Text="All" AutoPostBack="True" GroupName="Type" Checked="true"/>
         &nbsp;&nbsp;&nbsp;
             <asp:RadioButton ID="Course" runat="server"  Text="Courses" AutoPostBack="True" GroupName="Type" />
&nbsp;&nbsp;&nbsp;
             <asp:RadioButton ID="Credit" runat="server" Text="Credit Hours" AutoPostBack="True" GroupName="Type"/>
            <asp:GridView ID="CourseRequests" runat="server" AutoGenerateColumns="False" OnRowDataBound="CHRequests_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Approve/Reject">
                     <ItemTemplate>
                        <asp:Button ID="btnAction" runat="server" Text="Respond" OnClick="Respond_button" />
                    </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="request_id" HeaderText="Request ID" />
                     <asp:BoundField DataField="type" HeaderText="Type" />
                     <asp:BoundField DataField="comment" HeaderText="Comment" />
                     <asp:BoundField DataField="status" HeaderText="Status" />
                     <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                     <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit hours" />
                </Columns>
        </asp:GridView>
        </div>
    </form>
</body>
</html>
