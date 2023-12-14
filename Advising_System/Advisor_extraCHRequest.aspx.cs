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

namespace Advising_System
{
    public partial class Advisor_extraCHRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGrid();
        }
        protected void Respond_button(object sender, EventArgs e)
        {


            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int id = Int32.Parse(row.Cells[0].Text);
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    SqlCommand approveReject = new SqlCommand("Procedures_AdvisorApproveRejectCHRequest", connection);
                    approveReject.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    approveReject.Parameters.AddWithValue("@RequestID", id);
                    approveReject.Parameters.AddWithValue("@current_semester_code", "W24"); // Hard coded temporarily

                    int rowsAffected = approveReject.ExecuteNonQuery();

                    if (rowsAffected > 0) { updateGrid(); }
                }
                catch (Exception ex)
                {
                    // Handle the exception - e.g., show an error message to the user
                    Debug.WriteLine(ex.ToString());
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
                SqlCommand CHRequest = new SqlCommand($"SELECT * FROM Request WHERE type LIKE 'credit%'", connection);
                CHRequest.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = CHRequest.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                CHRequests.DataSource = dt;
                CHRequests.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
            finally { connection.Close(); }
        }
        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
        
        
}
