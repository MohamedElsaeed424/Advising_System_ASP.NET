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
        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Visible = true;
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }
        protected void SearchForSlots(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int courseID;
                if (!int.TryParse(TextBox1.Text, out courseID))
                {
                    DisplayErrorMessage("Invalid Course ID. Please enter a valid numeric value.");
                    return;
                }
                int insructorID;
                if (!int.TryParse(TextBox2.Text, out insructorID))
                {
                    DisplayErrorMessage("Invalid Insructor ID. Please enter a valid numeric value.");
                    return;
                }
                else
                {
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
                    SuccessLabel.Visible = true;
                    SuccessLabel.Text = "Viewed successfully!";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                SuccessLabel.Visible = true;
                SuccessLabel.Text = "Error while view: " + ex.Message;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
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