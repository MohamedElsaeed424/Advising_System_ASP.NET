﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static Advising_System.Admin_LinkInstructorCourseSlot;
using static Advising_System.Admin_LinkStudentCourseInstructor;

namespace Advising_System
{

    public partial class Admin_DeleteCourseWSlot : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
            if (!IsPostBack)
            {
                BindCoursesToDropDown();
            }
        }

        public class Course
        {
            public int CourseId { get; set; }
            public string Name { get; set; }

        }
        private void BindCoursesToDropDown()
        {

            List<Course> courses = GetCoursesFromDatabase();


            Allcourses.DataSource = courses;
            Allcourses.DataTextField = "Name";
            Allcourses.DataValueField = "CourseId";
            Allcourses.DataBind();
            Allcourses.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Course", "0"));
            Allcourses.SelectedIndex = 0;

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

        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }


        protected void DeleteSelectedCourse(object sender, EventArgs e)
        {
            int courseId;
            if (!int.TryParse(Allcourses.SelectedValue, out courseId) || courseId <= 0)
            {
                DisplayErrorMessage("Invalid Course selection");
                return;
            }

            DeleteSelectedCourseFromDb(courseId);
            BindCoursesToDropDown();

        }

        protected void DeleteSelectedCourseFromDb(int courseIDP)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand Procedures_AdminDeleteCourseP = new SqlCommand("Procedures_AdminDeleteCourse", connection))
                {
                    Procedures_AdminDeleteCourseP.CommandType = CommandType.StoredProcedure;
                    Procedures_AdminDeleteCourseP.Parameters.AddWithValue("@courseID", courseIDP);
                    try
                    {
                        connection.Open();
                        Procedures_AdminDeleteCourseP.ExecuteNonQuery();
                        SuccessLabel.Text = "Course deleted successfully!";
                        SuccessLabel.ForeColor = System.Drawing.Color.Green;
                        SuccessLabel.Visible = true;
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

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}