<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_FetchSemWCourse.aspx.cs" Inherits="Advising_System.Admin_FetchSemWCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            color: #495057;
            text-align: center;
            font-weight: bold;
                       
        }

            #form1 h2 {
                color: white;
                font-weight: bold;
                
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

        #AllsemWCoursesGV {
            margin-top: 20px;
             border: 10px solid #fff; /* White border for the table */
        }

        #AllsemWCoursesGV th
        {background-color: white
        } #AllsemWCoursesGV td {
            padding: 10px;
            text-align: left;
            color:white;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Semester with corresponding courses</h2>
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
            <asp:GridView ID="AllsemWCoursesGV" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="course id" />
                    <asp:BoundField DataField=" Course name" HeaderText="Course name" />
                    <asp:BoundField DataField="semester_code" HeaderText="semester code" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
