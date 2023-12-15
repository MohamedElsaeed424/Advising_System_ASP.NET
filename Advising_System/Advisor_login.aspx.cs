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
    public partial class Advisor_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            try
            {

                string idT = AdvisorID.Text;
                string password = this.password.Text;


                if (string.IsNullOrEmpty(idT) || string.IsNullOrEmpty(password))
                {

                    SuccessLabel.Text = "All Fields are required";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
                else
                {
                    using (connection)
                    {
                        int id = Int32.Parse(idT);
                        using (SqlCommand command = new SqlCommand($"SELECT dbo.FN_AdvisorLogin(@ID, @password) AS Success ", connection))
                        {
                            SqlCommand getName = new SqlCommand($"SELECT name FROM Advisor WHERE advisor_id = {id}",connection);

                            command.Parameters.AddWithValue("@ID", id);
                            command.Parameters.AddWithValue("@password", password);

                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            int success = 0;
                            if (reader.Read())
                            {
                                success = Convert.ToInt32(reader["Success"]);                                                 
                            }
                            reader.Close();

                            // Get Advisor name
                            reader = getName.ExecuteReader();
                            string name = string.Empty;
                            if (reader.Read())
                            {
                                name = reader["name"].ToString();
                            }
                            reader.Close();

                            if(success == 1)
                            {
                                Session["UserID"] = id;
                                Session["UserRole"] = "Advisor";
                                Session["UserName"] = name;
                                Response.Redirect("/AdvisorHome.aspx");
                            }
                            else
                            {
                                SuccessLabel.Text = "Incorrect Password or Username Please Register First";
                                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                                SuccessLabel.Visible = true;
                            }

                        }
                    }
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
    }
}