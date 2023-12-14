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
    public partial class Student_ViewMissingCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);
                try
                {
                    int studentId = Convert.ToInt32(Session["UserID"]);
                    SqlCommand Procedures_ViewMS = new SqlCommand("Procedures_ViewMS", connection);
                    Procedures_ViewMS.CommandType = CommandType.StoredProcedure;

                    Procedures_ViewMS.Parameters.AddWithValue("@StudentID", studentId);
                    connection.Open();
                    SqlDataReader reader = Procedures_ViewMS.ExecuteReader(CommandBehavior.CloseConnection);

                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    AllMissingCourses.DataSource = dataTable;
                    AllMissingCourses.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    connection.Close();
                }
            } 
        }
        protected void BackStudentHome(object sender, EventArgs e)
        {
            Response.Redirect("/StudentHome.aspx");
        }
    }
}