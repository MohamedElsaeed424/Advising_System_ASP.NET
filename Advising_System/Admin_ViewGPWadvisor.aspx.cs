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
	public partial class Admin_viewGPWadvisor : System.Web.UI.Page
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

                SqlCommand ViewGP = new SqlCommand("SELECT * FROM Graduation_Plan GP INNER JOIN Advisor A on A.advisor_id = GP.advisor_id;", connection);
                ViewGP.CommandType = CommandType.Text; ;
                connection.Open();

                SqlDataReader reader = ViewGP.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                ViewGPgridView.DataSource = dataTable;
                ViewGPgridView.DataBind();
            }

        }
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }

    }
}