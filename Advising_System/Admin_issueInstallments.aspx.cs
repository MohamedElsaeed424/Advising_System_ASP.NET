using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Admin_issueInstallments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
            if (!IsPostBack)
            {
                BindPaymentToDropDown();
            }

        }

        public class Payment
        {
            public int PaymentId{get;set;}
            
        }

        private void BindPaymentToDropDown()
        {

            List<Payment> payments = GetPaymentFromDatabase();


            AllPayment.DataSource = payments;
            AllPayment.DataTextField = "PaymentId";
            AllPayment.DataValueField = "PaymentId";
            AllPayment.DataBind();
            AllPayment.Items.Insert(0, new System.Web.UI.WebControls.ListItem("select payment", "0"));

        }

        private List<Payment> GetPaymentFromDatabase()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            List<Payment> payments = new List<Payment>();

            using (connection)
            {

                string query = "SELECT payment_id FROM Payment WHERE payment_id not in (Select payment_id from Installment)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            Payment payment = new Payment
                            {
                                PaymentId = Convert.ToInt32(reader["payment_id"])
                            };

                            payments.Add(payment);
                        }
                    }
                }
            }

            return payments;
        }
        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }

        protected void IssueInstallment(object sender, EventArgs e)
        {
            int payment_id;
            if (!int.TryParse(AllPayment.SelectedValue, out payment_id) || payment_id <= 0)
            {
                DisplayErrorMessage("Invalid Payment Selection");
                return;
            }
            System.Diagnostics.Debug.WriteLine(payment_id);


            IssuePaymentInDatabase(payment_id);

        }

        protected void IssuePaymentInDatabase(int Payment_id)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            if (AllPayment.SelectedIndex == 0)
            {
                SuccessLabel.Text = "invalid input" ;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;

            }
            else
            {
                try
                {
                    using (connection)
                    {
                        using (SqlCommand Procedures_AdminIssueInstallment =
                               new SqlCommand("Procedures_AdminIssueInstallment", connection))
                        {
                            Procedures_AdminIssueInstallment.CommandType = CommandType.StoredProcedure;

                            // Add parameters
                            Procedures_AdminIssueInstallment.Parameters
                                .Add(new SqlParameter("@payment_id", SqlDbType.VarChar)).Value = Payment_id;


                            try
                            {

                                connection.Open();
                                Procedures_AdminIssueInstallment.ExecuteNonQuery();
                                SuccessLabel.Text = "Installment added successfully!";
                                SuccessLabel.ForeColor = System.Drawing.Color.Green;
                                SuccessLabel.Visible = true;
                            }
                            catch (Exception ex)
                            {

                                SuccessLabel.Text = "Error: " + ex.Message;
                                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                                SuccessLabel.Visible = true;
                            }
                            finally
                            {
                                connection.Close();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
        }


        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}