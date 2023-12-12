<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListAllPendingRequests.aspx.cs" Inherits="Advising_System.Admin__ListAllPendingRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h2>All Pending Requests</h2>
           <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
              <asp:Button ID="BackAdminHome3" runat="server" OnClick="BackAdminHome" Text="Back" />
          </div>
            <asp:GridView ID="AllPendingRequestTable" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="request_id" HeaderText="Request ID" />
                    <asp:BoundField DataField="type" HeaderText="Type" />
                    <asp:BoundField DataField="comment" HeaderText="Comment" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit Hours" />
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                    <asp:BoundField DataField="advisor_id" HeaderText="Advisor ID" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                </Columns>
            </asp:GridView>


        </div>
    </form>
</body>
</html>
