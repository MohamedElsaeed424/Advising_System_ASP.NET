<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_AllAdvisingStudents.aspx.cs" Inherits="Advising_System.Advisor_AllAdvisingStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advising Students</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('Images/gucblurred.png') center center fixed;
            background-size: cover;
            background-repeat: no-repeat;
            color: black; /* Set text color to white for better visibility */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        #form1 {
            max-width: 1080px;
            margin: 0 auto;
            background-color:none;
            padding: 20px;
            border-radius: 8px;
           
        }

        #BackHome {
            padding: 8px 16px;
            background-color: orangered;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        #BackHome:hover {
            background-color: darkred;
        }

        #AllAdvisingStudents {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

            #AllAdvisingStudents th, {
                border-bottom: 2px solid white; /* Thick white border */
            }
        #AllAdvisingStudents td {
            padding: 8px;
            text-align: left;
            border-bottom: 2px solid white; /* Thick white border */
        }

        #AllAdvisingStudents th {
            background-color: darkred;
        }
        #sidebar {
            background: #2c3e50;
            padding: 1em;
            height: 100vh;
            width: 240px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            position: fixed;
            left: -240px;
            transition: left 0.3s ease;
            overflow-y: auto;
            color: #ecf0f1;
            border-radius: 5px;
            background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.1) 0%, rgba(0, 0, 0, 0) 100%);
        }

        #sidebar::-webkit-scrollbar {
            width: 10px;
            background-color: #2c3e50;
        }

        #sidebar::-webkit-scrollbar-thumb {
            background-color: #34495e;
            border-radius: 5px;
        }

        #sidebar::-webkit-scrollbar-thumb:hover {
            background-color: #2980b9;
        }

        #sidebar-header {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            color: #3498db;
        }


        #sidebar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        #sidebar li {
            margin-bottom: 12px;
        }

        #sidebar a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
            transform: scale(1);
            transition: transform 0.2s ease-in-out;
        }

        #sidebar a:hover {
            background: #34495e;
            color: #3498db;
            transform: scale(1.1);
        }

        #toggle-btn {
          cursor: pointer;
          position: fixed;
          top: 20px;
          left: 20px;
          z-index: 3;
          color: cornflowerblue;
          font-size: 20px; /* Reduced font size for smaller button */
          border: none;
          border-radius: 50%; /* Maintains round shape */
          padding: 1px; /* Reduced padding to match smaller size */
          box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); /* Adjusted shadow for smaller size */
          transition: background-color 0.3s ease; /* Removed transition for left position as it's fixed */
        }


        #toggle-btn:hover {
            background-color: #2980b9;
        }

        #toggle-btn::before {
            content: "\2261";
            font-size: 24px; /* Adjusted font size */
        }

        .sidebar-opened #toggle-btn {
            left: 240px;
        }
    </style>
</head>
<body>
    <div id="sidebar">
    <div id="sidebar-header">Contents</div>
        <ul>
            <li><a href="/AdvisorHome.aspx">Home</a></li>
            <li><a href="/Advisor_AllAdvisingStudents.aspx">View All Your Students</a></li>
            <li><a href="/Advisor_GraduationPlan.aspx">Graduation Plans</a></li>
            <li><a href="/Advisor_AllStudentsMajorCourse.aspx">View all students assigned to you from a certain major along with their taken courses</a></li>
            <li><a href="/Advisor_RequestStuff.aspx">View Requests</a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
        <h2>Advising Students</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <asp:GridView ID="AllAdvisingStudents" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                <asp:BoundField DataField="f_name" HeaderText="First Name" />
                <asp:BoundField DataField="l_name" HeaderText="Last Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="faculty" HeaderText="Faulty" />
                <asp:BoundField DataField="major" HeaderText="Major" />
                <asp:BoundField DataField="semester" HeaderText="Senester" />
                <asp:BoundField DataField="gpa" HeaderText="GPA" />
                <asp:BoundField DataField="financial_status" HeaderText="Financial Status" />
                <asp:BoundField DataField="acquired_hours" HeaderText="Acquired Hours" />
                <asp:BoundField DataField="assigned_hours" HeaderText="Assigned Hours" />
            </Columns>
        </asp:GridView>
    </form>
     <div id="toggle-btn"></div>

 <script>
     const sidebar = document.getElementById('sidebar');
     const content = document.getElementById('content');
     const toggleBtn = document.getElementById('toggle-btn');

     toggleBtn.addEventListener('click', () => {
         const sidebarWidth = sidebar.offsetWidth;

         if (sidebar.style.left === '0px' || sidebar.style.left === '') {
             sidebar.style.left = `-${sidebarWidth}px`;
             content.style.marginLeft = '0';
         } else {
             sidebar.style.left = '0';
             content.style.marginLeft = `${sidebarWidth}px`;
         }
     });
 </script>
</body>
</html>



