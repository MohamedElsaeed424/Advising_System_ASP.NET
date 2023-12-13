<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_viewGPWadvisor.aspx.cs" Inherits="Advising_System.Admin_viewGPWadvisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="viewGPbutton" OnClick="ViewGPWadvisor" runat="server" Text="View all graduationplans along with their initiated advisors" />
            <div style="margin-bottom: 20px;"></div>
            <asp:GridView ID="ViewGPgridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="expected_grad_date" HeaderText="expected grad date" />
                    <asp:BoundField DataField="student_id" HeaderText="student id" />
                    <asp:BoundField DataField="semester_credit_hours" HeaderText="semester credit hours" />
                    <asp:BoundField DataField="semester_code" HeaderText="semester code" />
                    <asp:BoundField DataField="plan_id" HeaderText="plan id" />
                    <asp:BoundField DataField="advisor_id" HeaderText="advisor id" />
                    
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
