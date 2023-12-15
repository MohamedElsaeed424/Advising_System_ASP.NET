<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_AddNewSemester.aspx.cs" Inherits="Advising_System.Admin_AddNewSemester" %>

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
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background: #f0f0f0; /* Form background color */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 800px; /* Set a maximum width for larger screens */
            height:790px;
        }

        #BackAdminHome3 {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        #SuccessLabel {
            color: blue; /* Label text color */
            margin-bottom: 20px;
            display: block;
            text-align:center;
        }

        #Start_Calender,
        #End_Calender,
        #Semester_CodeText {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        #AddSemester {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add New Semester</h2>
            <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                <asp:Label ID="SuccessLabel" runat="server" Text="Add Inputs" ForeColor="Blue" Visible="true"></asp:Label>
            </div>
            <div style="display: flex; align-items: center; justify-content: flex-end; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHome3" runat="server" OnClick="BackAdminHome" Text="Back" />
            </div>
            <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 20px; resize: vertical;">

                <div>
                    <asp:Label ID="Start_Date" runat="server" Text="Start Date"></asp:Label>
                    <asp:Calendar ID="Start_Calender" runat="server" OnSelectionChanged="DateSelectionChanged1"></asp:Calendar>
                    <asp:Label ID="SelectedStartDateLabel1" runat="server" Text="Selected Start Date:"></asp:Label>
                </div>

                <div>
                    <asp:Label ID="End_Date" runat="server" Text="End Date"></asp:Label>
                    <asp:Calendar ID="End_Calender" runat="server" OnSelectionChanged="DateSelectionChanged2"></asp:Calendar>
                    <asp:Label ID="SelectedEndDateLabel2" runat="server" Text="Selected End Date:"></asp:Label>
                </div>

                <div>
                    <asp:Label ID="Semester_Code" runat="server" Text="Semester Code"></asp:Label>
                    <asp:TextBox ID="Semester_CodeText" runat="server"></asp:TextBox>
                </div>

                <div>
                    <asp:Button ID="AddSemester" runat="server" OnClick="post_semester" Text="Add" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>