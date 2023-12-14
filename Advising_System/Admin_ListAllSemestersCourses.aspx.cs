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
    public partial class Admin_ListAllSemestersCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);

                try
                {
                    SqlCommand Semster_offered_Courses = new SqlCommand("SELECT * FROM Semster_offered_Courses", connection);
                    Semster_offered_Courses.CommandType = CommandType.Text;
                    connection.Open();
                    SqlDataReader reader = Semster_offered_Courses.ExecuteReader(CommandBehavior.CloseConnection);

                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    CoursesAndSemestersGridView.DataSource = dataTable;
                    CoursesAndSemestersGridView.DataBind();
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log it, display an error message)
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    connection.Close();
                }
            }

        }
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}