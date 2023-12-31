﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Advising_System
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        private void DisplayErrorMessage(string message)
        {
            SuccessLabel.Visible = true;
            SuccessLabel.Text = "Error: " + message;
            SuccessLabel.ForeColor = System.Drawing.Color.Red;
            SuccessLabel.Visible = true;
        }
        protected bool IsEmailExists(string email)
        {
            bool emailExists = false;

            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString()))
            {
                using (SqlCommand command = new SqlCommand("SELECT 1 FROM Student WHERE email = @email", connection))
                {
                    command.Parameters.AddWithValue("@email", email);

                    connection.Open();


                    object result = command.ExecuteScalar();

       
                    emailExists = result != null;
                }
            }

            return emailExists;
        }

        protected void RegisterStudent(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            try
            {
                
                string firstName = first_name.Text;
                string lastName = last_name.Text;
                string email = this.email.Text;
                string password = this.password.Text;
                string faculty = this.faculty.SelectedValue;
                string major = this.major.SelectedValue;
                string semesterTemp = this.semester.SelectedValue;

                if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) 
                    || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(faculty) 
                    || string.IsNullOrEmpty(major) || string.IsNullOrEmpty(semesterTemp)
                    || string.IsNullOrEmpty(email))
                {
                    SuccessLabel.Visible = true;
                    SuccessLabel.Text = "Check your input Fields";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }else if(IsEmailExists(email))
                {
                        SuccessLabel.Visible = true;
                        SuccessLabel.Text = "Error: Email already exists.";
                        SuccessLabel.ForeColor = System.Drawing.Color.Red;
                        SuccessLabel.Visible = true;
                        return;
                }else
                {
                    int semester = Convert.ToInt32(semesterTemp);
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
                            command.Parameters.AddWithValue("@email", email);
                            command.Parameters.AddWithValue("@major", major);
                            command.Parameters.AddWithValue("@Semester", semester);

                            command.Parameters.Add("@Student_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                            connection.Open();
                            command.ExecuteNonQuery();


                            studentId = Convert.ToInt32(command.Parameters["@Student_id"].Value);
                        }
                    }

                    SuccessLabel.Visible = true;
                    SuccessLabel.Text = $"Registration successful. Your Student ID is {studentId}.";
                    SuccessLabel.ForeColor = System.Drawing.Color.Green;
                    SuccessLabel.Visible = true;


                    ClearFormFields();
                    Response.Redirect("/Student_Login.aspx");
                }
            }      
            catch (Exception ex)
            {
                SuccessLabel.Visible = true;
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
        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/StudentHome.aspx");
        }

        protected void faculty_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selected = faculty.SelectedValue;
            major.Items.Clear();
            major.Items.Insert(0, new ListItem("Select Major", string.Empty));
            major.SelectedIndex = 0;
            switch(selected)
            {
                case "media":
                    addOption( "Computer Science and Engineering");
                    addOption( "Digital Media Engineering and Technology");
                    break;
                case "information":
                    addOption( "Networks");
                    addOption( "Communications");
                    addOption( "Electronics");
                    break;
                case "engineering":
                    addOption( "Materials Engineering");
                    addOption( "Design and Production Engineering");
                    addOption( "Mechatronics Engineering");
                    addOption( "Civil Engineering");
                    addOption( "Architecture Engineering");
                    break;
                case "pharmacy":
                    addOption( "Pharmacy & Biotechnology");
                    addOption( "Biotechnology");
                    break;
                case "management":
                    addOption( "General Management");
                    addOption( "Business Informatics");
                    addOption( "Technology-based Management");
                    break;
                case "applied":
                    addOption( "Graphic Design");
                    addOption( "Media Design");
                    addOption( "Product Design");
                    break;
                case "law":
                    addOption( "Law and Legal Studies");
                    break;
                default:
                    break;
            }
        }
        protected void addOption(String text) {
            ListItem newItem = new ListItem(text, text);
            major.Items.Add(newItem);
        }
    }
}
