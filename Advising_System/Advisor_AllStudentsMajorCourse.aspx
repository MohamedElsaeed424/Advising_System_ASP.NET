<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_AllStudentsMajorCourse.aspx.cs" Inherits="Advising_System.Advisor_AllStudentsMajorCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approve / Reject Course Requests</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
           background: url('Images/gucblurred.png') center center fixed;
background-size: cover;
background-repeat: no-repeat
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: red; /* Set text color to white for better visibility */
        }

        #form1 {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        #majors {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid white; /* White border */
            background-color: orangered; /* Set background color */
            color: white; /* Set text color to white for better visibility */
        }

        #StudentsWithMajor {
            width: 100%;
            border-collapse: collapse;
        }

            #StudentsWithMajor th {
            border-bottom: 10px solid white; /* Thick white border */}
        #StudentsWithMajor td {
            padding: 8px;
            text-align: left;
            border-bottom: 10px solid white; /* Thick white border */
            color: white; /* Set text color to white for better visibility */
        }

        #StudentsWithMajor th {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>View Students By major</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <div>
            <asp:DropDownList ID="majors" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="majors_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <asp:GridView ID="StudentsWithMajor" runat="server" ShowHeaderWhenEmpty="True">
        </asp:GridView>
    </form>
</body>
</html>
