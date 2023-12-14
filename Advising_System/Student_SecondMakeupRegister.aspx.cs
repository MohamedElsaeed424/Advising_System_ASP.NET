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
    public partial class Student_SecondMakeupRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterForSecondMakeupExam(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int studentId = Int16.Parse(TextBox1.Text);
                int courseId = Int16.Parse(TextBox2.Text);
                string studentCurrentSemester = TextBox3.Text;
                SqlCommand Procedures_StudentRegisterSecondMakeup = new SqlCommand("Procedures_StudentRegisterSecondMakeup", connection);
                Procedures_StudentRegisterSecondMakeup.CommandType = CommandType.StoredProcedure;
                connection.Open();
                Procedures_StudentRegisterSecondMakeup.Parameters.AddWithValue("@StudentID", studentId);
                Procedures_StudentRegisterSecondMakeup.Parameters.AddWithValue("@courseID", courseId);
                Procedures_StudentRegisterSecondMakeup.Parameters.AddWithValue("@studentCurr_sem", studentCurrentSemester);
                Procedures_StudentRegisterSecondMakeup.ExecuteNonQuery();
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