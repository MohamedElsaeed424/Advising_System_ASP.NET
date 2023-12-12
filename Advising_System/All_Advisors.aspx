<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="All_Advisors.aspx.cs" Inherits="Advising_System.All_Advisors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="AllAdvisorsForm" runat="server">

        <div>
    <h2>All Advisors</h2>
   <asp:GridView ID="AllAdvisorsTable" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="advisor_id" HeaderText="Advisor ID" />
        <asp:BoundField DataField="name" HeaderText="Name" />
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="office" HeaderText="Office" />
        <asp:BoundField DataField="password" HeaderText="Password" />
    </Columns>
    </asp:GridView>

</div>
    </form>
    
</body>
</html>
