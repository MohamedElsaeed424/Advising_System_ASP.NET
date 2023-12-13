using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Advisor_AddCourseToGradPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand AllStudents = new SqlCommand($"SELECT student_id, CONCAT(student_id, ' ', f_name, ' ', l_name) AS 'All' " +
                    $"FROM Student WHERE advisor_id = 8\r\n", connection); // {Session["UserID"]} put in input of fn
                AllStudents.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = AllStudents.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                StudentID.DataSource = dt;
                StudentID.DataTextField = "All";
                StudentID.DataValueField = "student_id";
                StudentID.DataBind();

                StudentID.Items.Insert(0, new ListItem("Select a major", string.Empty));
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
}