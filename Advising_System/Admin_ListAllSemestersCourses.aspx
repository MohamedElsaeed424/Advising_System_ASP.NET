<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListAllSemestersCourses.aspx.cs" Inherits="Advising_System.Admin_ListAllSemestersCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #16a085, #3498db);
            display: flex;
            align-content:center;
        }

        #form1 {
            padding: 30px;
            margin-left: 240px;
            flex: 1;
            transition: margin-left 0.3s ease;
            border-radius: 10px;
            color: #fff;
        }

        #form1 h2 {
            color: white ;
        }

        #form1 p {
            line-height: 1.6;
        }

        #form1 #BackAdminHome6 {
            display: flex;
            align-items: center;
            justify-content: right;
            margin: 20px;
            resize: vertical;
            align-content:center;
        }

        #form1 #CoursesAndSemestersGridView {
            margin-top: 20px;
            border: 2px solid #fff; /* White border for the table */
            align-content:center;
        }

        #form1 #CoursesAndSemestersGridView th{
            background-color: white; /* Table header background color */
            color:forestgreen ;
        }
        #form1 #CoursesAndSemestersGridView td {
       
            padding: 10px;
            text-align: center;
            color: #fff;
            font-weight: bold; /* Adjust font weight as needed */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <h2>All Courses With Their Offered Semesters</h2>
                <div id="BackAdminHome6">
                    <asp:Button ID="BackAdminHome6" runat="server" OnClick="BackAdminHome" Text="Back" />
                </div>
            </div>
            <asp:GridView ID="CoursesAndSemestersGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="name" HeaderText="Course" />
                    <asp:BoundField DataField="semester_code" HeaderText="Semester Code" />
                </Columns>
            </asp:GridView> 
        </div>
    </form>
</body>
</html>
