<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Login.aspx.cs" Inherits="Advising_System.Student_Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Login</title>
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
        }

        .container {
            display: flex;
            justify-content: flex-end;
            /*margin-right: 10%;*/ /* Adjust the right margin as needed */
            
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
            background-color: #362f8c; /* Darkened royal blue */
            color: white;
            text-align: center;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px 8px 0 0;
            width: 100%;
            margin-top: 0; /* Remove default margin */
            margin-left: -15px;
        }

        /* Adjusted margin for label */
        label {
            display: block;
            margin-bottom: 12px;
            margin-left: -5px; /* Adjusted margin to shift to the left */
            font-weight: bold;
            color: #362f8c; /* Darkened royal blue */
        }

        /* Adjusted margin for the StudentID textbox */
        #StudentID {
            margin-left: -5px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            box-sizing: border-box;
            border: 1px solid #362f8c; /* Darkened royal blue */
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
            <header>Student Login</header>

            <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>

            <label for="StudentID">UserID:</label>
            <asp:TextBox ID="StudentID" runat="server" CssClass="form-control"></asp:TextBox>

            <label for="password">Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" EnableViewState="true" ViewStateMode="Enabled"></asp:TextBox>

            <asp:Button ID="Login" runat="server" Text="Log In" CssClass="asp-button" OnClick="Login_Click" />
        </form>
    </div>
</body>
</html>