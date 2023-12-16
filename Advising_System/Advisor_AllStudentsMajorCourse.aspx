<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_AllStudentsMajorCourse.aspx.cs" Inherits="Advising_System.Advisor_AllStudentsMajorCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Students By Major</title>
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

        h2 {
            text-align: center;
            margin-top: 20px;
            color: white;
            background: linear-gradient(to right, #c02425, #f0cb35); /* Gradient background for h2 */
            display: inline-block; /* Ensures the background spans the entire width of the container */
            padding: 10px; /* Adjust padding as needed */
            border-radius: 8px; /* Add border-radius for rounded corners */
        }



        #form1 {
            max-width: 800px;
            margin: 0 auto; /* Center align the form horizontally */
           background: linear-gradient(to right, #4d0099, #330066); /* Gradient background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Center align the form content */
        }



        #BackHome {
           background: linear-gradient(to right, #c02425, #f0cb35); /* Gradient background for h2 */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }

            #BackHome:hover {
                background-color: darkred;
            }

        #majors {
            width: 100%;
            padding: 10px; /* Increased padding for better consistency with the BackHome button */
            margin-bottom: 20px;
            border: none; /* Removed border to match BackHome button */
            background: linear-gradient(to right, #c02425, #f0cb35); /* Gradient background for h2 */
            color: white; /* White text color */
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            #majors:hover {
                background-color: darkred;
            }

        #StudentsWithMajor {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

            #StudentsWithMajor th,
            #StudentsWithMajor td {
                padding: 10px;
                font-weight: bold; /* Set text to bold */
                color: white;
                border: 2px solid white; /* Set table borders to white and thicker */
            }

            #StudentsWithMajor th {
                background-color: white; /* Table header background color */
                color: forestgreen;
            }

        #sidebar {
            background: linear-gradient(to right, #4d0099, #330066); /* Gradient background */
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
            background: linear-gradient(to right, #4d0099, #330066); /* Gradient background */

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
    <div id="content">
        <form id="form1" runat="server">
            <h2>View Students By Major</h2>
            <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
                <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
            </div>
            <div>
                <asp:DropDownList ID="majors" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="majors_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <asp:GridView ID="StudentsWithMajor" runat="server" ShowHeaderWhenEmpty="True">
            </asp:GridView>
        </form>
    </div>
    <div id="toggle-btn"></div>

    <script>
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('form1');
        const toggleBtn = document.getElementById('toggle-btn');

        toggleBtn.addEventListener('click', () => {
            const sidebarWidth = sidebar.offsetWidth;

            if (sidebar.style.left === '0px' || sidebar.style.left === '') {
                sidebar.style.left = `-${sidebarWidth}px`;
            } else {
                sidebar.style.left = '0';
            }
        });
    </script>
</body>
</html>
