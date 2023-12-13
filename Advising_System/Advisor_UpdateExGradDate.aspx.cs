using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace Advising_System
{
    public partial class Advisor_UpdateExGradDate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) { return; }
            loadStudentList();
        }


        protected void UpdateGrad_Click(object sender, EventArgs e)
        {
            Message.Visible = true;
            string stdID = StudentID.SelectedValue;
            string date = ExGradDate.Text;

            if (string.IsNullOrEmpty(stdID) || string.IsNullOrEmpty(date))
            {
                Message.ForeColor = System.Drawing.Color.Red;
                Message.Visible = true;
                Message.Text = "Invalid Input";
                return;
            }
            int stID = Int32.Parse(stdID);

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand UpdateGradDate = new SqlCommand("Procedures_AdvisorUpdateGP", connection); // {Session["UserID"]} put in input of fn
                UpdateGradDate.CommandType = CommandType.StoredProcedure;
                connection.Open();

                UpdateGradDate.Parameters.AddWithValue("@studentID", stID);
                UpdateGradDate.Parameters.AddWithValue("@expected_grad_date", date);

                int nRowsAffected = UpdateGradDate.ExecuteNonQuery();
                if (nRowsAffected > 0)
                {
                    Message.Visible = true;
                    Message.ForeColor = System.Drawing.Color.Green;
                    Message.Text = "Succesfully Updated Graduation Plan";
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
        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}