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
    public partial class Student_ViewCoursesWithExams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand viewCWE = new SqlCommand("Select MakeUp_Exam.*, Course.name, Course.semester\r\nfrom MakeUp_Exam inner join Course on MakeUp_Exam.course_id = Course.course_id;", connection);
                viewCWE.CommandType = CommandType.Text; ;
                connection.Open();

                SqlDataReader reader = viewCWE.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                AllCoursesWithExam.DataSource = dataTable;
                AllCoursesWithExam.DataBind();
                
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