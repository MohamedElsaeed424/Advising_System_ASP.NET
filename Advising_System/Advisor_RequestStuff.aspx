<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_RequestStuff.aspx.cs" Inherits="Advising_System.Advisor_extraCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Requests</title>
  <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('Images/gucblurred.png') center center fixed;
            background-size: cover;
            background-repeat: no-repeat;
            color: black; /* Set text color to white for better visibility */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        #form1 {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #BackHome {
            padding: 8px 16px;
            background-color: orangered;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        #BackHome:hover {
            background-color: darkred;
        }

        #SuccessLabel {
            display: block;
            margin-top: 10px;
        }

        input[type="checkbox"],
        input[type="radio"] {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        #CourseRequests {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #CourseRequests th,
        #CourseRequests td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid white; /* Thick white border */
        }

        #CourseRequests th {
            background-color: darkred;
        }

        .action-button {
            padding: 6px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .action-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>View Requests</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
        </div>
        <div>
            <asp:Label ID="SuccessLabel" runat="server" Text="Label" Visible="false"></asp:Label>
            <br />
            Type:
            <asp:CheckBox ID="Pending" runat="server" Text="Pending only" AutoPostBack="True" />
            &nbsp;&nbsp;
            <asp:RadioButton ID="All" runat="server" Text="All" AutoPostBack="True" GroupName="Type" Checked="true" />
            &nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="Course" runat="server" Text="Courses" AutoPostBack="True" GroupName="Type" />
            &nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="Credit" runat="server" Text="Credit Hours" AutoPostBack="True" GroupName="Type" />
            <asp:GridView ID="CourseRequests" runat="server" AutoGenerateColumns="False" OnRowDataBound="CHRequests_RowDataBound" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:TemplateField HeaderText="Approve/Reject">
                        <ItemTemplate>
                            <asp:Button ID="btnAction" runat="server" Text="Respond" CssClass="action-button" OnClick="Respond_button" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="request_id" HeaderText="Request ID" />
                    <asp:BoundField DataField="type" HeaderText="Type" />
                    <asp:BoundField DataField="comment" HeaderText="Comment" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit hours" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
