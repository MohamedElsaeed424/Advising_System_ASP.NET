<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_DeleteCourseGP.aspx.cs" Inherits="Advising_System.Advisor_DeleteCourseGP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insert Graduation Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        #form1 {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #BackHome {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #BackHome:hover {
            background-color: #0056b3;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        #semesterCode,
        #CourseIDs {
            width: calc(100% - 4px);
            padding: 8px;
            margin-top: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        #DeleteCourse {
            padding: 8px 16px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #DeleteCourse:hover {
            background-color: #c82333;
        }

        #Message {
            margin-top: 10px;
            display: block;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Insert Graduation Plan</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Student ID"></asp:Label>
            <asp:DropDownList ID="StudentID" runat="server"></asp:DropDownList>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Semester Code"></asp:Label>
            <asp:TextBox ID="semesterCode" runat="server" style="direction: ltr"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Course ID"></asp:Label>
            <asp:DropDownList ID="CourseIDs" runat="server"></asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="DeleteCourse" runat="server" Text="Delete" OnClick="DeleteCourse_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Message" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
