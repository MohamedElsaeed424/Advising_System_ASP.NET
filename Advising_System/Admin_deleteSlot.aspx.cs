using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Advising_System.Admin_issueInstallments;

namespace Advising_System
{
    public partial class Admin_deleteSlot : System.Web.UI.Page
    {
        public class Semester 
        {
            public String Sem_id { get; set; }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                {
                    BindCoursesToDropDown();
                }
            }
        }

        private List<Semester> GetSemestersFromDatabase()
        {

            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            List<Semester> semesters = new List<Semester>();


            using (connection)
            {

                string query = "SELECT * FROM Semester";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            Semester semester = new Semester
                            {
                                Sem_id = Convert.ToString(reader["semester_code"]),
                                
                            };

                            semesters.Add(semester);
                        }
                    }
                }
            }


            return semesters;
        }

        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }
        private void BindCoursesToDropDown()
        {

            List<Semester> semesters = GetSemestersFromDatabase();


            AllSem.DataSource = semesters;
            AllSem.DataTextField = "Sem_id";
            AllSem.DataValueField = "Sem_id";
            AllSem.DataBind();
            AllSem.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Course", "0"));

        }

        protected void post_DeleteSlotFromCourse(object sender, EventArgs e)
        {
            String sem_code = Convert.ToString(AllSem.SelectedValue);
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
                try
                {
                    if (string.IsNullOrEmpty(sem_code))
                    {
                        DisplayErrorMessage("Current Semester cannot be empty");
                        return;
                    }

                    using (SqlCommand Procedures_AdminDeleteSlots =
                           new SqlCommand("Procedures_AdminDeleteSlots", connection))
                    {
                        Procedures_AdminDeleteSlots.CommandType = CommandType.StoredProcedure;

                        Procedures_AdminDeleteSlots.Parameters.AddWithValue("@current_semester", sem_code);
                        connection.Open();
                        Procedures_AdminDeleteSlots.ExecuteNonQuery();
                    }

                    if (string.IsNullOrEmpty(AllSem.SelectedValue) || AllSem.SelectedIndex == 0)
                    {
                        SuccessLabel.Text = "Invalid Input";
                        SuccessLabel.ForeColor = System.Drawing.Color.Red;
                        SuccessLabel.Visible = true;
                    }
                    else
                    {

                        SuccessLabel.Text = "Linking Successful";
                        SuccessLabel.ForeColor = System.Drawing.Color.Green;
                        SuccessLabel.Visible = true;

                    }
                }
                catch (Exception ex)
                {
                    SuccessLabel.Text = "Error: " + ex.Message;
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }

        }

        

       
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }

    }
}