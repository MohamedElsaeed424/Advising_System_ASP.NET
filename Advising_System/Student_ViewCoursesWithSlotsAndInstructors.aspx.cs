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
    public partial class Student_ViewCoursesWithSlotsAndInstructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand viewCWSI = new SqlCommand("Select Course.course_id as CourseID , Course.name As Course, Slot.*, Instructor.name as Instructor\r\nfrom Course inner join Slot on Course.course_id = Slot.course_id\r\ninner join Instructor on Slot.instructor_id = Instructor.instructor_id;", connection);
                viewCWSI.CommandType = CommandType.Text; ;
                connection.Open();

                SqlDataReader reader = viewCWSI.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                CoursesWithCorrespondingSlotsAndInsrucrors.DataSource = dataTable;
                CoursesWithCorrespondingSlotsAndInsrucrors.DataBind();
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