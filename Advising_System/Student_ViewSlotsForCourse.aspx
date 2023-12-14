﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_ViewSlotsForCourse.aspx.cs" Inherits="Advising_System.Student_ViewSlotsForCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Search For Slots</h2>
            <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
            <asp:Label ID="Label1" runat="server" Text="Course ID"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
    <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;">
        <asp:Label ID="Label2" runat="server" Text="Instructor ID"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="name" HeaderText="Course name" />
                    <asp:BoundField DataField="slot_id" HeaderText="Slot ID" />
                    <asp:BoundField DataField="day" HeaderText="Day" />
                    <asp:BoundField DataField="time" HeaderText="Time" />
                    <asp:BoundField DataField="location" HeaderText="Location" />
                    <asp:BoundField DataField="name" HeaderText="Instructor Name" />                
                </Columns>
            </asp:GridView> 

                <div style="display: flex; justify-content: center; margin: 20px; resize: vertical;"> 
                    <asp:Button ID="Button1" runat="server" OnClick="SearchForSlots" Text="Search" />
                </div>
            
       <div style="display: flex; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHome5" runat="server" OnClick="BackAdminHome" Text="Back" />
       </div>
            </div>
    </form>
</body>
</html>