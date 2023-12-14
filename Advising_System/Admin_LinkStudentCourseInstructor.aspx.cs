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
    public partial class Admin_LinkStudentCourseInstructor : System.Web.UI.Page
    {
        public class Instructor
        {
            public int InstructorId { get; set; }
            public string Name { get; set; }
        }
        public class Course
        {
            public int CourseId { get; set; }
            public string Name { get; set; }

        }
        public class Student
        {
            public int StudentId { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string FullName => $"{FirstName} {LastName}";

        }
        public class Semester
        {
            public string SemesterCode { get; set; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
            if (!IsPostBack)
            {
                BindInstructorsToDropDown();
                BindCoursesToDropDown();
                BindStudentsToDropDown();
                BindSemestersToDropDown();
            }

        }
        private void BindStudentsToDropDown()
        {
            List<Student> students = GetStudentsFromDatabase();

            AllStuendents.DataSource = students;
            AllStuendents.DataTextField = "FullName";
            AllStuendents.DataValueField = "StudentId";
            AllStuendents.DataBind();
            AllStuendents.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Student", "0"));
        }
        private void BindInstructorsToDropDown()
        {
            List<Instructor> instructors = GetInstructorsFromDatabase();
            AllInstructors.DataSource = instructors;
            AllInstructors.DataTextField = "Name";
            AllInstructors.DataValueField = "InstructorId";
            AllInstructors.DataBind();
            AllInstructors.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Instructor", "0"));
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
        private void BindSemestersToDropDown()
        {
            List<Semester> semesters = GetSemestersFromDatabase();

            AllSemesters.DataSource = semesters;
            AllSemesters.DataTextField = "SemesterCode";
            AllSemesters.DataValueField = "SemesterCode";
            AllSemesters.DataBind();
            AllSemesters.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Semester", ""));
        }
        private List<Semester> GetSemestersFromDatabase()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            List<Semester> semesters = new List<Semester>();

            using (connection)
            {
                string query = "SELECT semester_code FROM Semester";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Semester semester = new Semester
                            {
                                SemesterCode = Convert.ToString(reader["semester_code"])
                            };

                            semesters.Add(semester);
                        }
                    }
                }
            }

            return semesters;
        }

        private List<Student> GetStudentsFromDatabase()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            List<Student> students = new List<Student>();

            using (connection)
            {
                string query = "SELECT student_id, f_name, l_name FROM Student";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Student student = new Student
                            {
                                StudentId = Convert.ToInt32(reader["student_id"]),
                                FirstName = Convert.ToString(reader["f_name"]),
                                LastName = Convert.ToString(reader["l_name"])
                            };

                            students.Add(student);
                        }
                    }
                }
            }

            return students;
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


        private List<Instructor> GetInstructorsFromDatabase()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            List<Instructor> instructors = new List<Instructor>();

            using (connection)
            {
                string query = "SELECT instructor_id, name FROM Instructor";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Instructor instructor = new Instructor
                            {
                                InstructorId = Convert.ToInt32(reader["instructor_id"]),
                                Name = Convert.ToString(reader["name"])
                            };

                            instructors.Add(instructor);
                        }
                    }
                }
            }

            return instructors;
        }
        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }
        protected void post_LinkStudentCourseIntructor(object sender, EventArgs e)
        {
            try
            {

                string semesterCode = AllSemesters.SelectedValue;
                int courseId, instructorId, studentId;
                if (!int.TryParse(AllCourses.SelectedValue?.ToString(), out courseId) || courseId <= 0)
                {
                    DisplayErrorMessage("Invalid Course Selection");
                    return;
                }

                if (!int.TryParse(AllInstructors.SelectedValue?.ToString(), out instructorId) || instructorId <= 0)
                {
                    DisplayErrorMessage("Invalid Instructor Selection");
                    return;
                }
                if (!int.TryParse(AllStuendents.SelectedValue?.ToString(), out studentId) || studentId <= 0)
                {
                    DisplayErrorMessage("Invalid Student Selection");
                    return;
                }
                if (string.IsNullOrEmpty(semesterCode))
                {
                    DisplayErrorMessage("Invalid Semester Selection");
                    return;
                }
                else
                {
                    LinkStudentCourseInstructor(courseId, instructorId, studentId, semesterCode);

                    SuccessLabel.Text = "Linking Successful";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                    SuccessLabel.Visible = true;

                    AllCourses.SelectedIndex = 0;
                    AllInstructors.SelectedIndex = 0;
                    AllStuendents.SelectedIndex = 0;
                    AllSemesters.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                SuccessLabel.Text = "Error: " + ex.Message;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;
            }
        }

        private void LinkStudentCourseInstructor(int courseId, int instructorId, int studentId, string semesterCode)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand Procedures_AdminLinkStudent = new SqlCommand("Procedures_AdminLinkStudent", connection))
                {
                    Procedures_AdminLinkStudent.CommandType = CommandType.StoredProcedure;

                    Procedures_AdminLinkStudent.Parameters.AddWithValue("@cours_id", courseId);
                    Procedures_AdminLinkStudent.Parameters.AddWithValue("@instructor_id", instructorId);
                    Procedures_AdminLinkStudent.Parameters.AddWithValue("@studentID", studentId);
                    Procedures_AdminLinkStudent.Parameters.AddWithValue("@semester_code", semesterCode);

                    connection.Open();
                    Procedures_AdminLinkStudent.ExecuteNonQuery();
                }
            }
        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}