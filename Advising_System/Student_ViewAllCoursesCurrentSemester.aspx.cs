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
    public partial class Student_ViewAllCoursesCurrentSemester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null|| Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
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
        protected void Get_AllAvailableCourses (object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                string semesterCode = Semester_CodeText.Text;
                if (string.IsNullOrEmpty(semesterCode))
                {
                    DisplayErrorMessage("Current Semester is required");
                    return;
                }
                else
                {
                    SqlCommand FN_SemsterAvailableCourses = new SqlCommand("SELECT * FROM FN_SemsterAvailableCourses(@semstercode)", connection);
                    FN_SemsterAvailableCourses.Parameters.AddWithValue("@semstercode", semesterCode);
                    connection.Open();
                    SqlDataReader reader = FN_SemsterAvailableCourses.ExecuteReader(CommandBehavior.CloseConnection);

                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    AllAvailableCourses.DataSource = dataTable;
                    AllAvailableCourses.DataBind();
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