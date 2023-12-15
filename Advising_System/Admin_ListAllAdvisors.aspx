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
            background: linear-gradient(to right, #FFD700, #FF6347); /* Gradient background */
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
        }

        #AllAdvisorsTable th,
        #AllAdvisorsTable td {
            padding: 10px;
        }

        #AllAdvisorsTable th {
            background-color: #555; /* Table header background color */
            color: white;
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
