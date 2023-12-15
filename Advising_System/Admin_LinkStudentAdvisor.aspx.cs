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
    public partial class Admin_LinkStudentAdvisor : System.Web.UI.Page
    {
        public class Student
        {
            public int StudentId { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string FullName => $"{FirstName} {LastName}";
            
        }

        public class Advisor
        {
            public int AdvisorId { get; set; }
            public string Name { get; set; }
           
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
                BindAdvisorsToDropDown();
            }
        }
        private void BindStudentsToDropDown()
        {
            List<Student> students = GetStudentsFromDatabase();

            AllStuendents.DataSource = students;
            AllStuendents.DataTextField = "FullName"; 
            AllStuendents.DataValueField = "StudentId";
            AllStuendents.DataBind();
            AllStuendents.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Student", "0"));
        }
        private void BindAdvisorsToDropDown()
        {
            List<Advisor> advisors = GetAdvisorsFromDatabase();

            AllAdvisors.DataSource = advisors;
            AllAdvisors.DataTextField = "Name";
            AllAdvisors.DataValueField = "AdvisorId";
            AllAdvisors.DataBind();
            AllAdvisors.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Advisor", "0"));
        }
        private List<Student> GetStudentsFromDatabase()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            List<Student> students = new List<Student>();

            using (connection)
            {
                string query = "SELECT student_id, f_name, l_name FROM Student";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Student student = new Student
                            {
                                StudentId = Convert.ToInt32(reader["student_id"]),
                                FirstName = Convert.ToString(reader["f_name"]),
                                LastName = Convert.ToString(reader["l_name"])
                            };

                            students.Add(student);
                        }
                    }
                }
            }

            return students;
        }

        private List<Advisor> GetAdvisorsFromDatabase()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            List<Advisor> advisors = new List<Advisor>();

            using (connection)
            {
                string query = "SELECT advisor_id, name FROM Advisor";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Advisor advisor = new Advisor
                            {
                                AdvisorId = Convert.ToInt32(reader["advisor_id"]),
                                Name = Convert.ToString(reader["name"])
                            };

                            advisors.Add(advisor);
                        }
                    }
                }
            }

            return advisors;
        }
        private void LinkStudentToAdvisor1(int studentId, int advisorId)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand Procedures_AdminLinkStudentToAdvisor = new SqlCommand("Procedures_AdminLinkStudentToAdvisor", connection))
                {
                    Procedures_AdminLinkStudentToAdvisor.CommandType = CommandType.StoredProcedure;

                    Procedures_AdminLinkStudentToAdvisor.Parameters.AddWithValue("@studentID", studentId);
                    Procedures_AdminLinkStudentToAdvisor.Parameters.AddWithValue("@advisorID", advisorId);

                    connection.Open();
                    Procedures_AdminLinkStudentToAdvisor.ExecuteNonQuery();
                }
            }
        }
        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }
        protected void post_LinkStudentToAdvisor(object sender, EventArgs e)
        {
            try
            {
                int studentId, advisorId;

                if (!int.TryParse(AllStuendents.SelectedValue?.ToString(), out studentId) || studentId <= 0)
                {
                    DisplayErrorMessage("Invalid Student Selection");
                    return;
                }

                if (!int.TryParse(AllAdvisors.SelectedValue?.ToString(), out advisorId) || advisorId <= 0)
                {
                    DisplayErrorMessage("Invalid Advisor Selection");
                    return;
                }


                LinkStudentToAdvisor1(studentId, advisorId);

                    SuccessLabel.Text = "Linking Successful";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                    SuccessLabel.Visible = true;

                    AllStuendents.SelectedIndex = 0;
                    AllAdvisors.SelectedIndex = 0;

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