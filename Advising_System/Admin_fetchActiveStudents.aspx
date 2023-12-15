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
            background: linear-gradient(to right, #16a085, #3498db);
            color: white; /* Set text color to white */
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background: none; /* Removed background color */
            padding: 20px;
            border-radius: 8px;
            width: 80%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 800px; /* Set a maximum width for larger screens */
        }

        #BackAdminHomeButton {
            background-color: #555;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold; /* Set text to bold */
        }

        #AllActiveStudents {
            width: 100%;
            border: 2px solid white; /* Increased table border thickness */
        }

        #AllActiveStudents tr {
            border-bottom: 2px solid #ddd; /* Increased row border thickness */

        }

        #AllActiveStudents th, #AllActiveStudents td {
            padding: 12px;
            text-align: left;
            font-weight: bold; /* Set text to bold */
            
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