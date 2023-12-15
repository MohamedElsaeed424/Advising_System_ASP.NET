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

namespace Advising_System
{
    public partial class Advisor_extraCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Advisor")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                updateGrid();
            }
           
        }
        protected void Respond_button(object sender, EventArgs e)
        {


            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int id = Int32.Parse(row.Cells[1].Text);
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // check which procedure to use by type column
                    string proc = "";
                    string type = row.Cells[2].Text;
                    if (type.Equals("course"))
                        proc = "Procedures_AdvisorApproveRejectCourseRequest";
                    else
                        proc = "Procedures_AdvisorApproveRejectCHRequest";

                    SqlCommand approveReject = new SqlCommand(proc, connection);
                    approveReject.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    approveReject.Parameters.AddWithValue("@RequestID", id);
                    approveReject.Parameters.AddWithValue("@current_semester_code", "W24"); // Hard coded temporarily

                    int rowsAffected = approveReject.ExecuteNonQuery();

                    if (rowsAffected > 0) { updateGrid(); }
                    else { DropDownLoader.DisplayErrorMessage(SuccessLabel, "Already responded"); }
                }
                catch (Exception ex)
                {
                    // Handle the exception - e.g., show an error message to the user
                    DropDownLoader.DisplayErrorMessage(SuccessLabel, ex.Message);
                }
            }

        }
        protected void CHRequests_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the button in the row
                Button btnAction = (Button)e.Row.FindControl("btnAction");

                // Set a unique ID for each button
                btnAction.ID = "btnAction_" + e.Row.RowIndex.ToString();
            }
        }


        protected void updateGrid()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand Requests;
                string pending = "'%'";
                if (Pending.Checked)
                    pending = "'pending'";

                if (All.Checked)
                {
                    Requests = new SqlCommand($"SELECT * FROM  FN_Advisors_Requests({Session["UserID"]}) Where status LIKE {pending}", connection); //type LIKE 'course%'"
                }
                else if(Course.Checked)
                {
                    Requests = new SqlCommand($"SELECT * FROM  FN_Advisors_Requests({Session["UserID"]}) WHERE type LIKE 'course%' AND status LIKE {pending}", connection); //type LIKE 'course
                }
                else
                {
                    Requests = new SqlCommand($"SELECT * FROM  FN_Advisors_Requests({Session["UserID"]}) WHERE type LIKE 'credit%' AND status LIKE {pending}", connection); //type LIKE 'course
                }
                Requests.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = Requests.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                CourseRequests.DataSource = dt;
                CourseRequests.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                DropDownLoader.DisplayErrorMessage(SuccessLabel, ex.Message);
            }
            finally { connection.Close(); }
        }

        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}