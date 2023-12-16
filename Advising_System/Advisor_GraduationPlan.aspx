<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_GraduationPlan.aspx.cs" Inherits="Advising_System.Advisor_GraduationPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Graduation Plans</title>
    <style>
     body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #c02425, #f0cb35); /* Gradient background */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh; /* Set a minimum height for the body */
            overflow: hidden;
        }

        form {
            background: none; /* Form background color */
            padding: 20px;
            border-radius: 8px;
            width: 95%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 1500px; /* Set a maximum width for larger screens */
            color: white;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            margin: 20px; /* Added margin for better spacing */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: white; /* Text color */
        }

        #BackHome {
            background-color: orangered; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
            transition: background-color 0.3s ease; /* Added transition effect */
        }

        #BackHome:hover {
            background-color: darkred;
        }

        #AddNew {
            background-color: orangered; /* Orange background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease; /* Added transition effect */
        }

        #AddNew:hover {
            background-color: #e67e22; /* Darker shade of orange for hover */
        }
                .action-button {
            background-color: orangered; /* Orange background color */
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Added transition effect */
        }

.action-button:hover {
    background-color: #e67e22; /* Darker shade of orange for hover */
}



        #GradPlans {
            width: 100%;
            border-collapse: collapse;
        }

        #GradPlans th,
        #GradPlans td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        #GradPlans th {
            background-color: white; /* Table header background color */
            color: forestgreen;
        }

        #sidebar {
            background: linear-gradient(to right, #2b0d12, #731d25); /* Darker gradient colors */
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
            color: #e67e22; /* Set to your desired orange color */
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
            background: #d35400; /* Darker shade of orange for hover */
            color: #ecf0f1; /* Lighter complementary color for text */
            transform: scale(1.1);
        }

        #toggle-btn {
            cursor: pointer;
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 3;
            color: #f0cb35; /* Updated color */
            font-size: 20px;
            border: none;
            border-radius: 50%;
            padding: 1px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        #toggle-btn:hover {
            background-color: #d35400;
        }

        #toggle-btn::before {
            content: "\2261";
            font-size: 24px;
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
        <h2>Graduation Plans</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
            <br />
        </div>


        <asp:GridView ID="GradPlans" runat="server" ShowHeaderWhenEmpty="True" OnRowDataBound="GP_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:Button ID="ExDate" runat="server" Text="Edit Date" CssClass="action-button" OnClick="ExDate_Click" />
                        <asp:Button ID="Course" runat="server" Text="Edit Courses" CssClass="action-button" OnClick="Course_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
         <br />
         <br />
        <div>
            <asp:Button ID="AddNew" runat="server" Text="Add New Graduation Plan" OnClick="AddNew_Click" />  
        </div>
    </form>
    <div id="toggle-btn"></div>

    <script>
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('form1');
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
