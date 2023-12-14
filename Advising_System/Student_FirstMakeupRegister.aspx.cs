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
    public partial class Student_FirstMakeupRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterForFirstMakeupExam(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int studentId = Int16.Parse(TextBox1.Text);
                int courseId = Int16.Parse(TextBox2.Text);
                string studentCurrentSemester = TextBox3.Text;
                SqlCommand Procedures_StudentRegisterFirstMakeup = new SqlCommand("Procedures_StudentRegisterFirstMakeup", connection);
                Procedures_StudentRegisterFirstMakeup.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataReader reader = Procedures_StudentRegisterFirstMakeup.ExecuteReader(CommandBehavior.CloseConnection);
                Procedures_StudentRegisterFirstMakeup.Parameters.AddWithValue("@StudentID", studentId);
                Procedures_StudentRegisterFirstMakeup.Parameters.AddWithValue("@courseID", courseId);
                Procedures_StudentRegisterFirstMakeup.Parameters.AddWithValue("@studentCurr_sem", studentCurrentSemester);
                Procedures_StudentRegisterFirstMakeup.ExecuteNonQuery();
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