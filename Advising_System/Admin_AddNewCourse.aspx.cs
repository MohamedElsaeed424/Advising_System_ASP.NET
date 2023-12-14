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
    public partial class Admin_AddNewCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void post_Course(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                string major = CoursemMjorText.Text;
                int semester = Convert.ToInt32(AllSemesters.SelectedValue);
                int creditHours = Convert.ToInt32(AllCreditHours.SelectedValue);
                string courseName = Course_NameText.Text;
                bool isOffered = Trueid.Checked;
                if (string.IsNullOrEmpty(major) || !int.TryParse(AllSemesters.SelectedValue, out semester) ||
                    !int.TryParse(AllCreditHours.SelectedValue, out creditHours) ||
                    string.IsNullOrEmpty(courseName) ||
                      (!Trueid.Checked && !Falseid.Checked))
                {
                    SuccessLabel.Text = "Invalid Input";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
                else
                {
                    using (connection)
                    {
                        using (SqlCommand Procedures_AdminAddingCourse = new SqlCommand("Procedures_AdminAddingCourse", connection))
                        {
                            Procedures_AdminAddingCourse.CommandType = CommandType.StoredProcedure;

                            // Add parameters
                            Procedures_AdminAddingCourse.Parameters.AddWithValue("@major", major);
                            Procedures_AdminAddingCourse.Parameters.AddWithValue("@semester", semester);
                            Procedures_AdminAddingCourse.Parameters.AddWithValue("@credit_hours", creditHours);
                            Procedures_AdminAddingCourse.Parameters.AddWithValue("@name", courseName);
                            Procedures_AdminAddingCourse.Parameters.AddWithValue("@is_offered", isOffered);

                            connection.Open();
                            Procedures_AdminAddingCourse.ExecuteNonQuery();
                           

                           
                            SuccessLabel.Text = "Course added successfully!";
                            SuccessLabel.ForeColor = System.Drawing.Color.Green;

                            
                            Course_NameText.Text = "";
                            CoursemMjorText.Text = "";
                            Trueid.Checked = false;
                            Falseid.Checked = false;
                            AllSemesters.SelectedIndex = 0;
                            AllCreditHours.SelectedIndex = 0;
                        }
                    }
                }

                
            }
            catch (Exception ex)
            {
                SuccessLabel.Text = "Error adding course: " + ex.Message;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                connection.Close();
            }
        }


        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}