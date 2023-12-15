<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewSlotsForCourse.aspx.cs" Inherits="Advising_System.Student_ViewSlotsForCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 20px;
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
        }

        .back-button {
            background-color: #4CAF50; /* Red */
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

        .back-button:hover {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
        }

        .styled-label {
            display: flex;
            justify-content: center;
            margin: 20px;
            resize: vertical;
        }

        .grid-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px;
            resize: vertical;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div>
            <h2>Search For Slots</h2>
            <div class="styled-label">
                <asp:Label ID="Label1" runat="server" Text="Course ID"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div class="styled-label">
                <asp:Label ID="Label2" runat="server" Text="Instructor ID"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True"></asp:GridView>
                <div class="styled-label">
                    <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="true"></asp:Label>
                </div>
            </div>
            <div class="styled-label">
                <asp:Button ID="Button1" runat="server" OnClick="SearchForSlots" Text="Search" CssClass="styled-button" />
            </div>
            <div class="styled-label">
                <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" CssClass="back-button" />
            </div>
        </div>
    </form>
</body>
</html>
