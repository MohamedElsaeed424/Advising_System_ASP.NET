<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_AddPhoneNum.aspx.cs" Inherits="Advising_System.Student_AddPhoneNum" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Registration Form</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    background: url('Images/EujDw0.jpg') center center fixed;
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
            max-width: 600px;
            margin: auto;
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

        label {
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .asp-button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
            padding: 10px 20px;
            transition-duration: 0.4s;
        }

        .asp-button:hover {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
        }
    </style>
</head>
<body>
    <form id="registrationForm" runat="server" class="container">
        <h2>Add your Phone Number</h2>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="false"></asp:Label>
        </div>


        <label for="PhoneNum"> New Phone Number :</label>
        <asp:TextBox ID="PhoneNum" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Button ID="Add" runat="server" Text="Add" CssClass="asp-button" OnClick="AddPhoneNum"/>
        <div style="display: flex; justify-content: center; margin-top: 20px;">
    <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackStudentHome" Text="Back"
        CssClass="asp-button" />
</div>
    </form>
</body>
</html>
