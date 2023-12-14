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


        protected void ChooseInstructor(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
                int studentId = Convert.ToInt32(Session["UserID"]);
            int instructorID;
            if (!int.TryParse(TextBox2.Text, out instructorID))
            {
                DisplayErrorMessage("Invalid Instructor ID. Please enter a valid numeric value.");
                return;
            }

            int courseID;
            if (!int.TryParse(TextBox3.Text, out courseID))
            {
                DisplayErrorMessage("Invalid Course ID. Please enter a valid numeric value.");
                return;
            }

            string currentSemester = semi.Text;
            if (string.IsNullOrEmpty(currentSemester))
            {
                DisplayErrorMessage("Current Semester is required");
                return;
            }
            else
            {
                SqlCommand Procedures_ChooseInstructor = new SqlCommand("Procedures_ChooseInstructor", connection);
                Procedures_ChooseInstructor.CommandType = CommandType.StoredProcedure;
                Procedures_ChooseInstructor.Parameters.AddWithValue("@StudentID", studentId);
                Procedures_ChooseInstructor.Parameters.AddWithValue("@InstructorID", instructorID);
                Procedures_ChooseInstructor.Parameters.AddWithValue("@CourseID", courseID);
                Procedures_ChooseInstructor.Parameters.AddWithValue("@current_semester_code", currentSemester);
                try
                {
                    connection.Open();
                    Procedures_ChooseInstructor.ExecuteNonQuery();
                    SuccessLabel.Text = "Course added successfully!";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    SuccessLabel.Text = "Error adding course: " + ex.Message;
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                }
                finally
                {
                    connection.Close();
                }
            }
           

        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/StudentHome.aspx");
        }
    }
}