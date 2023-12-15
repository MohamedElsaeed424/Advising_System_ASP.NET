<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_AddMakeupExam.aspx.cs" Inherits="Advising_System.Admin_AddMakeupExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #FFD700, #FF6347); /* Gradient background */
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

        h2 {
            color: #333; /* Heading color */
        }

        #BackAdminHomeButton {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        .container {
            display: flex;
            align-items: flex-end;
            height: 300px;
        }

        #AddSemester {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        #AllCourses,
        #makeupDropDown,
        #MakeupDate,
        #Start_Calender,
        #SelectedStartDateLabel1 {
            margin-bottom: 10px;
        }

        #AllCourses,
        #makeupDropDown,
        #Start_Calender {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }

        #Start_Calender {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add make up exam </h2>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>
            </div>
            <div style="display: flex; align-items: center; justify-content: flex-end; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHomeButton" runat="server" OnClick="BackAdminHome" Text="Back" />
            </div>
            <div style="margin-bottom: 20px;">
                <asp:Label ID="Label2" runat="server" Text="Course"></asp:Label>
            </div>
            <asp:DropDownList ID="AllCourses" runat="server" CssClass="dropdown-list"></asp:DropDownList>
            <asp:DropDownList ID="makeupDropDown" runat="server">
                <asp:ListItem Text="First Makeup" Value="First Makeup" />
                <asp:ListItem Text="Second Makeup" Value="Second Makeup" />
            </asp:DropDownList>
            <asp:Label ID="MakeupDate" runat="server" Text="Exam date"></asp:Label>
            <asp:Calendar ID="Start_Calender" runat="server" OnSelectionChanged="DateSelectionChanged1"></asp:Calendar>
            <asp:Label ID="SelectedStartDateLabel1" runat="server" Text="Selected Start Date:"></asp:Label>
        </div>
        <div>
            <asp:Button ID="AddSemester" runat="server" OnClick="post_Exam" Text="Add Exam" />
        </div>
    </form>
</body>
</html>