using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Student_ViewCoursesWithPrereq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand viewCWP = new SqlCommand("Select C1.*, C2.course_id as preRequsite_course_id, C2.name as preRequsite_course_name \r\nfrom Course C1 inner join PreqCourse_course On C1.course_id = PreqCourse_course.course_id\r\ninner join course C2 on PreqCourse_course.prerequisite_course_id = c2.course_id;", connection);
                viewCWP.CommandType = CommandType.Text; ;
                connection.Open();

                SqlDataReader reader = viewCWP.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                AllCoursesWithPrerequisites.DataSource = dataTable;
                AllCoursesWithPrerequisites.DataBind();

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/StudentHome.aspx");
        }
    }
}