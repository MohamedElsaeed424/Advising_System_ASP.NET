<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorHome.aspx.cs" Inherits="Advising_System.AdvisorHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Advisor Home</h1>
        <div>
            
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="AllStudents" runat="server" Text="Show All Your Students" OnClick="AllStudents_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="InsertNewGrad" runat="server" Text=" Insert New Graduation Plan " OnClick="InsertNewGrad_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="InserCourseinGP" runat="server" Text="Insert courses for a specific graduation plan" OnClick="InserCourseinGP_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="UpdateGradDate" runat="server" Text="Update Graduation Date for Graduation Plan " OnClick="UpdateGradDate_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="DeleteCourseGP" runat="server" Text="Delete course from a certain graduation plan in a certain semester" OnClick="DeleteCourseGP_Click" />
            </div>
             <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="AllStudentsWMajor" runat="server" Text="View all students assigned to you from a certain major along with their taken courses" OnClick="AllStudentsWMajor_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="AllRequests" runat="server" Text="View All Requests" OnClick="AllRequests_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="AllPendingRequests" runat="server" Text="View all Pending Requests" OnClick="AllPendingRequests_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="RespondCHReq" runat="server" Text="Approve/ reject extra credit hours request" OnClick="RespondCHReq_Click" />
            </div>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                 <asp:Button ID="RespondCourseReq" runat="server" Text="Approve/ reject extra courses request" OnClick="RespondCourseReq_Click" />
        </div>
      </div>
    </form>
</body>
</html>
