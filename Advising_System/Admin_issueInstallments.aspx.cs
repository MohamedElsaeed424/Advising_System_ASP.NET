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
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    using (SqlCommand Procedures_AdminAddExam = new SqlCommand("Procedures_AdminAddExam", connection))
                    {
                        Procedures_AdminAddExam.CommandType = CommandType.StoredProcedure;

                        // Add parameters
                        Procedures_AdminAddExam.Parameters.Add(new SqlParameter("@Type", SqlDbType.VarChar)).Value = type;
                        Procedures_AdminAddExam.Parameters.Add(new SqlParameter("@date", SqlDbType.Date)).Value = startDate;
                        Procedures_AdminAddExam.Parameters.Add(new SqlParameter("@course_id", SqlDbType.VarChar, 40)).Value = courseId;

                        try
                        {

                            connection.Open();
                            Procedures_AdminAddExam.ExecuteNonQuery();
                            SuccessLabel.Text = "Exam added successfully!";
                            SuccessLabel.ForeColor = System.Drawing.Color.Green;
                            SuccessLabel.Visible = true;

                            Start_Calender.SelectedDate = DateTime.MinValue;
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
            catch (Exception ex) { Console.WriteLine("Error: " + ex.Message); }
            finally { connection.Close(); }
        }


        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}