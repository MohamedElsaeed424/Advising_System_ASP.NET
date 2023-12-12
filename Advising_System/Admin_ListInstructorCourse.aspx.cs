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
    public partial class Admin_ListInstructorCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand Instructors_AssignedCourses = new SqlCommand("SELECT * FROM Instructors_AssignedCourses", connection);
                Instructors_AssignedCourses.CommandType = CommandType.Text;
                connection.Open();
                SqlDataReader reader = Instructors_AssignedCourses.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                CoursesAndInstructorsGridView.DataSource = dataTable;
                CoursesAndInstructorsGridView.DataBind();
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
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}