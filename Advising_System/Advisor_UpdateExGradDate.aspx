<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_UpdateExGradDate.aspx.cs" Inherits="Advising_System.Advisor_UpdateExGradDate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background:linear-gradient(to right, #c02425, #f0cb35); /* Gradient background */
            color: white; /* Set text color to black for better visibility */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color:white;
            
        }

        #form1 {
            max-width: 800px;
            margin: 0 auto;
           background: linear-gradient(to right, #4d0099, #330066); 
            padding: 20px;
            border-radius: 8px;
        }

        #BackHome {
            padding: 8px 16px;
            background: linear-gradient(to right, #c02425, #f0cb35);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        #BackHome:hover {
             background: linear-gradient(to right, #4d0099, #330066);
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input,
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        
        }

        #AddCourse {
            padding: 10px 20px;
            background-color: orangered;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #AddCourse:hover {
            background-color: lightgray;
        }

        #Message {
            color: red;
            margin-top: 10px;
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
             background: linear-gradient(to right, #4d0099, #330066); 
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
           color: #ff7f50;
           font-size: 20px; /* Reduced font size for smaller button */
           border: none;
           border-radius: 50%; /* Maintains round shape */
           padding: 1px; /* Reduced padding to match smaller size */
           box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); /* Adjusted shadow for smaller size */
           transition: background-color 0.3s ease; /* Removed transition for left position as it's fixed */
         }


         #toggle-btn:hover {
             background-color: #d35400;
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
        <h2>Update Expected Graduation Date for Graduation Plane</h2>
         <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" style="height: 29px" />
         </div>
        <div>
            Expected Graduation Date
            <asp:TextBox ID="ExGradDate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <asp:Button ID="UpdateGrad" runat="server" Text="Update" OnClick="UpdateGrad_Click" />
            <asp:Label ID="Message" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
        </div>
        <div>
            <asp:GridView ID="GradPlan" runat="server"></asp:GridView>
        </div>

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
