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