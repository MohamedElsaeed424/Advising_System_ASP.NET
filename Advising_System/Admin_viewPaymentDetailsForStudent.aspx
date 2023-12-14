<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_viewPaymentDetailsForStudent.aspx.cs" Inherits="Advising_System.Admin_viewPaymentDetailsForStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>View Payment details for students</h2>
        <div style="display: flex; align-items: center; justify-content: right; margin: 20px; resize: vertical;">
            <asp:Button ID="BackAdminHomeButton" runat="server" OnClick="BackAdminHome" Text="Back" />
            <style>
        .container {
            display: flex;
            align-items: flex-end; /* Aligns items to the bottom */
            height: 300px; /* Just an example height */
        }
    </style>
        </div>
        <div style="display: flex; align-items: center; justify-content: center; margin: 20px; resize: vertical;">
            <asp:GridView ID="ViewPaymentGV" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="amount" HeaderText="Amound" />
                    <asp:BoundField DataField="deadline" HeaderText="Deadline" />
                    <asp:BoundField DataField="fund_percentage" HeaderText="fund percentage" />
                    <asp:BoundField DataField="n_installments" HeaderText="n of installments" />
                    <asp:BoundField DataField="payment_id" HeaderText="payment id" />
                    <asp:BoundField DataField="semester_code" HeaderText="semester code" />
                    <asp:BoundField DataField="start_date" HeaderText="start date" />
                    <asp:BoundField DataField="status" HeaderText="status" />
                    <asp:BoundField DataField="f_name" HeaderText="first name" />
                    <asp:BoundField DataField="l_name" HeaderText="last name " />
                    <asp:BoundField DataField="student_id" HeaderText="student id" />
                    <asp:BoundField DataField="email" HeaderText="email" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
