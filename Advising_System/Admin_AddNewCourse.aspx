<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_AddNewCourse.aspx.cs" Inherits="Advising_System.Admin_AddNewCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
           background: linear-gradient(to right, #16a085, #3498db);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background: #f0f0f0; /* Form background color */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 800px; /* Set a maximum width for larger screens */
        }

        #BackAdminHome5 {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        .radio-button {
            margin-left: 10px;
        }

        .dropdown-list {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        .submit-button {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add New Course</h2>

            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="true"></asp:Label>
            </div>

            <div style="display: flex; justify-content: flex-end; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
            </div>

            <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 20px; resize: vertical;">

                <div style="margin-bottom: 20px;">
                    <asp:Label ID="Course_Name" runat="server" Text="Course Name"></asp:Label>
                    <asp:TextBox ID="Course_NameText" runat="server" CssClass="input-field"></asp:TextBox>
                </div>

                <div style="margin-bottom: 20px;">
                    <asp:Label ID="major" runat="server" Text="Course Major"></asp:Label>
                    <asp:TextBox ID="CoursemMjorText" runat="server" CssClass="input-field"></asp:TextBox>
                </div>

                <div style="margin-bottom: 20px; display: flex; align-items: center;">
                    <asp:Label ID="isOffered" runat="server" Text="Is Offered"></asp:Label>
                    <asp:RadioButton ID="Trueid" Text="True" runat="server" CssClass="radio-button" />
                    <asp:RadioButton ID="Falseid" Text="False" runat="server" CssClass="radio-button" />
                </div>

                <div style="margin-bottom: 20px;">
                    <asp:Label ID="Label1" runat="server" Text="Semester"></asp:Label>
                    <asp:DropDownList ID="AllSemesters" runat="server" CssClass="dropdown-list">
                        <asp:ListItem Selected="True">1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div style="margin-bottom: 20px;">
                    <asp:Label ID="CreadtHours" runat="server" Text="Credit Hours"></asp:Label>
                    <asp:DropDownList ID="AllCreditHours" runat="server" CssClass="dropdown-list">
                        <asp:ListItem Selected="True">1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <asp:Button ID="AddCourse" runat="server" OnClick="post_Course" Text="Add" CssClass="submit-button" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>






