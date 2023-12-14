using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Advising_System.Admin_issueInstallments;

namespace Advising_System
{
    public partial class Admin_deleteSlot : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
        }


        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }

        protected void post_DeleteSlotFromCourse(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
                try
                {
                    string currentSemester = CurrentSemText.Text;
                    if (string.IsNullOrEmpty(currentSemester))
                    {
                        DisplayErrorMessage("Current Semester cannot be empty");
                        return;
                    }
                    using (SqlCommand Procedures_AdminDeleteSlots = new SqlCommand("Procedures_AdminDeleteSlots", connection))
                    {
                        Procedures_AdminDeleteSlots.CommandType = CommandType.StoredProcedure;

                        Procedures_AdminDeleteSlots.Parameters.AddWithValue("@current_semester", currentSemester);
                        connection.Open();
                        Procedures_AdminDeleteSlots.ExecuteNonQuery();
                    }
                      
                        SuccessLabel.Text = "Linking Successful";
                        SuccessLabel.ForeColor = System.Drawing.Color.Green;
                        SuccessLabel.Visible = true;

                }
                catch (Exception ex)
                {
                    SuccessLabel.Text = "Error: " + ex.Message;
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
        }

        

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }

    }
}