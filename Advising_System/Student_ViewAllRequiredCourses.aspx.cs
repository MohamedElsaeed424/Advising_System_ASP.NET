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
    public partial class Student_ViewAllRequiredCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("/404Page.aspx");
            }
        }
        protected void Get_RequiredCourses(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                string semesterCode = Semester_CodeText.Text;
                int studentId = Convert.ToInt32(Session["UserID"]);

                SqlCommand Procedures_ViewOptionalCourse = new SqlCommand("Procedures_ViewRequiredCourses", connection);
                Procedures_ViewOptionalCourse.CommandType = CommandType.StoredProcedure;

                Procedures_ViewOptionalCourse.Parameters.AddWithValue("@current_semester_code", semesterCode);
                Procedures_ViewOptionalCourse.Parameters.AddWithValue("@StudentID", studentId);

                connection.Open();
                SqlDataReader reader = Procedures_ViewOptionalCourse.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                AllRequiredCourses.DataSource = dataTable;
                AllRequiredCourses.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
        protected void BackStudentHome(object sender, EventArgs e)
        {
            Response.Redirect("/StudentHome.aspx");
        }
    }
}