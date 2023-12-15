<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Registration.aspx.cs" Inherits="Advising_System.Registration" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Registration Form</title>
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

        label {
            margin-bottom: 10px;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .asp-button {
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

        .asp-button:hover {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
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
            <li><a href="/StudentHome.aspx">Home</a></li>
 <li><a href="/Student_ViewGradPlan.aspx">View graduation plan along with assigned courses</a></li>
 <li><a href="/Student_ViewNotPaidInst.aspx">View upcoming not paid installment</a></li>
 <li><a href="/Student_ViewCoursesWithExams.aspx">View courses with their exams details</a></li>
 <li><a href="/Student_FirstMakeupRegister.aspx">Register for first makeup exam</a></li>
 <li><a href="/Student_SecondMakeupRegister.aspx">Register for second makeup exam</a></li>
 <li><a href="/Student_ViewCoursesWithSlotsAndInstructors.aspx">View courses with their corresponding slots and instructors</a></li>
 <li><a href="/Student_ViewSlotsForCourse.aspx">View slots of a certain course</a></li>
 <li><a href="/Student_ChooseInstructorForCourse.aspx">Choose instructor for a certain course</a></li>
 <li><a href="/Student_ViewCoursesWithPrereq.aspx">View details of courses with their prerequisites</a></li>
 <li><a href="/Student_AddPhoneNum.aspx">Add Phone Number</a></li>
 <li><a href="/Student_ViewMissingCourses.aspx">View Missing Courses</a></li>
 <li><a href="/Student_ViewAllCoursesCurrentSemester.aspx">View All Available Courses in Your Current semester</a></li>
 <li><a href="/Student_ViewAllOptionalCourses.aspx">View All Optional Courses</a></li>
 <li><a href="/Student_ViewAllRequiredCourses.aspx">View All Required Courses</a></li>
 <li><a href="/Student_Registration.aspx">Student Regiseration</a></li>
 <li><a href="/Student_SendRequest.aspx">Student Send Request</a></li>
        </ul>
</div>
    <form id="registrationForm" runat="server">
        <h2>Student Registration</h2>
         <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="false"></asp:Label>
        <label for="first_name">First Name:</label>
        <asp:TextBox ID="first_name" runat="server" CssClass="form-control"></asp:TextBox>

        <label for="last_name">Last Name:</label>
        <asp:TextBox ID="last_name" runat="server" CssClass="form-control"></asp:TextBox>

        <label for="email">Email:</label>
        <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>

        <label for="password">Password:</label>
        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" EnableViewState="true" ViewStateMode="Enabled" ></asp:TextBox>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <label for="faculty">Faculty:</label>
                <asp:DropDownList ID="faculty" runat="server" CssClass="form-control" OnSelectedIndexChanged="faculty_SelectedIndexChanged" AutoPostBack="True" > <%--onchange="updateMajors()"--%>
                    <asp:ListItem Value="" Text="Select Faculty" Disabled="true" Selected="true"></asp:ListItem>
                    <asp:ListItem Value="media" Text="Faculty of Media Engineering and Technology"></asp:ListItem>
                    <asp:ListItem Value="information" Text="Faculty of Information Engineering and Technology"></asp:ListItem>
                    <asp:ListItem Value="engineering" Text="Faculty of Engineering and Materials Science"></asp:ListItem>
                    <asp:ListItem Value="pharmacy" Text="Faculty of Pharmacy and Biotechnology"></asp:ListItem>
                    <asp:ListItem Value="management" Text="Faculty of Management Technology"></asp:ListItem>
                    <asp:ListItem Value="applied" Text="Faculty of Applied Sciences and Arts"></asp:ListItem>
                    <asp:ListItem Value="law" Text="Faculty of Law and Legal Studies"></asp:ListItem>
                </asp:DropDownList>

                <label for="major">Major:</label>
                <asp:DropDownList ID="major" runat="server" CssClass="form-control" >
                    <asp:ListItem Value="" Text="Select Major" Disabled="true" Selected="true"></asp:ListItem>
                </asp:DropDownList>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="faculty" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <label for="semester">Semester:</label>
        <asp:DropDownList ID="semester" runat="server" CssClass="form-control" >
            <asp:ListItem Value="" Text="Select Semester" Disabled="true" Selected="true"></asp:ListItem>
            <asp:ListItem Value="1" Text="1"></asp:ListItem>
            <asp:ListItem Value="2" Text="2"></asp:ListItem>
            <asp:ListItem Value="3" Text="3"></asp:ListItem>
            <asp:ListItem Value="4" Text="4"></asp:ListItem>
            <asp:ListItem Value="5" Text="5"></asp:ListItem>
            <asp:ListItem Value="6" Text="6"></asp:ListItem>
            <asp:ListItem Value="7" Text="7"></asp:ListItem>
            <asp:ListItem Value="8" Text="8"></asp:ListItem>
            <asp:ListItem Value="9" Text="9"></asp:ListItem>
            <asp:ListItem Value="10" Text="10"></asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="Register" runat="server" Text="Register" CssClass="asp-button" onClick="RegisterStudent"/>
         <div style="display: flex; justify-content: center; margin-top: 20px;">
        Already Have an account?
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/Student_Login.aspx">Log In</asp:HyperLink>
 </div>
    </form>
</body>
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
</html>
