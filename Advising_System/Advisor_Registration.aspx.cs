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
    public partial class Advisor_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void Register_Click(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            try
            {

                string name = AdvisorName.Text;
                string office = this.office.Text;
                string email = this.email.Text;
                string password = this.password.Text;


                if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(office)
                    || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(email))
                {

                    SuccessLabel.Text = "Check your input Fields";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
                else if (IsEmailExists(email))
                {
                    SuccessLabel.Text = "Error: Email already exists.";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                    return;
                }
                else
                {
                    int AdvisorId;
                    using (connection)
                    {
                        using (SqlCommand command = new SqlCommand("Procedures_AdvisorRegistration", connection))
                        {
                            command.CommandType = System.Data.CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@name", name);
                            command.Parameters.AddWithValue("@office", office);
                            command.Parameters.AddWithValue("@password", password);
                            command.Parameters.AddWithValue("@email", email);

                            command.Parameters.Add("@advisor_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                            connection.Open();
                            command.ExecuteNonQuery();


                            AdvisorId = Convert.ToInt32(command.Parameters["@advisor_id"].Value);
                        }
                    }


                    SuccessLabel.Text = $"Registration successful. Your Advisor ID is {AdvisorId}.";
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
            AdvisorName.Text = string.Empty;
            office.Text = string.Empty;
            password.Text = string.Empty;
            email.Text = string.Empty;
        }
    }
}