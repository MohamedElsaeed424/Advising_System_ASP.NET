<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorHome.aspx.cs" Inherits="Advising_System.AdvisorHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advisor Home</title>
    <style>
        body {
            background: url('Images/gucblurred.png') center center fixed;
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: black;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Style the buttons */
        .button-style {
            color: white;
            padding: 20px 30px;
            margin: 10px;
            border: none;
            cursor: pointer;
            background-color: orangered;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .button-style:hover {
            background-color: darkred;
        }

        /* Style the dropdown */
        .dropdown-style {
            margin-top: 20px;
        }

        .dropdown-style select {
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Advisor Home</h1>
        <div>
            <div class="button-style">
                <asp:Button ID="AllStudents" runat="server" Text="Show All Your Students" OnClick="AllStudents_Click" />
            </div>
            <div class="button-style">
                <asp:Button ID="InsertNewGrad" runat="server" Text="Graduation Plans" OnClick="InsertNewGrad_Click" />
            </div>
            <div class="button-style">
                <asp:Button ID="AllStudentsWMajor" runat="server" Text="View all students assigned to you from a certain major along with their taken courses" OnClick="AllStudentsWMajor_Click" />
            </div>
            <div class="button-style">
                <asp:Button ID="Requests" runat="server" Text="View Requests" OnClick="Requests_Click" />
            </div>
        </div>
    </form>
</body>
</html>
