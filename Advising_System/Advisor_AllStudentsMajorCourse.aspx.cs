using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Advisor_AllStudentsMajorCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) { return; }
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            try
            {
                SqlCommand getMajors = new SqlCommand("SELECT DISTINCT(major) FROM Student", connection);
                getMajors.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = getMajors.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                majors.DataSource = dt;
                majors.DataTextField = "major";
                majors.DataValueField = "major";
                majors.DataBind();

                majors.Items.Insert(0, new ListItem("Select a major", string.Empty));
                majors.SelectedIndex = 0;
                reader.Close();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
            finally { connection.Close(); }

        }


        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }

        protected void majors_SelectedIndexChanged(object sender, EventArgs e)
        {
            string major = majors.SelectedValue;
            if (string.IsNullOrEmpty(major)) { return; }

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            try
            {
                SqlCommand getStudents = new SqlCommand("Procedures_AdvisorViewAssignedStudents", connection);
                getStudents.CommandType = CommandType.StoredProcedure;

                getStudents.Parameters.AddWithValue("@AdvisorID", 8); // {Session["UserID"]}
                getStudents.Parameters.AddWithValue("@major", major);
                connection.Open();

                SqlDataReader reader = getStudents.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                StudentsWithMajor.DataSource = dt;
                StudentsWithMajor.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
            finally { connection.Close(); }
        }
    }
}