<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewMissingCourses.aspx.cs" Inherits="Advising_System.Student_ViewMissingCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>  
            <h2>All Advisors</h2>
              <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                 <asp:Button ID="BackStudentHome2" runat="server" OnClick="BackStudentHome" Text="Back" />
             </div>
               <asp:GridView ID="AllMissingCourses" runat="server" AutoGenerateColumns="False">
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
