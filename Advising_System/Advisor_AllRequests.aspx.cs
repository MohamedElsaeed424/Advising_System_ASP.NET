using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.NetworkInformation;

namespace Advising_System
{
    public partial class Advisor_AllRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                SqlCommand FN_Advisors_Requests = new SqlCommand($"SELECT * FROM FN_Advisors_Requests(8)", connection); // {Session["UserID"]} put in input of fn
                FN_Advisors_Requests.CommandType = CommandType.Text;
                connection.Open();

                SqlDataReader reader = FN_Advisors_Requests.ExecuteReader(CommandBehavior.CloseConnection);

                DataTable dt = new DataTable();
                dt.Load(reader);

                Requests.DataSource = dt;
                Requests.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally { connection.Close(); }
        }
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}