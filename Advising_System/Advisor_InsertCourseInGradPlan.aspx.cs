using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Advising_System.Admin_LinkStudentAdvisor;
using System.Diagnostics;
using System.Configuration;

namespace Advising_System
{
    public partial class Advisor_AddCourseToGradPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack) { return; }
            loadStudentList();
            loadCourseList();

        }
        protected void loadStudentList()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand AllStudents = new SqlCommand($"SELECT student_id, CONCAT(student_id, ' ', f_name, ' ', l_name) AS 'All' " +
                    $"FROM Student WHERE advisor_id = {Session["UserID"]}\r\n", connection); // {Session["UserID"]} put in input of fn
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
                Message.Visible = true;
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Text = ex.Message;
            }
            finally { connection.Close(); }
        }
        protected void loadCourseList()
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
                Message.Visible = true;
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Text = ex.Message;
            }
            finally { connection.Close(); }
        }

        protected void AddCourse_Click(object sender, EventArgs e)
        {
            Message.Visible = false;
            string stID = StudentID.SelectedValue;
            string semCode = SemesterCode.Text;
            string cName = CourseName.SelectedValue;

            if(string.IsNullOrEmpty(stID) || string.IsNullOrEmpty(semCode)
                || string.IsNullOrEmpty(cName)) 
            { 
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Visible = true;
                Message.Text = "Invalid Input";
                return;
            }

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand InsertGradPlan = new SqlCommand("Procedures_AdvisorAddCourseGP", connection); // {Session["UserID"]} put in input of fn
                InsertGradPlan.CommandType = CommandType.StoredProcedure;
                connection.Open();

                InsertGradPlan.Parameters.AddWithValue("@student_Id", stID);
                InsertGradPlan.Parameters.AddWithValue("@Semester_code", semCode);
                InsertGradPlan.Parameters.AddWithValue("@course_name", cName);

                int nRowsAffected = InsertGradPlan.ExecuteNonQuery();
                if (nRowsAffected > 0) {
                    Message.Visible = true;
                    Message.ForeColor = System.Drawing.Color.Green;
                    Message.Text = "Succesfully inserted Graduation Plan";
                }
                else
                {
                    Message.Visible = true;
                    Message.ForeColor = System.Drawing.Color.Red;
                    Message.Text = "Unsuccessful";
                }
            }
            catch (Exception ex)
            {
                Message.Visible = true;
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Text = ex.Message;
            }
            finally { connection.Close(); }
        }

        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}