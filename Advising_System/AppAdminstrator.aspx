<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppAdminstrator.aspx.cs" Inherits="Advising_System.AppAdminstrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Administration</title>
    <style>
        body {
            background: linear-gradient(to bottom, #2C3E50, #3498db);
            color: #ecf0f1;
            font-family: 'Arial', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        #header {
            text-align: center;
            padding: 20px;
            background: linear-gradient(to bottom, #3498db, #2C3E50);
            color: #ecf0f1;
            font-size: 30px;
            border-radius: 10px;
        }

        #references {
            text-align: center;
            margin-top: 20px;
        }

        #references a {
            display: inline-block;
            margin: 15px;
            padding: 25px; /* Increased padding */
            width: 200px; /* Increased width */
            background: linear-gradient(to bottom, #3498db, #2C3E50);
            color: #ecf0f1;
            text-decoration: none;
            border-radius: 15px;
            transition: background 0.3s ease, color 0.3s ease;
            font-size: 20px; /* Increased font size */
        }

        #references a:hover {
            background: linear-gradient(to bottom, #2C3E50, #3498db);
            color: #ecf0f1;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <div id="header">Application Administration</div>

            <div id="references">
                <a href="/Admin_Login.aspx">Admin</a>
                <a href="/Advisor_login.aspx">Advisor</a>
                <a href="/Student_Login.aspx">Student</a>
            </div>
        </div>
    </form>
</body>
</html>
