﻿using System;
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
    public partial class Admin_fetchActiveStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            SqlCommand viewAS = new SqlCommand("SELECT * \r\nFROM student \r\nWHERE financial_status = 1;", connection);
            viewAS.CommandType = CommandType.Text; ;
            connection.Open();

            SqlDataReader reader = viewAS.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable dataTable = new DataTable();

            dataTable.Load(reader);

            AllActiveStudents.DataSource = dataTable;
            AllActiveStudents.DataBind();
        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }

    
}