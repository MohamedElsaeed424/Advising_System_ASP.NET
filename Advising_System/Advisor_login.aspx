<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_login.aspx.cs" Inherits="Advising_System.Advisor_login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Advisor Login</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #c02425, #f0cb35); /* Gradient background */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh; /* Set a minimum height for the body */
            overflow: hidden;
        }

        header {
            text-align: center;
            margin-top: 20px;
            color: navajowhite; /* Darker orange text color */
            background: linear-gradient(to right, #c02425, #f0cb35); /* Gradient background for h2 */
            display: inline-block; /* Ensures the background spans the entire width of the container */
            padding: 10px; /* Adjust padding as needed */
            border-radius: 8px; /* Add border-radius for rounded corners */
        }



        #registrationForm {
            max-width: 800px;
            margin: 0 auto; /* Center align the form horizontally */
            background: linear-gradient(to right, #c02425, #f0cb35); /* Gradient background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Center align the form content */
        }


        header {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

.asp-button {
    background-color: #b52b27; /* Darker shade of orange */
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}


            .asp-button:hover {
                background-color: lightcoral; /* Even darker shade on hover */
            }


        .register-link {
            color: dimgray;
            text-decoration: none;
            font-weight: bold;
        }

        #BackHome {
            display: block;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="registrationForm" runat="server">
        <header>Advisor Login</header>

        <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="false"></asp:Label>

        <label for="AdvisorID">UserID:</label>
        <asp:TextBox ID="AdvisorID" runat="server" CssClass="form-control"></asp:TextBox>

        <label for="password">Password:</label>
        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" EnableViewState="true" ViewStateMode="Enabled"></asp:TextBox>

        <asp:Button ID="Login" runat="server" Text="Log In" CssClass="asp-button" OnClick="Login_Click" />

        <div>
            <br />
            <label>Don't Have an account?</label>

            <asp:HyperLink ID="Register" runat="server" NavigateUrl="/Advisor_Registration.aspx" CssClass="register-link">Register Here</asp:HyperLink>
        </div>

        <a href="/AppAdminstrator.aspx" id="BackHome">Back</a>
    </form>
</body>
</html>
