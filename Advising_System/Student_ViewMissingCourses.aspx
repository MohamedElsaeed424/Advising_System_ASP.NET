<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewMissingCourses.aspx.cs" Inherits="Advising_System.Student_ViewMissingCourses" %>

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

        #AllMissingCourses {
            width: 100%;
            margin-top: 20px;
        }

       .back-button {
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

.back-button:hover {
    background-color: white;
    color: black;
    border: 2px solid #4CAF50;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>  
            <h2>All Missing Courses</h2>
              <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                 <asp:Button ID="BackStudentHome2" runat="server" OnClick="BackStudentHome" Text="Back" />
             </div>

               <asp:GridView ID="AllMissingCourses" runat="server" AutoGenerateColumns="False">
                <Columns>
                     <asp:BoundField DataField="name" HeaderText="Course Name" />
                     <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                </Columns>
            </asp:GridView>
            <div id="BackStudentHome2">
                <asp:Button ID="BackStudentHome2" runat="server" OnClick="BackStudentHome" Text="Back" CssClass="back-button" />
            </div>
        </div>
    </form>
</body>
</html>
