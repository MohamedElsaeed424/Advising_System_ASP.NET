<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_FirstMakeupRegister.aspx.cs" Inherits="Advising_System.Student_FirstMakeupRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        h2 {
            text-align: center;
            color: #333;
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

    .styled-button {
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

    .styled-button:hover {
        background-color: white;
        color: black;
        border: 2px solid #4CAF50;
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div>
            <h2>Register For First Makeup Exam</h2>
            <div>
                <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="false"></asp:Label>
            </div>

            <div>
                <asp:Label ID="Label2" runat="server" Text="Course ID"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>

            <div>
                <asp:Label ID="Label3" runat="server" Text="Current Semester"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>

            <div>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </div>

            <div style="display: flex; justify-content: center; margin-top: 20px;">
    <asp:Button ID="Button1" runat="server" OnClick="RegisterForFirstMakeupExam" Text="Register"
        CssClass="styled-button" />
</div>

<div style="display: flex; justify-content: center; margin-top: 20px;">
    <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackStudentHome" Text="Back"
        CssClass="styled-button" />
</div>

        </div>
    </form>
</body>
</html>
