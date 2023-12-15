﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewCoursesWithSlotsAndInstructors.aspx.cs" Inherits="Advising_System.Student_ViewCoursesWithSlotsAndInstructors" %>

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
            max-width: 800px;
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

        .back-button {
            background-color:  #4CAF50;
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
            border: 2px solid  #4CAF50;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div>
            <h2>View Courses With Corresponding Slots And Instructors</h2>
            <asp:GridView ID="CoursesWithCorrespondingSlotsAndInstructors" runat="server" AutoGenerateColumns="False" CssClass="styled-grid">
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="Course ID" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:BoundField DataField="slot_id" HeaderText="Slot ID" />
                    <asp:BoundField DataField="day" HeaderText="Day" />
                    <asp:BoundField DataField="time" HeaderText="Time" />
                    <asp:BoundField DataField="location" HeaderText="Location" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="instructor_id" HeaderText="Instructor ID" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" />
                </Columns>
            </asp:GridView>
            <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" CssClass="back-button" />
            </div>
        </div>
    </form>
</body>
</html>
