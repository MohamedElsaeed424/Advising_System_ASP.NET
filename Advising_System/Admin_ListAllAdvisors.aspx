<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ListAllAdvisors.aspx.cs" Inherits="Advising_System.All_Advisors" %>

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
            background: none; /* Form background color */
            padding: 20px;
            border-radius: 8px;
            width: 80%; /* Adjusted width to be proportional */
            box-sizing: border-box;
            text-align: center;
            max-width: 800px; /* Set a maximum width for larger screens */
            color:white;
        }

        #BackAdminHome2 {
            background-color: #555; /* Button background color */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        #AllAdvisorsTable {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
            
        }

        #AllAdvisorsTable th,
        #AllAdvisorsTable td {
            padding: 10px;
            font-weight: bold; /* Set text to bold */
            color: white;
            border: 2px solid white; /* Set table borders to white and thicker */
        }

        #AllAdvisorsTable th {
            background-color: white; /* Table header background color */
            color:forestgreen ;
        }
    </style>
</head>
<body>
    <form id="AllAdvisorsForm" runat="server">
        <div>
            <h2>All Advisors</h2>
            <div style="display: flex; align-items: center; justify-content: flex-end; margin: 20px; resize: vertical;">
                <asp:Button ID="BackAdminHome2" runat="server" OnClick="BackAdminHome" Text="Back" />
            </div>
            <asp:GridView ID="AllAdvisorsTable" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="advisor_id" HeaderText="Advisor ID" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="office" HeaderText="Office" />
                    <asp:BoundField DataField="password" HeaderText="Password" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>