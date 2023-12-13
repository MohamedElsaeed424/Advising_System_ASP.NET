<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_viewPaymentDetailsForStudent.aspx.cs" Inherits="Advising_System.Admin_viewPaymentDetailsForStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" OnClick="viewPayment" runat="server" Text="View details for all payments along with their corresponding students" />
            <div style="margin-bottom: 20px;"></div>
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
