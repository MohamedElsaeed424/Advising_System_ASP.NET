using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics.PerformanceData;

namespace Advising_System
{
    public partial class Advisor_InsertGradPlan : System.Web.UI.Page
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
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);
                try
                {
                    SqlCommand AllStudents = new SqlCommand($"SELECT student_id, CONCAT(student_id, '- ', f_name, ' ', l_name) AS 'All' " +
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
                    Console.WriteLine(ex.ToString());
                }
                finally { connection.Close(); }
            }

        }

        protected void CreateGrad_Click(object sender, EventArgs e)
        {
            Error.Visible = false;
            string semCode = semesterCode.Text;
            string gradDate = ExGradDate.Text;
            string CH = semCH.Text;
            int advisorID = 8; // session["UserID"]
            string StdID = StudentID.SelectedValue;

            if(string.IsNullOrEmpty(semCode) || string.IsNullOrEmpty(gradDate)
                || string.IsNullOrEmpty(CH) || string.IsNullOrEmpty(StdID)) 
            {
                Error.ForeColor = System.Drawing.Color.Red;
                Error.Visible = true;
                Error.Text = "Invalid Input";
                return;
            }
            int StID = Int32.Parse(StdID);

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand InsertGradPlan = new SqlCommand("Procedures_AdvisorCreateGP", connection); // {Session["UserID"]} put in input of fn
                InsertGradPlan.CommandType = CommandType.StoredProcedure;
                connection.Open();

                InsertGradPlan.Parameters.AddWithValue("@Semestercode", semCode);
                InsertGradPlan.Parameters.AddWithValue("@expected_graduation_date", gradDate);
                InsertGradPlan.Parameters.AddWithValue("@sem_credit_hours", CH);
                InsertGradPlan.Parameters.AddWithValue("@advisorid", advisorID);
                InsertGradPlan.Parameters.AddWithValue("@studentid", StID);

                int nRowsAffected = InsertGradPlan.ExecuteNonQuery();
                if(nRowsAffected > 0)
                {
                    Error.Visible = true;
                    Error.ForeColor = System.Drawing.Color.Green;
                    Error.Text = "Succesfully inserted Graduation Plan";
                }
                else
                {
                    Error.Visible = true;
                    Error.ForeColor = System.Drawing.Color.Red;
                    Error.Text = "Student doesn't have enough credit hours";
                }

                
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
            finally { connection.Close(); }


        }
        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}