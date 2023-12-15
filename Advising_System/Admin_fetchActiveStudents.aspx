<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_fetchActiveStudents.aspx.cs" Inherits="Advising_System.Admin_fetchActiveStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #FFD700, #FF6347); /* Gradient background */
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
      
        }

        form {
            background: #f0f0f0; /* Form background color */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 800px; /* Set a maximum width for larger screens */
        }

        #BackAdminHomeButton {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .container {
            display: flex;
            align-items: flex-end; /* Aligns items to the bottom */
            height: 300px; /* Just an example height */
        
        }

        #AllActiveStudents {
            width: 100%;
        }

        #AllActiveStudents tr {
            border-bottom: 1px solid #ddd; /* Add a border between rows */
        }

        #AllActiveStudents th, #AllActiveStudents td {
            padding: 12px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>All Active Students</h2>
        <div style="display: flex; align-items: center; justify-content: flex-end; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHomeButton" runat="server" OnClick="BackAdminHome" Text="Back" />
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:GridView ID="AllActiveStudents" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                    <asp:BoundField DataField="f_name" HeaderText="First Name" />
                    <asp:BoundField DataField="l_name" HeaderText="Last Name" />
                    <asp:BoundField DataField="gpa" HeaderText="GPA" />
                    <asp:BoundField DataField="faculty" HeaderText="Faculty" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="major" HeaderText="Major" />
                    <asp:BoundField DataField="password" HeaderText="Password" />
                    <asp:BoundField DataField="financial_status" HeaderText="Financial Status" />
                    <asp:BoundField DataField="semester" HeaderText="Semester" />
                    <asp:BoundField DataField="acquired_hours" HeaderText="Acquired Hours" />
                    <asp:BoundField DataField="assigned_hours" HeaderText="Assigned Hours" />
                    <asp:BoundField DataField="advisor_id" HeaderText="Advisor ID" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
