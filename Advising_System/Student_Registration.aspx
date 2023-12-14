<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Registration.aspx.cs" Inherits="Advising_System.Registration" %>
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
        <header>Student Registration</header>

         <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>

        <label for="first_name">First Name:</label>
        <asp:TextBox ID="first_name" runat="server" CssClass="form-control"></asp:TextBox>

        <label for="last_name">Last Name:</label>
        <asp:TextBox ID="last_name" runat="server" CssClass="form-control"></asp:TextBox>

        <label for="email">Email:</label>
        <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>

        <label for="password">Password:</label>
        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" EnableViewState="true" ViewStateMode="Enabled" ></asp:TextBox>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <label for="faculty">Faculty:</label>
                <asp:DropDownList ID="faculty" runat="server" CssClass="form-control" OnSelectedIndexChanged="faculty_SelectedIndexChanged" AutoPostBack="True" > <%--onchange="updateMajors()"--%>
                    <asp:ListItem Value="" Text="Select Faculty" Disabled="true" Selected="true"></asp:ListItem>
                    <asp:ListItem Value="media" Text="Faculty of Media Engineering and Technology"></asp:ListItem>
                    <asp:ListItem Value="information" Text="Faculty of Information Engineering and Technology"></asp:ListItem>
                    <asp:ListItem Value="engineering" Text="Faculty of Engineering and Materials Science"></asp:ListItem>
                    <asp:ListItem Value="pharmacy" Text="Faculty of Pharmacy and Biotechnology"></asp:ListItem>
                    <asp:ListItem Value="management" Text="Faculty of Management Technology"></asp:ListItem>
                    <asp:ListItem Value="applied" Text="Faculty of Applied Sciences and Arts"></asp:ListItem>
                    <asp:ListItem Value="law" Text="Faculty of Law and Legal Studies"></asp:ListItem>
                </asp:DropDownList>

                <label for="major">Major:</label>
                <asp:DropDownList ID="major" runat="server" CssClass="form-control" >
                    <asp:ListItem Value="" Text="Select Major" Disabled="true" Selected="true"></asp:ListItem>
                </asp:DropDownList>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="faculty" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <label for="semester">Semester:</label>
        <asp:DropDownList ID="semester" runat="server" CssClass="form-control" >
            <asp:ListItem Value="" Text="Select Semester" Disabled="true" Selected="true"></asp:ListItem>
            <asp:ListItem Value="1" Text="1"></asp:ListItem>
            <asp:ListItem Value="2" Text="2"></asp:ListItem>
            <asp:ListItem Value="3" Text="3"></asp:ListItem>
            <asp:ListItem Value="4" Text="4"></asp:ListItem>
            <asp:ListItem Value="5" Text="5"></asp:ListItem>
            <asp:ListItem Value="6" Text="6"></asp:ListItem>
            <asp:ListItem Value="7" Text="7"></asp:ListItem>
            <asp:ListItem Value="8" Text="8"></asp:ListItem>
            <asp:ListItem Value="9" Text="9"></asp:ListItem>
            <asp:ListItem Value="10" Text="10"></asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="Register" runat="server" Text="Register" CssClass="asp-button"
            onClick="RegisterStudent"/>
    </form>
</body>
</html>




