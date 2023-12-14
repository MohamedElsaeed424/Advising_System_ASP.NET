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
    public partial class Admin_AddMakeupExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCoursesToDropDown();
            }
        }


        protected void post_Exam(object sender, EventArgs e)
        {

            DateTime startDate = Convert.ToDateTime(Start_Calender.SelectedDate);
            int courseId = Convert.ToInt16(AllCourses.SelectedValue);


            if (startDate == DateTime.MinValue )
            {
                SuccessLabel.Text = "Invalid Input";
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;
            }
            else
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);
                using (connection)
                {
                    using (SqlCommand Procedures_AdminAddExam = new SqlCommand("Procedures_AdminAddExam", connection))
                    {
                        Procedures_AdminAddExam.CommandType = CommandType.StoredProcedure;

                        // Add parameters
                        Procedures_AdminAddExam.Parameters.Add(new SqlParameter("@Type", SqlDbType.VarChar)).Value = "make up";
                        Procedures_AdminAddExam.Parameters.Add(new SqlParameter("@date", SqlDbType.Date)).Value = startDate;
                        Procedures_AdminAddExam.Parameters.Add(new SqlParameter("@course_id", SqlDbType.VarChar, 40)).Value = courseId;

                        try
                        {

                            connection.Open();
                            Procedures_AdminAddExam.ExecuteNonQuery();
                            SuccessLabel.Text = "Exam added successfully!";
                            SuccessLabel.ForeColor = System.Drawing.Color.Green;
                            SuccessLabel.Visible = true;

                            Start_Calender.SelectedDate = DateTime.MinValue;
                        }
                        catch (Exception ex)
                        {

                            SuccessLabel.Text = "Error: " + ex.Message;
                            SuccessLabel.ForeColor = System.Drawing.Color.Red;
                            SuccessLabel.Visible = true;
                        }
                        finally
                        {
                            connection.Close();
                        }
                    }
                }
            }

        }

        protected void DateSelectionChanged1(object sender, EventArgs e)
        {
            SelectedStartDateLabel1.Text = "Selected Start Date: " + Start_Calender.SelectedDate.ToShortDateString();

        }

        private void BindCoursesToDropDown()
        {

            List<Course> courses = GetCoursesFromDatabase();
            AllCourses.DataSource = courses;
            AllCourses.DataTextField = "Name";
            AllCourses.DataValueField = "CourseId";
            AllCourses.DataBind();
            AllCourses.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Course", "0"));

        }

        private List<Course> GetCoursesFromDatabase()
        {

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            List<Course> courses = new List<Course>();

            using (connection)
            {

                string query = "SELECT course_id, name FROM Course";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            Course course = new Course
                            {
                                CourseId = Convert.ToInt32(reader["course_id"]),
                                Name = Convert.ToString(reader["name"])
                            };

                            courses.Add(course);
                        }
                    }
                }
            }

            return courses;
        }

       

        public class Course
        {
            public int CourseId { get; set; }
            public string Name { get; set; }

        }
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}