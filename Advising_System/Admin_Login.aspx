<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="Advising_System.Admin_Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('Images/guc2.png') center center fixed;
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #4caf50;
        }

        form {
            background-color: #f0f2f5; /* Slightly dark grey */
            padding: 50px;
            border-radius: 70px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            text-align: center;
            width: 100%; /* Adjusted width to be proportional */
            max-width: 400px; /* Set a maximum width for larger screens */
            border: 10px solid white; /* Thin white border */
        }

        header {
            background-color: #4caf50; /* Turquoise color */
            color: white;
            text-align: center;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px 8px 0 0;
            width: 100%;
            margin-top: 0; /* Remove default margin */
            margin-left: -15px;
           
        }

        label {
            display: block;
            margin-bottom: 12px;
            margin-left: -5px; /* Adjusted margin to shift to the left */
            font-weight: bold;
            color: #2196F3; /* Blue color */
        }

        #AdminID {
            margin-left: -5px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            box-sizing: border-box;
            border: 1px solid #2196F3; /* Blue color */
            border-radius: 4px;
            color: #2196F3; /* Blue color */
        }

        button {
            background-color: #2196F3;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #2196F3; /* Blue color */
        }

        .asp-button {
            background-color: #2196F3;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;

        }
    </style>
</head>
<body>
    <div class="container">
        <form id="registrationForm" runat="server">
            <header>Admin Login</header>

            <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>

            <label for="AdminID">UserID:</label>
            <asp:TextBox ID="AdminID" runat="server" CssClass="form-control"></asp:TextBox>

            <label for="password">Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" EnableViewState="true" ViewStateMode="Enabled"></asp:TextBox>

            <asp:Button ID="Login" runat="server" Text="Log In" CssClass="asp-button" OnClick="Login_Click" />
        </form>
    </div>
</body>
</html>