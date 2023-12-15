<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_GraduationPlan.aspx.cs" Inherits="Advising_System.Advisor_GraduationPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Graduation Plans</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        #form1 {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #BackHome {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #BackHome:hover {
            background-color: #0056b3;
        }

        #majors {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        #StudentsWithMajor {
            width: 100%;
            border-collapse: collapse;
        }

        #StudentsWithMajor th,
        #StudentsWithMajor td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        #StudentsWithMajor th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Graduation Plans</h2>
        <div style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <asp:Button ID="BackHome" runat="server" OnClick="BackAdvisorHome" Text="Back" />
            <br />
        </div>
        <div>
            <asp:Button ID="AddNew" runat="server" Text="Add New Graduation Plan" OnClick="AddNew_Click" />
        </div>
        <asp:GridView ID="GradPlans" runat="server" ShowHeaderWhenEmpty="True" OnRowDataBound="GP_RowDataBound" >
            <Columns>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:Button ID="ExDate" runat="server" Text="Edit Date" CssClass="action-button" OnClick="ExDate_Click"/>
                        <asp:Button ID="Course" runat="server" Text="Edit Courses" CssClass="action-button" OnClick="Course_Click"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

