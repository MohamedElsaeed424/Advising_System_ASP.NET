<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_InsertGradPlan.aspx.cs" Inherits="Advising_System.Advisor_InsertGradPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
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

        #CreateGrad {
            padding: 10px 20px;
            background-color: orangered;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #CreateGrad:hover {
            background-color: darkred;
        }

        #Error {
            color: red;
            margin-top: 10px;
        }
    </style>
    <form id="form1" runat="server">
        <h2>Insert Graduation Plan</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <asp:Label ID="Label1" runat="server" Text="Semester Code"></asp:Label>
        <asp:TextBox ID="semesterCode" runat="server" style="direction: ltr"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Expected Graduation Date"></asp:Label>
        <asp:TextBox ID="ExGradDate" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Semester credit hours"></asp:Label>
        <asp:TextBox ID="semCH" runat="server" TextMode="Number"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Student ID"></asp:Label>
        <asp:DropDownList ID="StudentID" runat="server"></asp:DropDownList>
        <br />
        <asp:Button ID="CreateGrad" runat="server" Text="Create" OnClick="CreateGrad_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Error" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
        <br />
    </form>
</body>
</html>
