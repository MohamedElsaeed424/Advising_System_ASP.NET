<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewCoursesWithPrereq.aspx.cs" Inherits="Advising_System.Student_ViewCoursesWithPrereq" %>

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
            max-width: 900px;
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

        .styled-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .styled-grid th,
        .styled-grid td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
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
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div>
            <h2>View all courses along with their prerequisites</h2>
            <asp:GridView ID="AllCoursesWithPrerequisites" runat="server" AutoGenerateColumns="False" CssClass="styled-grid">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="name" HeaderText="Course Name" />
                    <asp:BoundField DataField="major" HeaderText="Major " />
                    <asp:BoundField DataField="is_offered" HeaderText="IS Offered" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit Hours" />
                    <asp:BoundField DataField="semester" HeaderText="Course Semester" />
                    <asp:BoundField DataField="course_id" HeaderText="Prerequisite Course ID" />
                    <asp:BoundField DataField="name" HeaderText="Prerequisite Course Name" />
                </Columns>
            </asp:GridView>
            <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" CssClass="styled-button" />
            </div>
        </div>
    </form>
</body>
</html>
