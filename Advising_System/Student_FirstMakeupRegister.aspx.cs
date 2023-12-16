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
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                DropDownLoader.loadCourseListWithID(Courses, SuccessLabel);
            }

        }
        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Visible = true;
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }

        protected void RegisterForFirstMakeupExam(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {   
                int studentId = Convert.ToInt32(Session["UserID"]);
                int courseId ;
                if (!int.TryParse(TextBox3.Text, out courseId))
                {
                    DisplayErrorMessage("Invalid Course ID. Please enter a valid numeric value.");
                    return;
                }
                string studentCurrentSemester = TextBox3.Text;
                if (string.IsNullOrEmpty(studentCurrentSemester))
                {
                    DisplayErrorMessage("Current Semester is required");
                    return;
                }
                else
                {
                    SqlCommand Procedures_StudentRegisterFirstMakeup = new SqlCommand("Procedures_StudentRegisterFirstMakeup", connection);
                    Procedures_StudentRegisterFirstMakeup.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = Procedures_StudentRegisterFirstMakeup.ExecuteReader(CommandBehavior.CloseConnection);
                    Procedures_StudentRegisterFirstMakeup.Parameters.AddWithValue("@StudentID", studentId);
                    Procedures_StudentRegisterFirstMakeup.Parameters.AddWithValue("@courseID", courseId);
                    Procedures_StudentRegisterFirstMakeup.Parameters.AddWithValue("@studentCurr_sem", studentCurrentSemester);
                    Procedures_StudentRegisterFirstMakeup.ExecuteNonQuery();
                    SuccessLabel.Visible = true;
                    SuccessLabel.Text = "Makeup Registered successfully!";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                SuccessLabel.Visible = true;
                SuccessLabel.Text = "Error while Registering: " + ex.Message;
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