<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListInstructorCourse.aspx.cs" Inherits="Advising_System.Admin_ListInstructorCourse" %>

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
            color: white; /* Set text color to white */
        }

        form {
            background: none; /* Form background color */
            padding: 20px;
            border-radius: 8px;
            width: 80%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 800px; /* Set a maximum width for larger screens */
        }

        #BackAdminHome6 {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        #CoursesAndInstructorsGridView {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #CoursesAndInstructorsGridView th,
        #CoursesAndInstructorsGridView td {
            padding: 10px;
            font-weight: bold; /* Set text to bold */
            color: white;
            border: 2px solid white; /* Set table borders to white and thicker */
        }

        #CoursesAndInstructorsGridView th {
            background-color: white; /* Table header background color */
            color: forestgreen;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <h2>All Instructors and Their Courses</h2>
                <div style="display: flex; align-items: center; justify-content: flex-end; margin: 20px; resize: vertical;">
                    <asp:Button ID="BackAdminHome6" runat="server" OnClick="BackAdminHome" Text="Back" />
                </div>
            </div>
            <asp:GridView ID="CoursesAndInstructorsGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="instructor_id" HeaderText="Instructor ID" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>








