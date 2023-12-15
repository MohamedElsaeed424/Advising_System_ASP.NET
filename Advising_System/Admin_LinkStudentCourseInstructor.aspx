<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_LinkStudentCourseInstructor.aspx.cs" Inherits="Advising_System.Admin_LinkStudentCourseInstructor" %>

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
            color: forestgreen;
        }

        #BackAdminHome3 {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        #SuccessLabel {
            color: blue; /* Label text color */
            margin-bottom: 20px;
            display: block;
        }

        .dropdown-list {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
            color: forestgreen;
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
            <h2>Assign Student To Course and Instructor</h2>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>
            </div>
            <div style="display: flex; align-items: center; justify-content: flex-end; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHome3" runat="server" OnClick="BackAdminHome" Text="Back" />
            </div>
            <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <div style="margin-bottom: 20px;">
                    <asp:Label ID="Label3" runat="server" Text="Student"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="AllStuendents" runat="server" CssClass="dropdown-list">
                    </asp:DropDownList>
                </div>
                <div style="margin-bottom: 20px;">
                    <asp:Label ID="Label2" runat="server" Text="Course"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="AllCourses" runat="server" CssClass="dropdown-list">
                    </asp:DropDownList>
                </div>
                <div style="margin-bottom: 20px;">
                    <asp:Label ID="Label1" runat="server" Text="Instructor"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="AllInstructors" runat="server" CssClass="dropdown-list">
                    </asp:DropDownList>
                </div>
                <div style="margin-bottom: 20px;">
                    <asp:Label ID="Label4" runat="server" Text="Semester"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="AllSemesters" runat="server" CssClass="dropdown-list">
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:Button ID="LinkStudentCourseIntructor" runat="server" OnClick="post_LinkStudentCourseIntructor" Text="Link" CssClass="submit-button" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
