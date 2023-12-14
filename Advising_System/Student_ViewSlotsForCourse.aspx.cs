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
    public partial class Student_ViewSlotsForCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("/404Page.aspx");
            }
        }
        protected void SearchForSlots(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int courseID = Int16.Parse(TextBox1.Text);
                int insructorID = Int16.Parse(TextBox2.Text);
                SqlCommand FN_StudentViewSlot = new SqlCommand("SELECT * FROM FN_StudentViewSlot(@CourseID,@InstructorID);", connection);
                FN_StudentViewSlot.CommandType = CommandType.Text;
                connection.Open();
                FN_StudentViewSlot.Parameters.AddWithValue("@CourseID", courseID);
                FN_StudentViewSlot.Parameters.AddWithValue("@InstructorID", insructorID);
                SqlDataReader reader = FN_StudentViewSlot.ExecuteReader(CommandBehavior.CloseConnection);
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