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
    public partial class Admin_FetchSemWCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);
                try
                {
                    SqlCommand FetchSWC = new SqlCommand("SELECT CS.course_id , c.name AS ' Course name' , CS.semester_code\r\nFROM ((Course_Semester  CS\r\n\t\tINNER JOIN Semester S on S.semester_code = CS.semester_code)\r\n\t\tINNER JOIN course c on c.course_id= CS.course_id );", connection);
                    FetchSWC.CommandType = CommandType.Text; ;
                    connection.Open();

                    SqlDataReader reader = FetchSWC.ExecuteReader(CommandBehavior.CloseConnection);
                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    AllsemWCoursesGV.DataSource = dataTable;
                    AllsemWCoursesGV.DataBind();
                }
                catch(Exception ex) { Console.WriteLine("Error: " + ex.Message); }
                finally { connection.Close(); }
            }

        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}