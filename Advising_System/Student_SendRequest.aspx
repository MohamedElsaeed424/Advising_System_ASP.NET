<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_SendRequest.aspx.cs" Inherits="Advising_System.Student_SendRequest" %>

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

        #BackHome {
            align-self: flex-end;
            margin-bottom: 20px;
            margin-right: 20px;
            height: 29px;
        }

        p {
            margin-bottom: 0;
        }

        label {
            margin-bottom: 10px;
            color: #333;
        }

        #Type {
            margin-right: 10px;
        }

        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

         .styled-button {
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

 .styled-button:hover {
     background-color: white;
     color: black;
     border: 2px solid #4CAF50;
 }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Send A Course/Credit Hours Request</h2>
        <p>
            <asp:Label ID="SuccessLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        <div>
            <asp:Label ID="Type" runat="server" Text="Type: "></asp:Label>
            <asp:RadioButton ID="CH" runat="server" GroupName="type" Text="Credit hours" AutoPostBack="True"/>
            <asp:RadioButton ID="CourseRadio" runat="server" GroupName="type" Text="Course" AutoPostBack="True" />
            <br />
            <asp:Label ID="Which" runat="server" Text="Label" Visible="false"></asp:Label>
            <asp:TextBox ID="Credit" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
            <asp:DropDownList ID="Courses" runat="server" Visible="False"></asp:DropDownList>
            <br />
            <asp:Label ID="CommentLabel" runat="server" Text="Comment: "></asp:Label>
            <br />
            <asp:TextBox ID="Comment" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" CssClass="styled-button" />
            <br />
             <div style="display: flex; justify-content: center; margin-top: 20px;">
    <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackStudentHome" Text="Back"
        CssClass="styled-button" />
</div>
        </div>
    </form>
</body>
</html>
