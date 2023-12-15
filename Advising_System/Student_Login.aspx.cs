using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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

            try
            {

                string idT = this.StudentID.Text;
                string password = this.password.Text;


                if (string.IsNullOrEmpty(idT) || string.IsNullOrEmpty(password))
                {
                    SuccessLabel.Visible = true;
                    SuccessLabel.Text = "All Fields are required";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
                else
                {
                    using (connection)
                    {
                        int id = Int32.Parse(idT);
                        using (SqlCommand command = new SqlCommand($"SELECT dbo.FN_StudentLogin(@Student_id, @password) AS Success ", connection))
                        {
                           
                            command.Parameters.AddWithValue("@Student_id", id);
                            command.Parameters.AddWithValue("@password", password);
                            


                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            int success = 0;
                            if (reader.Read())
                            {
                                success = Convert.ToInt32(reader["Success"]);

                            }
                            System.Diagnostics.Debug.WriteLine(success);
                            reader.Close();
                            if (success == 1)
                            {
                                Session["UserID"] = id;
                                Session["UserRole"] = "Student";
                                Response.Redirect("/StudentHome.aspx");
                                System.Diagnostics.Debug.WriteLine(Session["UserID"]);
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