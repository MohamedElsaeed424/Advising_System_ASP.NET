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
    public partial class Admin_viewPaymentDetailsForStudent : System.Web.UI.Page
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
                    SqlCommand viewPay = new SqlCommand("SELECT * FROM Payment P INNER JOIN Student S on S.student_id = P.student_id;", connection);
                    viewPay.CommandType = CommandType.Text; ;
                    connection.Open();

                    SqlDataReader reader = viewPay.ExecuteReader(CommandBehavior.CloseConnection);
                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    ViewPaymentGV.DataSource = dataTable;
                    ViewPaymentGV.DataBind();
                }
                catch (Exception ex) { Console.WriteLine("Error: " + ex.Message); }
                finally { connection.Close(); }
            }

        }
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }

    }
}