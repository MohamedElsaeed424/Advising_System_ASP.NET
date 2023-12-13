using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterStudent(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            try
            {
                
                string firstName = first_name.Text;
                string lastName = last_name.Text;
                string password = this.password.Text;
                string faculty = this.faculty.SelectedValue;
                string major = this.major.SelectedValue;
                int semester = Convert.ToInt32(this.semester.SelectedValue);

               
                if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(faculty) || string.IsNullOrEmpty(major))
                {
                   
                    SuccessLabel.Text = "Error: All fields are required.";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
                else
                {
                    int studentId;
                    using (connection)
                    {
                        using (SqlCommand command = new SqlCommand("Procedures_StudentRegistration", connection))
                        {
                            command.CommandType = System.Data.CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@first_name", firstName);
                            command.Parameters.AddWithValue("@last_name", lastName);
                            command.Parameters.AddWithValue("@password", password);
                            command.Parameters.AddWithValue("@faculty", faculty);
                            command.Parameters.AddWithValue("@major", major);
                            command.Parameters.AddWithValue("@Semester", semester);

                            command.Parameters.Add("@Student_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                            connection.Open();
                            command.ExecuteNonQuery();


                            studentId = Convert.ToInt32(command.Parameters["@Student_id"].Value);
                        }
                    }


                    SuccessLabel.Text = $"Registration successful. Your Student ID is {studentId}.";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                    SuccessLabel.Visible = true;


                    ClearFormFields();
                }
            }      
            catch (Exception ex)
            {
               
                SuccessLabel.Text = $"Error: {ex.Message}";
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;
            }
            finally
            {
                connection.Close();
            }
        }

        private void ClearFormFields()
        {
            first_name.Text = string.Empty;
            last_name.Text = string.Empty;
            password.Text = string.Empty;
            faculty.SelectedIndex = 0;
            major.SelectedIndex = 0;
            semester.SelectedIndex = 0;

        }
    }
}
