<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_DeleteCourseWSlot.aspx.cs" Inherits="Advising_System.Admin_DeleteCourseWSlot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #16a085, #3498db);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #form1 {
        padding: 30px;
        background: #f8f9fa;
        margin: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        color: white;
        text-align: center;
    }

    #form1 h2 {
        color: #3498db;
    }

    #Label2, #SuccessLabel, #Label1 {
        color: forestgreen;
    }

    #BackAdminHome2 {
        background-color: #555;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #Allcourses {
        width: 100%;
        padding: 10px;
        box-sizing: border-box;
        margin-bottom: 20px;
    }

    #DeleteCourse {
        background-color: #555;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
</style>
    <form id="form1" runat="server">
        <div>
            <div>
                <h2>Choose a course to delete with its assigned slots</h2>
                <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                    <asp:Label ID="Label2" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>
                </div>
                <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
                    <asp:Button ID="BackAdminHome2" runat="server" OnClick="BackAdminHome" Text="Back" />
                    <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                        <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="false"></asp:Label>
                    </div>
                </div>
                <div style="display: flex; align-items: normal; justify-content: center; margin: 20px; resize: vertical;">
                    <asp:Label ID="Label1" runat="server" Text="Select course"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="Allcourses" runat="server" CssClass="dropdown-list">
                    </asp:DropDownList>
                </div>
                <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
                    <asp:Button ID="DeleteCourse" OnClick="DeleteSelectedCourse" runat="server" Text="Delete" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
