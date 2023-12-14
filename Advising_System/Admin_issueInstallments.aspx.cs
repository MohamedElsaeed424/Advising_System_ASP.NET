using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Diagnostics.Contracts;
using System.Linq;
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

                string query = "SELECT payment_id FROM Payment";

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

        protected void IssueInstallment(object sender, EventArgs e)
        {
            int payment_id = Convert.ToInt32(AllPayment.SelectedValue);
            System.Diagnostics.Debug.WriteLine(payment_id);


            IssuePaymentInDatabase(payment_id);

        }

        protected void IssuePaymentInDatabase(int Payment_id)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand Procedures_AdminIssueInstallment = new SqlCommand("Procedures_AdminIssueInstallment", connection))
                {
                    Procedures_AdminIssueInstallment.CommandType = CommandType.StoredProcedure;

                    Procedures_AdminIssueInstallment.Parameters.AddWithValue("@paymentID", Payment_id);
                    connection.Open();
                    int nRowsAffected = Procedures_AdminIssueInstallment.ExecuteNonQuery();
                    if(nRowsAffected > 0)
                    {
                        Debug.WriteLine("fdauwheh fjdhaks" +  nRowsAffected.ToString());
                        SuccessLabel.Text = "3abilo we edilo balabizoooooooo!";
                        SuccessLabel.ForeColor = System.Drawing.Color.Green;
                        SuccessLabel.Visible = true;
                    }
                }
            }
        }


        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}