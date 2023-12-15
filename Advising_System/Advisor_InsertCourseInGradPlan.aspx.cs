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
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Advisor")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                if (IsPostBack) { return; }
                DropDownLoader.loadCourseList(CourseName, Message);
            }


        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            Message.Visible = false;
            string stID = Session["StID"].ToString();
            string semCode = Session["Semester"].ToString();
            string cName = CourseIDs.SelectedValue;

            if (string.IsNullOrEmpty(stID) || string.IsNullOrEmpty(semCode)
                || string.IsNullOrEmpty(cName))
            {
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Visible = true;
                Message.Text = "Invalid Input";
                return;
            }
            int cID = Int32.Parse(cName);

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand DeleteCourseGP = new SqlCommand("Procedures_AdvisorDeleteFromGP", connection); // {Session["UserID"]} put in input of fn
                DeleteCourseGP.CommandType = CommandType.StoredProcedure;
                connection.Open();

                DeleteCourseGP.Parameters.AddWithValue("@studentID", stID);
                DeleteCourseGP.Parameters.AddWithValue("@semesterCode", semCode);
                DeleteCourseGP.Parameters.AddWithValue("@courseID", cID);

                int nRowsAffected = DeleteCourseGP.ExecuteNonQuery();
                if (nRowsAffected > 0)
                {
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
        protected void AddCourse_Click(object sender, EventArgs e)
        {
            Message.Visible = false;
            string cName = CourseName.SelectedValue;

            if(string.IsNullOrEmpty(cName)) 
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
                SqlCommand InsertGradPlan = new SqlCommand("Procedures_AdvisorAddCourseGP", connection); 
                InsertGradPlan.CommandType = CommandType.StoredProcedure;
                connection.Open();

                InsertGradPlan.Parameters.AddWithValue("@student_Id", Session["StID"]);
                InsertGradPlan.Parameters.AddWithValue("@Semester_code", Session["Semester"]);
                InsertGradPlan.Parameters.AddWithValue("@course_name", cName);

                int nRowsAffected = InsertGradPlan.ExecuteNonQuery();
                if (nRowsAffected > 0) {
                    Message.Visible = true;
                    Message.ForeColor = System.Drawing.Color.Green;
                    Message.Text = "Succesfully inserted Graduation Plan";
                    updateGrid();
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
        protected void updateGrid()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand command = new SqlCommand($"SELECT * FROM FN_StudentViewGP({Session["StID"]}) WHERE [graduation Plan Id] = {Session["Plan"]}", connection); //type LIKE 'course
                command.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                GradCourse.DataSource = dt;
                GradCourse.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                DropDownLoader.DisplayErrorMessage(Message, ex.Message);
            }
            finally { connection.Close(); }
        }

        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}