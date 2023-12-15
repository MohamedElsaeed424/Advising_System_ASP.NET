<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_AllAdvisingStudents.aspx.cs" Inherits="Advising_System.Advisor_AllAdvisingStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advising Students</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('Images/gucblurred.png') center center fixed;
background-size: cover;
background-repeat: no-repeat;
            color: black; /* Set text color to white for better visibility */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        #form1 {
            max-width: 1920px;
            margin: 0 auto;
            background-color:none;
            padding: 20px;
            border-radius: 8px;
           
        }

        #BackHome {
            padding: 8px 16px;
            background-color: orangered;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        #BackHome:hover {
            background-color: darkred;
        }

        #AllAdvisingStudents {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

            #AllAdvisingStudents th, {
                border-bottom: 2px solid white; /* Thick white border */
            }
        #AllAdvisingStudents td {
            padding: 8px;
            text-align: left;
            border-bottom: 2px solid white; /* Thick white border */
        }

        #AllAdvisingStudents th {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Advising Students</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <asp:GridView ID="AllAdvisingStudents" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                <asp:BoundField DataField="f_name" HeaderText="First Name" />
                <asp:BoundField DataField="l_name" HeaderText="Last Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="faculty" HeaderText="Faulty" />
                <asp:BoundField DataField="major" HeaderText="Major" />
                <asp:BoundField DataField="semester" HeaderText="Senester" />
                <asp:BoundField DataField="gpa" HeaderText="GPA" />
                <asp:BoundField DataField="financial_status" HeaderText="Financial Status" />
                <asp:BoundField DataField="acquired_hours" HeaderText="Acquired Hours" />
                <asp:BoundField DataField="assigned_hours" HeaderText="Assigned Hours" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>



