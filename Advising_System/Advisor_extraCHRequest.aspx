<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_extraCHRequest.aspx.cs" Inherits="Advising_System.Advisor_extraCHRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Approve / Reject Credit Hours Requests</h2>
        <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <div>
            <asp:GridView ID="CHRequests" runat="server" AutoGenerateColumns="False" OnRowDataBound="CHRequests_RowDataBound">
                <Columns>
                     <asp:BoundField DataField="request_id" HeaderText="Request ID" />
                     <asp:BoundField DataField="type" HeaderText="Type" />
                     <asp:BoundField DataField="comment" HeaderText="Comment" />
                     <asp:BoundField DataField="status" HeaderText="Status" />
                     <asp:BoundField DataField="credit_hours" HeaderText="Credit hours" />
                     <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                     <asp:BoundField DataField="advisor_id" HeaderText="Advisor ID" />
                    <asp:TemplateField HeaderText="Approve/Reject">
                     <ItemTemplate>
                        <asp:Button ID="btnAction" runat="server" Text="Respond" OnClick="Respond_button" />
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
