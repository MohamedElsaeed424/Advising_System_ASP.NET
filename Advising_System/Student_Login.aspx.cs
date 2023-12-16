using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Advising_System.Admin_LinkStudentAdvisor;

namespace Advising_System
{
    public partial class Student_Login : System.Web.UI.Page
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

        protected void Login_Click(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            System.Diagnostics.Debug.WriteLine(1);

            try
            {

                string idT = this.StudentID.Text;
                string password = this.password.Text;
                System.Diagnostics.Debug.WriteLine(2);

                if (string.IsNullOrEmpty(idT) || string.IsNullOrEmpty(password))
                {
                    SuccessLabel.Visible = true;
                    SuccessLabel.Text = "All Fields are required";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                    System.Diagnostics.Debug.WriteLine(3);
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine(4);
                    using (connection)
                    {
                        int id = Int32.Parse(idT);
                        using (SqlCommand command = new SqlCommand($"SELECT dbo.FN_StudentLogin(@Student_id, @password) AS Success ", connection))
                        {
                           
                            command.Parameters.AddWithValue("@Student_id", id);
                            command.Parameters.AddWithValue("@password", password);

                            SqlCommand getName = new SqlCommand($"SELECT f_name + ' ' + l_name as name FROM Student WHERE student_id = {id}", connection);

                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            int success = 0;
                            if (reader.Read())
                            {
                                success = Convert.ToInt32(reader["Success"]);
                                System.Diagnostics.Debug.WriteLine(5);
                            }
                            reader.Close();
                            // gets Student's name
                            reader = getName.ExecuteReader();
                            string name = string.Empty;
                            if (reader.Read())
                            {
                                name = reader["name"].ToString();
                            }
                            reader.Close();
                            if (success == 1)
                            {
                                System.Diagnostics.Debug.WriteLine(7);
                                Session["UserID"] = id;
                                Session["UserRole"] = "Student";
                                Session["UserName"] = name;
                                System.Diagnostics.Debug.WriteLine(Session["UserID"]);
                                Response.Redirect("/StudentHome.aspx");

                            }
                            else
                            {
                                SuccessLabel.Visible = true;
                                SuccessLabel.Text = "Incorrect Password or UserID Please Register First";
                                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                                SuccessLabel.Visible = true;
                            }

                        }
                    }
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
    }
}