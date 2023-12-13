using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics.PerformanceData;

namespace Advising_System
{
    public partial class Advisor_InsertGradPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateGrad_Click(object sender, EventArgs e)
        {
            Error.Visible = false;
            string semCode = semesterCode.Text;
            string gradDate = ExGradDate.Text;
            string CH = semCH.Text;
            int advisorID = 8; // session["UserID"]
            string StID = StudentID.Text;

            if(string.IsNullOrEmpty(semCode) || string.IsNullOrEmpty(gradDate)
                || string.IsNullOrEmpty(CH) || string.IsNullOrEmpty(StID)) 
            {
                Error.ForeColor = System.Drawing.Color.Red;
                Error.Visible = true;
                Error.Text = "Invalid Input";
                return;
            }

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand InsertGradPlan = new SqlCommand("Procedures_AdvisorCreateGP", connection); // {Session["UserID"]} put in input of fn
                InsertGradPlan.CommandType = CommandType.StoredProcedure;
                connection.Open();

                InsertGradPlan.Parameters.AddWithValue("@Semestercode", semCode);
                InsertGradPlan.Parameters.AddWithValue("@expected_graduation_date", gradDate);
                InsertGradPlan.Parameters.AddWithValue("@sem_credit_hours", CH);
                InsertGradPlan.Parameters.AddWithValue("@advisorid", advisorID);
                InsertGradPlan.Parameters.AddWithValue("@studentid", StID);

                int nRowsAffected = InsertGradPlan.ExecuteNonQuery();
                Error.Visible = true;
                Error.ForeColor = System.Drawing.Color.Green;
                Error.Text = "Succesfully inserted Graduation Plan";
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
            finally { connection.Close(); }


        }
        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}