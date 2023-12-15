<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_viewStudentsTranscriptDetails.aspx.cs" Inherits="Advising_System.Admin_viewStudentsTranscriptDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #16a085, #3498db);
        display: flex;
        flex-direction: column;
        align-items: center;
        color: white
    }

    #form1 {
        padding: 30px;
        background: none;
        margin: 20px;
        border-radius: 10px;
     
        color: white;
        text-align: center;
    }

    #form1 h2 {
        color: white;
    }

    #BackAdminHomeButton {
        background-color: #555;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 10px;
    }

    #viewTransGV {
        margin-top: 20px;
        border: 2px solid white;
        border-collapse: collapse;
    }

    #viewTransGV th, #viewTransGV td {
        padding: 10px;
        text-align: left;
        color: white;
        border: 2px solid white;
    }
</style>
    <form id="form1" runat="server">
        <h2>View students transcript details </h2>
        <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHomeButton" runat="server" OnClick="BackAdminHome" Text="Back" />
            <style>
        .container {
            display: flex;
            align-items: flex-end; /* Aligns items to the bottom */
            height: 300px; /* Just an example height */
        }
    </style>
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:GridView ID="viewTransGV" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="student_id" HeaderText="student id" />
                    <asp:BoundField DataField="student name" HeaderText="student name" />
                    <asp:BoundField DataField="course_id" HeaderText="course id" />
                    <asp:BoundField DataField="Course name" HeaderText="course name " />
                    <asp:BoundField DataField="exam_type" HeaderText="exam type" />
                    <asp:BoundField DataField=" course grade" HeaderText="course grade" />
                    <asp:BoundField DataField="Semester" HeaderText="semester" />
                    <asp:BoundField DataField="Instructor name" HeaderText="instructor name" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
