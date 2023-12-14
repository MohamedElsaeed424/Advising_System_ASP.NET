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
    public partial class Student_ChooseInstructorForCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChooseInstructor(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int studentId = Int16.Parse(TextBox1.Text);
                int instrucorID = Int16.Parse(TextBox2.Text);
                int courseID = Int16.Parse(TextBox3.Text);

                SqlCommand Procedures_Chooseinstructor = new SqlCommand("Procedures_Chooseinstructor", connection);
                Procedures_Chooseinstructor.CommandType = CommandType.StoredProcedure;
                connection.Open();
                Procedures_Chooseinstructor.Parameters.AddWithValue("@StudentID", studentId);
                Procedures_Chooseinstructor.Parameters.AddWithValue("@instrucorID", instrucorID);
                Procedures_Chooseinstructor.Parameters.AddWithValue("@CourseID", courseID);
                Procedures_Chooseinstructor.ExecuteNonQuery();
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
            Response.Redirect("/StudentHome.aspx");
        }
    }
}