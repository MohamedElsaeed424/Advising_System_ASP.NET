using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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




        protected void post_DeleteSlotFromCourse(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
                try
                {
                    using (SqlCommand Procedures_AdminDeleteSlots = new SqlCommand("Procedures_AdminDeleteSlots", connection))
                    {
                        Procedures_AdminDeleteSlots.CommandType = CommandType.StoredProcedure;

                        Procedures_AdminDeleteSlots.Parameters.AddWithValue("@current_semester", CurrentSemText.Text);
                        connection.Open();
                        Procedures_AdminDeleteSlots.ExecuteNonQuery();
                    }

                    if (string.IsNullOrEmpty(CurrentSemText.Text))
                    {
                        SuccessLabel.Text = "Invalid Input";
                        SuccessLabel.ForeColor = System.Drawing.Color.Red;
                        SuccessLabel.Visible = true;
                    }
                    else
                    {
                        //deletion method
                        SuccessLabel.Text = "Linking Successful";
                        SuccessLabel.ForeColor = System.Drawing.Color.Green;
                        SuccessLabel.Visible = true;

                    }
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