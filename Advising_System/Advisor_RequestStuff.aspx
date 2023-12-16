<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_RequestStuff.aspx.cs" Inherits="Advising_System.Advisor_extraCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Requests</title>
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
            padding: 10px;
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

        #SuccessLabel {
            display: block;
            margin-top: 10px;
        }

        input[type="checkbox"],
        input[type="radio"] {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        /* Style the radio button */
        input[type="radio"] {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            outline: none;
            width: 20px; /* Set a smaller width */
            height: 20px; /* Set a smaller height */
            border-radius: 50%;
            border: 2px solid #f0cb35; /* Set border color to the gradient orange */
            margin-right: 5px;
            position: relative;
            cursor: pointer;
        }

            /* Style the radio button when checked */
            input[type="radio"]:checked::before {
                content: '';
                width: 12px; /* Set a smaller width for the checked state */
                height: 12px; /* Set a smaller height for the checked state */
                background-color: #fff; /* Set color to white */
                border-radius: 50%;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }



        #CourseRequests {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

            #CourseRequests th,
            #CourseRequests td {
                padding: 10px;
                font-weight: bold; /* Set text to bold */
                color: white;
                border: 2px solid white; /* Set table borders to white and thicker */
            }

            #CourseRequests th {
                background-color: white; /* Table header background color */
                color: forestgreen;
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

        #Pending {
            margin-top: 10px;
            margin-bottom: 10px;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            outline: none;
            width: 16px;
            height: 16px;
            border-radius: 4px; /* Adjust border-radius as needed */
            border: 2px solid #f0cb35; /* Set border color to the gradient orange */
            position: relative;
            cursor: pointer;
        }

            #Pending:checked::before {
                content: '\2713'; /* Unicode character for a checkmark */
                font-size: 15px; /* Adjust font size as needed */
                line-height: 16px;
                color: white; /* Set color to the gradient orange */
                font-weight: bold; /* Make the checkmark bold */
                position: absolute;
                top: -1px;
                left: 1px;
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
        <h2>View Requests</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <div>
            <asp:Label ID="SuccessLabel" runat="server" Text="Label" Visible="false"></asp:Label>
            <br />
            Type:
            <asp:CheckBox ID="Pending" runat="server" Text="Pending only" AutoPostBack="True" CssClass="styled-checkbox" />
            &nbsp;&nbsp;
            <asp:RadioButton ID="All" runat="server" Text="All" AutoPostBack="True" GroupName="Type" Checked="true" />
            &nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="Course" runat="server" Text="Courses" AutoPostBack="True" GroupName="Type" />
            &nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="Credit" runat="server" Text="Credit Hours" AutoPostBack="True" GroupName="Type" />
            <asp:GridView ID="CourseRequests" runat="server" AutoGenerateColumns="False" OnRowDataBound="CHRequests_RowDataBound" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:TemplateField HeaderText="Approve/Reject">
                        <ItemTemplate>
                            <asp:Button ID="btnAction" runat="server" Text="Respond" CssClass="action-button" OnClick="Respond_button" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="request_id" HeaderText="Request ID" />
                    <asp:BoundField DataField="type" HeaderText="Type" />
                    <asp:BoundField DataField="comment" HeaderText="Comment" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit hours" />
                </Columns>
            </asp:GridView>
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
