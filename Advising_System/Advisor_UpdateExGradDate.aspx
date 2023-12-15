<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_UpdateExGradDate.aspx.cs" Inherits="Advising_System.Advisor_UpdateExGradDate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('Images/gucblurred.png') center center fixed;
            background-size: cover;
            background-repeat: no-repeat;
            color: black; /* Set text color to black for better visibility */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        #form1 {
            max-width: 800px;
            margin: 0 auto;
            background-color: none;
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

        label {
            display: block;
            margin-top: 10px;
        }

        input,
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #AddCourse {
            padding: 10px 20px;
            background-color: orangered;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #AddCourse:hover {
            background-color: darkred;
        }

        #Message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Update Expected Graduation Date for Graduation Plane</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" style="height: 29px" />
         </div>
        <div>
            Student ID
            <asp:DropDownList ID="StudentID" runat="server">
            </asp:DropDownList>
            <br />
            Expected Graduation Date
            <asp:TextBox ID="ExGradDate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <asp:Button ID="UpdateGrad" runat="server" Text="Update" OnClick="UpdateGrad_Click" />
            <asp:Label ID="Message" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
