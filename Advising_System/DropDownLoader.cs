using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public class DropDownLoader
    {
        public static void loadStudentList(DropDownList StudentID, int userID, Label success)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand AllStudents = new SqlCommand($"SELECT student_id, CONCAT(student_id, ' ', f_name, ' ', l_name) AS 'All' " +
                    $"FROM Student WHERE advisor_id = {userID}\r\n", connection); // {Session["UserID"]} put in input of fn
                AllStudents.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = AllStudents.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                StudentID.DataSource = dt;
                StudentID.DataTextField = "All";
                StudentID.DataValueField = "student_id";
                StudentID.DataBind();

                StudentID.Items.Insert(0, new ListItem("Select a Student", string.Empty));
                StudentID.SelectedIndex = 0;

                reader.Close();
            }
            catch (Exception ex)
            {
                success.Visible = true;
                success.ForeColor = System.Drawing.Color.Red;
                success.Text = ex.Message;
            }
            finally { connection.Close(); }
        }
        public static void loadCourseList(DropDownList CourseName, Label success)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand AllCourses = new SqlCommand("SELECT DISTINCT(name) FROM Course\r\n", connection); // {Session["UserID"]} put in input of fn
                AllCourses.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = AllCourses.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                CourseName.DataSource = dt;
                CourseName.DataTextField = "name";
                CourseName.DataValueField = "name";
                CourseName.DataBind();

                CourseName.Items.Insert(0, new ListItem("Select a Course", string.Empty));
                CourseName.SelectedIndex = 0;

                reader.Close();
            }
            catch (Exception ex)
            {
                success.Visible = true;
                success.ForeColor = System.Drawing.Color.Red;
                success.Text = ex.Message;
            }
            finally { connection.Close(); }
        }
        public static void loadCourseListWithID(DropDownList CourseIDs, Label success)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand AllCourses = new SqlCommand("SELECT course_id, CONCAT(course_id, '-', name) AS 'All' FROM Course\r\n", connection); // {Session["UserID"]} put in input of fn
                AllCourses.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = AllCourses.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                CourseIDs.DataSource = dt;
                CourseIDs.DataTextField = "All";
                CourseIDs.DataValueField = "course_id";
                CourseIDs.DataBind();

                CourseIDs.Items.Insert(0, new ListItem("Select a Course", string.Empty));
                CourseIDs.SelectedIndex = 0;

                reader.Close();
            }
            catch (Exception ex)
            {
                success.Visible = true;
                success.ForeColor = System.Drawing.Color.Red;
                success.Text = ex.Message;
            }
            finally { connection.Close(); }
        }
    }
}