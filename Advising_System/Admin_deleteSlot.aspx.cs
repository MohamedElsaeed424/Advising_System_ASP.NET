using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Advising_System.Admin_issueInstallments;

namespace Advising_System
{
    public partial class Admin_deleteSlot : System.Web.UI.Page
    {

        public class Course
        {
            public int CourseId { get; set; }
            public string Name { get; set; }

        }
        public class Slot
        {
            public int SlotId { get; set; }
            public string Day { get; set; }
            public string Time { get; set; }
            public string Location { get; set; }
            public int CourseId { get; set; }
            public int InstructorId { get; set; }
        }
        public class Semester
        {
            public string SemesterCode { get; set; }
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCoursesToDropDown();
                BindSlotsToDropDown();
                BindSemestersToDropDown();

            }

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
        private void BindSlotsToDropDown()
        {
            List<Slot> slots = GetSlotsFromDatabase();

            AllSlots.DataSource = slots;
            AllSlots.DataTextField = "SlotId";
            AllSlots.DataValueField = "CourseId";
            AllSlots.DataBind();
            AllSlots.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Slot", "0"));

        }

        private List<Slot> GetSlotsFromDatabase()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            List<Slot> slots = new List<Slot>();

            using (connection)
            {

                string query = "SELECT slot_id, day, time, location, course_id, instructor_id FROM Slot where course_id is not null";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            Slot slot = new Slot
                            {
                                SlotId = Convert.ToInt32(reader["slot_id"]),
                                Day = Convert.ToString(reader["day"]),
                                Time = Convert.ToString(reader["time"]),
                                Location = Convert.ToString(reader["location"]),
                                CourseId = Convert.ToInt32(reader["course_id"]),
                                InstructorId = Convert.ToInt32(reader["instructor_id"])
                            };

                            slots.Add(slot);
                        }
                    }
                }
            }

            return slots;
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

                string query = "SELECT * FROM Slot S\r\nINNER JOIN Course C ON S.course_id = C.course_id\r\nINNER JOIN Course_Semester CS ON @current_semester = CS.semester_code\r\nWHERE C.is_offered = 0";

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

        protected void post_DeleteSlotFromCourse(object sender, EventArgs e)
        {
            try
            {
                int courseId = Convert.ToInt32(AllCourses.SelectedValue);
                int slotId = Convert.ToInt32(AllSlots.SelectedValue);
                System.Diagnostics.Debug.WriteLine(courseId);
                System.Diagnostics.Debug.WriteLine(slotId);
                if (courseId == 0 || slotId == 0)
                {
                    SuccessLabel.Text = "Invalid Input";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
                else
                {

                    SuccessLabel.Text = "Linking Successful";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                    SuccessLabel.Visible = true;

                    AllCourses.SelectedIndex = 0;
                    AllSlots.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                SuccessLabel.Text = "Error: " + ex.Message;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;
            }
        }


        protected void DeleteSlot(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            int selectedSemId = Convert.ToInt16(AllSemesters.SelectedValue);


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand Procedures_AdminDeleteSlots = new SqlCommand("Procedures_AdminDeleteSlots", connection))
                {
                    Procedures_AdminDeleteSlots.CommandType = CommandType.StoredProcedure;

                    Procedures_AdminDeleteSlots.Parameters.AddWithValue("@current_semester", selectedSemId);
                    connection.Open();
                    Procedures_AdminDeleteSlots.ExecuteNonQuery();
                }
            }
            int courseId = Convert.ToInt32(AllCourses.SelectedValue);
            System.Diagnostics.Debug.WriteLine(courseId);


        }



        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }

    }
}