﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Advising_System
{
    public partial class Admin_AddNewSemester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void post_semester(object sender, EventArgs e)
        {
          
            DateTime startDate = Start_Calender.SelectedDate;
            DateTime endDate = End_Calender.SelectedDate;
            string semesterCode = Semester_CodeText.Text;
            if (startDate == DateTime.MinValue || endDate == DateTime.MinValue || string.IsNullOrEmpty(semesterCode))
            {
                Response.Write("Invalid Input");
            }
            else
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);
                using (connection)
                {
                    using (SqlCommand AdminAddingSemester = new SqlCommand("AdminAddingSemester", connection))
                    {
                        AdminAddingSemester.CommandType = CommandType.StoredProcedure;

                        // Add parameters
                        AdminAddingSemester.Parameters.Add(new SqlParameter("@start_date", SqlDbType.Date)).Value = startDate;
                        AdminAddingSemester.Parameters.Add(new SqlParameter("@end_date", SqlDbType.Date)).Value = endDate;
                        AdminAddingSemester.Parameters.Add(new SqlParameter("@semester_code", SqlDbType.VarChar, 40)).Value = semesterCode;

                        try
                        {

                            connection.Open();
                            AdminAddingSemester.ExecuteNonQuery();
                            SuccessLabel.Text = "Semester added successfully!";
                            SuccessLabel.ForeColor = System.Drawing.Color.Green;
                            SuccessLabel.Visible = true;
                            Response.Redirect(Request.Url.AbsoluteUri);

                        }
                        catch (Exception ex)
                        {

                            SuccessLabel.Text = "Error: " + ex.Message;
                            SuccessLabel.ForeColor = System.Drawing.Color.Red;
                            SuccessLabel.Visible = true;
                        }
                        finally
                        {
                            connection.Close();
                        }
                    }
                }
            }
            
        }

        protected void DateSelectionChanged1(object sender, EventArgs e)
        {
            SelectedStartDateLabel1.Text = "Selected Start Date: " + Start_Calender.SelectedDate.ToShortDateString();
         
        }
        protected void DateSelectionChanged2(object sender, EventArgs e)
        {
           
            SelectedEndDateLabel2.Text = "Selected End Date: " + End_Calender.SelectedDate.ToShortDateString();
        }


        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}