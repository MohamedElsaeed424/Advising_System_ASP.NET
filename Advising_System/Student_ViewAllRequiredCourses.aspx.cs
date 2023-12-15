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
        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }
        protected void Get_RequiredCourses(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int studentId = Convert.ToInt32(Session["UserID"]);
                string semesterCode = Semester_CodeText.Text;
                if (string.IsNullOrEmpty(semesterCode))
                {
                    DisplayErrorMessage("Current Semester is required");
                    return;
                }
                else
                {
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
                    SuccessLabel.Text = "Viewed successfully!";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                SuccessLabel.Text = "Error while Viewing: " + ex.Message;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
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