<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewAllRequiredCourses.aspx.cs" Inherits="Advising_System.Student_ViewAllRequiredCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        h2 {
            text-align: center;
            color: #333;
        }

        #form1 {
            width: 100%;
        }

        #SuccessLabel {
            margin-bottom: 20px;
        }

        #Semester_Code,
        #Button2,
        #BackStudentHome2 {
            margin-bottom: 20px;
        }

        #Semester_CodeText,
        #faculty,
        #major,
        #semester {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #Button2,
        #BackStudentHome2,
        #Register {
            background-color: #4CAF50;
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

        #Button2:hover,
        #BackStudentHome2:hover,
        #Register:hover {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
        }

        #BackStudentHome2 {
            align-self: flex-end;
        }

        #BackAdminHome5 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Required Courses</h2>
            <div>
                <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="false"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Semester_Code" runat="server" Text="Semester Code"></asp:Label>
                <asp:TextBox ID="Semester_CodeText" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="Button2" runat="server" OnClick="Get_RequiredCourses" Text="Show Courses" />
            </div>
            <div>
                <asp:GridView ID="AllRequiredCourses" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Course Name" />
                        <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <asp:Button ID="BackStudentHome2" runat="server" OnClick="BackStudentHome" Text="Back" />
            </div>
        </div>
    </form>
</body>
</html>
