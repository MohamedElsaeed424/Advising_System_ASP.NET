using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Web.Services.Description;

namespace Advising_System
{
    public partial class Advisor_UpdateExGradDate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Advisor" || Session["PlanID"] is null)
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    updateGrid();
                }
            }
        }


        protected void UpdateGrad_Click(object sender, EventArgs e)
        {
            Message.Visible = true;
            string date = ExGradDate.Text;

            if (string.IsNullOrEmpty(date))
            {
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Visible = true;
                Message.Text = "Invalid Input";
                return;
            }

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand UpdateGradDate = new SqlCommand("Procedures_AdvisorUpdateGP", connection); // {Session["UserID"]} put in input of fn
                UpdateGradDate.CommandType = CommandType.StoredProcedure;
                connection.Open();
                UpdateGradDate.Parameters.AddWithValue("@studentID", Session["StID"]);
                UpdateGradDate.Parameters.AddWithValue("@expected_grad_date", date);

                int nRowsAffected = UpdateGradDate.ExecuteNonQuery();
                if (nRowsAffected > 0)
                {
                    Message.Visible = true;
                    Message.ForeColor = System.Drawing.Color.Green;
                    Message.Text = "Succesfully Updated Graduation Plan";
                    updateGrid();
                }
                else
                {
                    Message.Visible = true;
                    Message.ForeColor = System.Drawing.Color.Red;
                    Message.Text = "Unsuccessful";
                }
            }
            catch (Exception ex)
            {
                Message.Visible = true;
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Text = ex.Message;
            }
            finally { connection.Close(); }
        }
        protected void updateGrid()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int planId = (int)Session["PlanID"];
                SqlCommand command = new SqlCommand($"SELECT * FROM Graduation_Plan WHERE plan_id = {planId}", connection); //type LIKE 'course
                command.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                GradPlan.DataSource = dt;
                GradPlan.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                DropDownLoader.DisplayErrorMessage(Message, ex.Message);
            }
            finally { connection.Close(); }
        }
        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}