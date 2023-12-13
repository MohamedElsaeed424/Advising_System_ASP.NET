<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Registration.aspx.cs" Inherits="Advising_System.Registration" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        header {
            background-color: #4caf50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px 8px 0 0;
            width: 100%;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            box-sizing: border-box;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .asp-button {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="registrationForm" runat="server">
        <header>Student Registration</header>

         <asp:Label ID="SuccessLabel" runat="server" Text="Choose Inputs" ForeColor="Blue" Visible="true"></asp:Label>

        <label for="first_name">First Name:</label>
        <asp:TextBox ID="first_name" runat="server" CssClass="form-control"></asp:TextBox>

        <label for="last_name">Last Name:</label>
        <asp:TextBox ID="last_name" runat="server" CssClass="form-control"></asp:TextBox>

        <label for="password">Password:</label>
        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" EnableViewState="true" ViewStateMode="Enabled" ></asp:TextBox>

        <label for="faculty">Faculty:</label>
        <asp:DropDownList ID="faculty" runat="server" CssClass="form-control" OnSelectedIndexChanged="faculty_SelectedIndexChanged" AutoPostBack="True" > <%--onchange="updateMajors()"--%>
            <asp:ListItem Value="" Text="Select Faculty" Disabled="true" Selected="true"></asp:ListItem>
            <asp:ListItem Value="media" Text="Faculty of Media Engineering and Technology"></asp:ListItem>
            <asp:ListItem Value="information" Text="Faculty of Information Engineering and Technology"></asp:ListItem>
            <asp:ListItem Value="engineering" Text="Faculty of Engineering and Materials Science"></asp:ListItem>
            <asp:ListItem Value="pharmacy" Text="Faculty of Pharmacy and Biotechnology"></asp:ListItem>
            <asp:ListItem Value="management" Text="Faculty of Management Technology"></asp:ListItem>
            <asp:ListItem Value="applied" Text="Faculty of Applied Sciences and Arts"></asp:ListItem>
            <asp:ListItem Value="law" Text="Faculty of Law and Legal Studies"></asp:ListItem>
        </asp:DropDownList>

        <label for="major">Major:</label>
        <asp:DropDownList ID="major" runat="server" CssClass="form-control" >
            <asp:ListItem Value="" Text="Select Major" Disabled="true" Selected="true"></asp:ListItem>
        </asp:DropDownList>

        <label for="semester">Semester:</label>
        <asp:DropDownList ID="semester" runat="server" CssClass="form-control" >
            <asp:ListItem Value="" Text="Select Semester" Disabled="true" Selected="true"></asp:ListItem>
            <asp:ListItem Value="1" Text="1"></asp:ListItem>
            <asp:ListItem Value="2" Text="2"></asp:ListItem>
            <asp:ListItem Value="3" Text="3"></asp:ListItem>
            <asp:ListItem Value="4" Text="4"></asp:ListItem>
            <asp:ListItem Value="5" Text="5"></asp:ListItem>
            <asp:ListItem Value="6" Text="6"></asp:ListItem>
            <asp:ListItem Value="7" Text="7"></asp:ListItem>
            <asp:ListItem Value="8" Text="8"></asp:ListItem>
            <asp:ListItem Value="9" Text="9"></asp:ListItem>
            <asp:ListItem Value="10" Text="10"></asp:ListItem>
        </asp:DropDownList>

        <%--<button type="submit">Register</button>--%>
        <asp:Button ID="Register" runat="server" Text="Register" CssClass="asp-button"
            onClick="RegisterStudent"/>
    </form>

    <script>
        function updateMajors() {
            var facultySelect = document.getElementById('<%= faculty.ClientID %>');
            var majorSelect = document.getElementById('<%= major.ClientID %>');

            // Clear existing options
            majorSelect.innerHTML = '<option value="" disabled selected>Select Major</option>';

            // Add options based on the selected faculty
            var facultyValue = facultySelect.value;
            switch (facultyValue) {
                case "media":
                    addOption(majorSelect, "Computer Science and Engineering");
                    addOption(majorSelect, "Digital Media Engineering and Technology");
                    break;
                case "information":
                    addOption(majorSelect, "Networks");
                    addOption(majorSelect, "Communications");
                    addOption(majorSelect, "Electronics");
                    break;
                case "engineering":
                    addOption(majorSelect, "Materials Engineering");
                    addOption(majorSelect, "Design and Production Engineering");
                    addOption(majorSelect, "Mechatronics Engineering");
                    addOption(majorSelect, "Civil Engineering");
                    addOption(majorSelect, "Architecture Engineering");
                    break;
                case "pharmacy":
                    addOption(majorSelect, "Pharmacy & Biotechnology");
                    addOption(majorSelect, "Biotechnology");
                    break;
                case "management":
                    addOption(majorSelect, "General Management");
                    addOption(majorSelect, "Business Informatics");
                    addOption(majorSelect, "Technology-based Management");
                    break;
                case "applied":
                    addOption(majorSelect, "Graphic Design");
                    addOption(majorSelect, "Media Design");
                    addOption(majorSelect, "Product Design");
                    break;
                case "law":
                    addOption(majorSelect, "Law and Legal Studies");
                    break;
                default:
                    break;
            }
        }

        function addOption(select, text) {
            var option = document.createElement("option");
            option.text = text;
            //switch (text) {
            //    case "Computer Science and Engineering":
            //        option.value = "CS";
            //        break;
            //    case "Digital Media Engineering and Technology":
            //        option.value = "CS";
            //        break;
            //    case "Networks":
            //        option.value = "CS";
            //        break;
            //    case "Communications":
            //        option.value = "CS";
            //        break;
            //    case "Electronics":
            //        option.value = "CS";
            //        break;
            //    case "Materials Engineering":
            //        option.value = "CS";
            //        break;
            //    case "Design and Production Engineering":
            //        option.value = "CS";
            //        break;
            //    case "Mechatronics Engineering":
            //        option.value = "CS";
            //        break;
            //    case "Civil Engineering":
            //        option.value = "CS";
            //        break;
            //    case "Architecture Engineering":
            //        option.value = "CS";
            //        break;
            //    case "Pharmacy & Biotechnology":
            //        option.value = "CS";
            //        break;
            //    case "Biotechnology":
            //        option.value = "CS";
            //        break;
            //    case "General Management":
            //        option.value = "CS";
            //        break;
            //    case "Business Informatics":
            //        option.value = "CS";
            //        break;
            //    case "Technology-based Management":
            //        option.value = "CS";
            //        break;
            //    case "Graphic Design":
            //        option.value = "CS";
            //        break;
            //    case "Media Design":
            //        option.value = "CS";
            //        break;
            //    case "Product Design":
            //        option.value = "CS";
            //        break;
            //    case "Law and Legal Studies":
            //        option.value = "CS";
            //        break;
            //    case default:
            //        option.value = "???";
            //        break;
            //}
            option.value = "aheeee";
            select.add(option);
        }
    </script>
</body>
</html>




