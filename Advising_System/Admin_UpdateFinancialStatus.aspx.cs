using System;
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
    public partial class Admin_UpdateFinancialStatus : System.Web.UI.Page
    {

        public class StudentFS
        {
            public int ID{ get; set; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
            if (!IsPostBack)
            {
                
                BindStudentsToDropDown();
            }

        }

        private void BindStudentsToDropDown()
        {
            List<StudentFS> students = getStudentsFromDatabase();

            AllStudents.DataSource = students;
            AllStudents.DataTextField = "ID";
            AllStudents.DataValueField = "ID";
            AllStudents.DataBind();
            AllStudents.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Student", "0"));

        }


        private List<StudentFS> getStudentsFromDatabase()
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            List<StudentFS> students = new List<StudentFS>();

            using (connection)
            {

                string query = "Select * from Student";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            StudentFS student = new StudentFS
                            {
                                ID = Convert.ToInt16(reader["student_id"])
                            };

                            students.Add(student);
                        }
                    }
                }
            }

            return students;
        }


        

        public void UpdateFinancialStatushelp(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            int studentId = Convert.ToInt32(AllStudents.SelectedValue);
            System.Diagnostics.Debug.WriteLine(studentId);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand Procedure_AdminUpdateStudentStatus = new SqlCommand("Procedure_AdminUpdateStudentStatus", connection))
                {
                    Procedure_AdminUpdateStudentStatus.CommandType = CommandType.StoredProcedure;

                    Procedure_AdminUpdateStudentStatus.Parameters.AddWithValue("@StudentID", studentId);
                    connection.Open();
                    Procedure_AdminUpdateStudentStatus.ExecuteNonQuery();
                }
            }
            

        }




        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}