﻿using System;
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
    public partial class Advisor_AllPendingRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Advisor")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);
                try
                {
                    SqlCommand all_Pending_Requests = new SqlCommand($"SELECT * FROM all_Pending_Requests", connection);
                    all_Pending_Requests.CommandType = CommandType.Text;
                    connection.Open();

                    SqlDataReader reader = all_Pending_Requests.ExecuteReader(CommandBehavior.CloseConnection);

                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    PendingRequests.DataSource = dt;
                    PendingRequests.DataBind();
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                finally { connection.Close(); }
            }

        }
        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }
    }
}