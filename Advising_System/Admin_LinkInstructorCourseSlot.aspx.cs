﻿using System;
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
    public partial class Admin_LinkInstructorCourseSlot : System.Web.UI.Page
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
            public class Slot
            {
                public int SlotId { get; set; }
                public string Day { get; set; }
                public string Time { get; set; }
                public string Location { get; set; }
                public Nullable<int> CourseId { get; set; }
                public Nullable<int> InstructorId { get; set; }
                public string FormattedText => $"Day: {Day}, Time: {Time}, Location: {Location}";
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
                    BindSlotsToDropDown();
                }
           
         }
        private void BindSlotsToDropDown()
        {
            List<Slot> slots = GetSlotsFromDatabase();

            AllSlots.DataSource = slots;
            AllSlots.DataTextField = "FormattedText";
            AllSlots.DataValueField = "SlotId";
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
               
                string query = "SELECT slot_id, day, time, location, course_id, instructor_id FROM Slot";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            
                            Slot slot = new Slot()
                            {
                                SlotId = Convert.ToInt32(reader["slot_id"]),
                                Day = reader["day"] is DBNull ? null :  Convert.ToString(reader["day"]),
                                Time = reader["time"] is DBNull ? null : Convert.ToString(reader["time"]),
                                Location = reader["location"] is DBNull ? null : Convert.ToString(reader["location"]),
                                CourseId = reader["course_id"] is DBNull? 0 : Convert.ToInt32(reader["course_id"]),
                                InstructorId = reader["course_id"] is DBNull ? 0 : Convert.ToInt32(reader["instructor_id"])
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
            private void BindInstructorsToDropDown()
            {
                List<Instructor> instructors = GetInstructorsFromDatabase();
                AllInstructors.DataSource = instructors;
                AllInstructors.DataTextField = "Name"; 
                AllInstructors.DataValueField = "InstructorId"; 
                AllInstructors.DataBind();
               AllInstructors.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Instructor", "0"));
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
        protected void post_LinkInstructorCourseSlot(object sender, EventArgs e)
        {
            try
            {
                int courseId, instructorId, slotId;

                if (!int.TryParse(AllCourses.SelectedValue, out courseId) || courseId <= 0)
                {
                    DisplayErrorMessage("Invalid Course Selection");
                    return;
                }

                if (!int.TryParse(AllInstructors.SelectedValue, out instructorId) || instructorId <= 0)
                {
                    DisplayErrorMessage("Invalid Instructor Selection");
                    return;
                }

                if (!int.TryParse(AllSlots.SelectedValue, out slotId) || slotId <= 0)
                {
                    DisplayErrorMessage("Invalid Slot Selection");
                    return;
                }
                LinkInstructorCourseSlots(courseId, instructorId, slotId);

                    SuccessLabel.Text = "Linking Successful";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                    SuccessLabel.Visible = true;

                    AllCourses.SelectedIndex = 0;
                    AllInstructors.SelectedIndex = 0;
                    AllSlots.SelectedIndex = 0;

            }
            catch (Exception ex)
            {
                SuccessLabel.Text = "Error: " + ex.Message;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;
            }
        }

        private void LinkInstructorCourseSlots(int courseId, int instructorId, int slotId)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand Procedures_AdminLinkInstructor = new SqlCommand("Procedures_AdminLinkInstructor", connection))
                {
                    Procedures_AdminLinkInstructor.CommandType = CommandType.StoredProcedure;

                    Procedures_AdminLinkInstructor.Parameters.AddWithValue("@cours_id", courseId);
                    Procedures_AdminLinkInstructor.Parameters.AddWithValue("@instructor_id", instructorId);
                    Procedures_AdminLinkInstructor.Parameters.AddWithValue("@slot_id", slotId);

                    connection.Open();
                    Procedures_AdminLinkInstructor.ExecuteNonQuery();
                }
            }
        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
                Response.Redirect("/AdminHome.aspx");
        }
     }
}