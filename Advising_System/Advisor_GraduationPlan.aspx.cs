using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Advisor_GraduationPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Advisor")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                loadGradPlans();
            }
        }

        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
        protected void loadGradPlans()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand gP = new SqlCommand($"SELECT * FROM Graduation_Plan WHERE advisor_id = {Session["UserID"]}", connection); // {Session["UserID"]} put in input of fn
                gP.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = gP.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                GradPlans.DataSource = dt;
                GradPlans.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally { connection.Close(); }
        }
        protected void GP_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the button in the row
                Button dateB = (Button)e.Row.FindControl("ExDate");
                Button courseB = (Button)e.Row.FindControl("Course");


                // Set a unique ID for each button
                dateB.ID = "ExDate" + e.Row.RowIndex.ToString();
                courseB.ID = "Course" + e.Row.RowIndex.ToString();
            }
        }

        protected void AddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_InsertGradPlan.aspx");
        }

        protected void ExDate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            // Store GradPlan information
            Session["PlanID"] = Int32.Parse(row.Cells[1].Text);
            Session["Semester"] = row.Cells[2].Text;
            Session["StID"] = Int32.Parse(row.Cells[6].Text);
            Response.Redirect("/Advisor_UpdateExGradDate.aspx");
        }
        protected void Course_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            // Store GradPlan information
            Session["PlanID"] = Int32.Parse(row.Cells[1].Text);
            Session["Semester"] = row.Cells[2].Text;
            Session["StID"] = Int32.Parse(row.Cells[6].Text);
            Response.Redirect("/Advisor_InsertCourseInGradPlan.aspx");
        }
    }
}