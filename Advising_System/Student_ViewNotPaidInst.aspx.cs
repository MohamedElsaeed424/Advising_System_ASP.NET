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
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);
                try
                {
                    int studentId = Convert.ToInt32(Session["UserID"]);
                    SqlCommand FN_StudentUpcoming_installment = new SqlCommand("SELECT dbo.FN_StudentUpcoming_installment(@student_ID) as Date", connection);

                    connection.Open();
                    FN_StudentUpcoming_installment.Parameters.AddWithValue("@student_ID", studentId);
                    string result = FN_StudentUpcoming_installment.ExecuteScalar().ToString();
                    Label4.Text = "Upcoming not paid installment: " + result;


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
        }
        
       
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/StudentHome.aspx");
        }
    }
}