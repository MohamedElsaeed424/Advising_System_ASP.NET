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
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        header {
            background-color: #4caf50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px 8px 0 0;
            width: 100%;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            box-sizing: border-box;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .asp-button {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="registrationForm" runat="server">
        <header>Add your Phone Number</header>
                                <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
    <asp:Label ID="Label1" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="true"></asp:Label>
</div>

         <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>

        <label for="PhoneNum"> New Phone Number :</label>
        <asp:TextBox ID="PhoneNum" runat="server"  CssClass="form-control"></asp:TextBox>

        <asp:Button ID="Add" runat="server" Text="Add" CssClass="asp-button" OnClick="AddPhoneNum"/>
    </form>
</body>
</html>