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
    public partial class Student_ViewNotPaidInst : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void viewUpcomingInst(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                int studentId = Int16.Parse(TextBox1.Text);
                SqlCommand FN_StudentUpcoming_installment = new SqlCommand("SELECT dbo.FN_StudentUpcoming_installment(@student_ID)", connection);
                FN_StudentUpcoming_installment.CommandType = CommandType.StoredProcedure;
                connection.Open();
                FN_StudentUpcoming_installment.Parameters.AddWithValue("@student_ID", studentId);
                object result = FN_StudentUpcoming_installment.ExecuteScalar();
                Response.Write(" upcoming not paid installment: " + result); 

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