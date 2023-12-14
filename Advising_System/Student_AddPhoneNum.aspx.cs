using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Student_AddPhoneNum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("/404Page.aspx");
            }
        }

        protected void AddPhoneNum(object sender, EventArgs e)
        {

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            try
            {
                int studentId = Convert.ToInt32(Session["UserID"]);

                string phoneNumber = PhoneNum.Text;

                using (SqlCommand command = new SqlCommand("Procedures_StudentaddMobile", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@StudentID", studentId);
                    command.Parameters.AddWithValue("@mobile_number", phoneNumber);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                SuccessLabel.Text = "Phone number added successfully.";
                SuccessLabel.ForeColor = System.Drawing.Color.Green;
                SuccessLabel.Visible = true;

                PhoneNum.Text = string.Empty;
            }
            catch (Exception ex)
            {

                SuccessLabel.Text = $"Error: {ex.Message}";
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