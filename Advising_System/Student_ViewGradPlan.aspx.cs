using System;
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
    public partial class Student_ViewGradPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewGradPlan(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int studentId = Int16.Parse(TextBox1.Text);
                SqlCommand FN_StudentViewGP = new SqlCommand("FN_StudentViewGP", connection);
                FN_StudentViewGP.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataReader reader = FN_StudentViewGP.ExecuteReader(CommandBehavior.CloseConnection);
                FN_StudentViewGP.Parameters.AddWithValue("@student_ID", studentId);
                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/StudentHome.aspx");
        }
    }
}